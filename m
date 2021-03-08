Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA21330E8D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 13:42:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94897.178852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFD4-0007ya-AR; Mon, 08 Mar 2021 12:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94897.178852; Mon, 08 Mar 2021 12:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFD4-0007yB-7I; Mon, 08 Mar 2021 12:42:06 +0000
Received: by outflank-mailman (input) for mailman id 94897;
 Mon, 08 Mar 2021 12:42:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wBqT=IG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lJFD2-0007y6-CR
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 12:42:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 43e0bea2-2d3c-4f1c-989b-9ed54fbde9bc;
 Mon, 08 Mar 2021 12:42:03 +0000 (UTC)
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
X-Inumbo-ID: 43e0bea2-2d3c-4f1c-989b-9ed54fbde9bc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615207323;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lwxeJff5SaXjLDtgN2ejyA9c7MROSOwFhLK7111f6Fc=;
  b=GWNz3ydirj2apjMDHiJCFPAbUWJf2YbE/y0G/C0edt4F1aPI9yUHGU6W
   Y/5C7w6/tb1OBXyIMnwJ8zAMVyNQQHidC4hw+ovjRIalJCByF40r/THus
   NkjIKRhijVGYMCbaKCRwlRXeIpklbCEnmvTFVmMIVu2aKKJZgW7yiS7d4
   A=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kvrbRWJx3leiZ33IvBAeNus7VdebHLLuE6WsAgcjoK4OkTy8pP7OJJHzYWC8l2uouyTui70n73
 sF9gAD56ER+czKAbbUKwWJfQLbeyQhaBmZyml0rzl48m8JmvGKNjWtVfg+fWIAsfGljjoFMzUD
 +jAOzYSXN8NLfVyn54SCTgIOqUy6cnmUy9e2GaUvf5seYEZesXT9RjU4Y/t4nLbmmz+F0e3b6J
 6ygDRi+rjlYJG+EmwtZUXx7aZzaNwe1jSLbifLhqdZD6Le6Mkbkxa6ka+/VimacM45i/BnDxpV
 WkE=
X-SBRS: 5.2
X-MesageID: 38944955
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,232,1610427600"; 
   d="scan'208";a="38944955"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0aY7Zp7SO2HV0oat3IjFA6eKsTD25uAJDwVud71I6zv/owij27yULov3UN0ypd64wPjEpLUbG2LUpsIAh3VKOkiKjmOBCt9ETDVZL2BG6kPO8r+aIGNLOcg88unl9VKALK8bziNmBi9vpEsv8EEivGlRPuLXeS+Xnift7TwuwNsvLxDYPpltS6zYafhvWW8XtvfnbPdcn3IrEJf+3H7ozNI6G5iaG/a3nKVrB69Qr9p3LWY01GDN/gBf7CWN3qI9gwi4ndYVx2CRUJEdEWr3LJRtBQbL5VxD3giRCRw7Nld2gkS27bjpk3xOIwfwo0YbourQNAitVNUVddNsOtdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwxeJff5SaXjLDtgN2ejyA9c7MROSOwFhLK7111f6Fc=;
 b=VFSf6GVwoIw0nTUeBGQFM2A9WCQ1S1UapFrCTBLCNailZLmyRkFiKsNiJi1CTOka0McbpX9aT3nk7wN8DD8Vsw7mcyClvVBdEhgFdxtLChtKPpqKUGjgy+arEH96lkaBDavGkWkzsnGYE+WZHPNltm9jzyrsbEuXiyCaG1EsbA+b/pBudATVl1d+uiVs1mlfcN4GCSix0k6r3gZxCmbmxnJZddAotm+mmJCtaVG6TszHc7hr9tQ/twIP3y8xFTUzSC3AEnVisELPChoizePP7pT1y9VdlTTVYKqGvbl4Za8tro8trgrQTVjsMww4+reKAwsoCxBGRPHG6f4qfCaNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lwxeJff5SaXjLDtgN2ejyA9c7MROSOwFhLK7111f6Fc=;
 b=S+XmUD3cUFgWa0bIun7QvPMyLczSJ1Z9gL4r0MvgwJZR89iyGous4kNlZTOhOksuk2+Em/Pl/BR+GYHlfFzNm07z3S/ASKzdOowa0wIRtv+3aUpoSAYTr+t7mJbghV5xB3uxE9PhqIesB3/2QA2R4MdLkBwzSWqup3t1uilBHnM=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
Message-ID: <d4e927da-97ee-d4ca-2407-03793f2f4c24@citrix.com>
Date: Mon, 8 Mar 2021 12:41:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0472.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::28) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd4744e6-60c3-4bad-f6ca-08d8e22f8092
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5727:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5727E7422F7E8A9258A9D158BA939@SJ0PR03MB5727.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eOYeKGftNBjRvKN8s/z+MpJk1n4Hx8C5MJZGBYfVk4c5WtFnQlmITo/RHSn1MPc+tTLYFoY6+PMXasQuVsk9cSVJ1PK9RDevc5q7Tvxgj41ipKYSDwE/BnZyKOsYN0a3M2qq1F3Do88cONrAwFjbnTWpO1U8g0XliYfbE5KJhhtJmr+CTHpDhWnCrjDu3+ykKWUd7EZqJlFkdn5a08krqFOpx94LpYtzM72f2tTah9wmRFqp7h2vItCS8aVIFs+p4Frm+9+vJqcQYI2qGnRJK6g0NfKkQN3EWx8JYlqSJLI9d33MyP/EELPA/SsraA6OxUCLgcAuIHgqUaJQra51TWPgu7pljANUh4XM6+0rIXRIwkR6vKUnoWV8QI4xdboXFVjaDWlnCWJ+w/9rqeYl0cnFyjGcaYdSHbyX07X98gbDOTBrpV80wL9tutj8Guw49MtHFJRTRmIcrvvf1IRDn/IoWuAb3HF84/JdGsNdSqQgBY57wGzurJCBUiEG+ORS5qgZ26vrq6Qk0eOvL79krJoM1FTEI2s8mfNvx6EOOl+3pvo0HvK10qRtZk9Tpx6fXHi4EEG81mqGp41ArxTli8KOmcBL9B1Kj2KRkgjg7xQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(366004)(346002)(4326008)(8676002)(316002)(53546011)(186003)(54906003)(2616005)(36756003)(86362001)(8936002)(66556008)(6486002)(16576012)(478600001)(83380400001)(110136005)(956004)(5660300002)(31696002)(6666004)(66946007)(2906002)(4744005)(31686004)(26005)(16526019)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ckdtNVVPVmRJUlhNQ0QwUDBLeDRlT0hmMXlSVHdPbW02bHJhSnVoSDIwcDJx?=
 =?utf-8?B?QjZGR0RHdzNIQjZKcHZJMXgxV3N1STY2dnFKWXpRY1hnS29ldmxXZjNNcmpI?=
 =?utf-8?B?am1yUWF3RnRVUVlmOVc5NFRvR0k2VVZTckZFVU5DL0I4R3d4QnlrMXdSWWF2?=
 =?utf-8?B?Z0tRQndqWFpOa2pMQVRTcElXN0pzdjRTME5EZWJWL3RlTTc4RnBqbStKSDRu?=
 =?utf-8?B?VWhQRE9HSEVZZVR1a0k1ckV0b0xINW91c2phcDBLSCtBcjJvSzVvaUFWNERI?=
 =?utf-8?B?S3FpcXRMdzlsQnA1dEs1c3pZUzQyV09uMlgzZ0xvZC8vNXNmVnB5YjBzTVZ3?=
 =?utf-8?B?K1RXSWZ6WGs1SHhXbmlsTzBSOXdNU2JvYTZpMThPc0EzOXZFakRjVmIzQXpS?=
 =?utf-8?B?a2hDdi9PVldIYTMxbm15SkEvZUZvSmFROUlEd2c4S2tHZUdHZGNoY29kcDVV?=
 =?utf-8?B?bGZtR21ubG0yV0lNN1NUczE3SGpIdUk5K2VKSnY1SWQzNjAxVzFGS005UWhQ?=
 =?utf-8?B?NDd3SVI3RmVROVVVM292ZVJGdHNLakJUb0RWOE5nVFVXNURXMzl6elp4S2FE?=
 =?utf-8?B?dXhWMXYzTmVoWjVnNGxVZ1Q0eVVRYm8wVWhjREoyS3lOdHVnVlhOVGZpNXV4?=
 =?utf-8?B?RzVxMWFyTUZ6enhvNlhpTERmbUNsWFFwMGVZbXVmSHJyU21MT2JpMEVndnhw?=
 =?utf-8?B?aVR1MlFRelI0U1NsUUpYcXhKa1hHa1QzcG5QbTNXdUZwbTV4U3o5VlJKdFRU?=
 =?utf-8?B?anVtYkY3V2ZQRUswT1ZQSVFVNGhzNjVWQ09uci9jM3VoZGV0V2pUUFdUMDg4?=
 =?utf-8?B?NkRIK29iTU9YUjZIK3Jsc3EwRmREdlhFdC9zY2dQWVJqZWV0T2FLYmYxemZR?=
 =?utf-8?B?YkdldFBLQTJ2TUplbXBXWVR5alkxZi9LOWRLbHJzanduUG5IYklpaU5DclJq?=
 =?utf-8?B?Ulc0VkJwaGY4aEdNMXk3cUIwR3FuNk40U2JrL3Vwd1k4R0g1MEdLYU1WL2xN?=
 =?utf-8?B?S3lxKzM2K3NPdjdOc0Z6SnFnbU1jb2NtVTA5eFA3VGdyMDBTTDNJcmFlUWh6?=
 =?utf-8?B?TEl0NU5nYnhpS3g4RHJwOUJUR3I3SkJqMzlYRVExNUl2NGpXbEoxd1haZEsz?=
 =?utf-8?B?TGZJQ2F0Z1dkSCtTb3JwdytoTG56Q0hVNzdVNmQ0cWtLSzRaMlNodE1ITElr?=
 =?utf-8?B?NGQ1OVJra3FYeXJuaVJTdjRaQm5WM3RJV3JPUzB5dWhLN0xWRndQM21KWmNL?=
 =?utf-8?B?c21IMXM3SCtuSUFDSStIa0F4anRhZXljL3pidUM2T3J2WGx2QWpCblptWXB0?=
 =?utf-8?B?K2ZsdGh2NlNKalJwN0xseldOTHlqWUJra1BjUy9sL2hRNkpnUWxuMnNLb2tC?=
 =?utf-8?B?eG5JOHBYOUZsSUorRWFoeVdWekdxQVVac3A0K0Zja2h5SXNMc3laMjRSUkJZ?=
 =?utf-8?B?SnZyY2F4Z0pJdHpqTytyQlFWdDJBcnlKcGV3UWt4UkszUUFvTmNzMVFXQTNh?=
 =?utf-8?B?SG1kUUE3clhSc2tuVGo5YSsxYUMzZy9BdkFHS0dyNllYWWg3TFpST0EydnNs?=
 =?utf-8?B?WWR4S3VWQ2xBS1NHb21YUUQ4RnBHdC9heHFTUEtSbEtHWDh2OFRGMnNDS1E1?=
 =?utf-8?B?Nmc3ZE9YUjhQRTVoUlBiaTVpZlZ6dk9IS1RtdXZRWkxWN3NnMmNROURVQU1F?=
 =?utf-8?B?QkhseExSczJEZ3VVcmlaUEthNmthUzVTb0ZxTk5IUVJ3cEhhRmRCSDBpVTlJ?=
 =?utf-8?Q?dEGHrScCEDvCNJ58+NsDOOcbDtwryuoh6FRr8qg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4744e6-60c3-4bad-f6ca-08d8e22f8092
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 12:41:32.2719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJYOHkkgW+mBk/XYGOPyJ+671rdcziJa7b7+4mmz+ZGsNaBQg/fKen+ImG67gOttO25x1xnd7HZ+ucT8STVYZco41eJTA1UFufz+PU1P1rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5727
X-OriginatorOrg: citrix.com

On 05/03/2021 09:50, Jan Beulich wrote:
> Linux has been warning ("firmware bug") about this bit being clear for a
> long time. While writable in older hardware it has been readonly on more
> than just most recent hardware. For simplicitly report it always set (if
> anything we may want to log the issue ourselves if it turns out to be
> clear on older hardware).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I realise Linux is complaining, but simply setting the bit isn't a fix.

This needs corresponding updates in the ACPI tables, as well as Pstate
MSRs, or Linux will derive a false relationship between the TSC rate and
wallclock.

~Andrew


