Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD65C3023C4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jan 2021 11:41:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73999.133008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zJ5-0001Cr-4r; Mon, 25 Jan 2021 10:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73999.133008; Mon, 25 Jan 2021 10:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3zJ5-0001C7-0D; Mon, 25 Jan 2021 10:41:15 +0000
Received: by outflank-mailman (input) for mailman id 73999;
 Mon, 25 Jan 2021 10:41:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F5Bc=G4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l3zJ3-0001BV-0q
 for xen-devel@lists.xenproject.org; Mon, 25 Jan 2021 10:41:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a95fe604-d342-4218-ad49-0cf4f67f0c30;
 Mon, 25 Jan 2021 10:41:11 +0000 (UTC)
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
X-Inumbo-ID: a95fe604-d342-4218-ad49-0cf4f67f0c30
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611571271;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qvy7hGr4a4fUni3Y0CLqa44PJuYz02SDENvdoydSYug=;
  b=Wl7q8ZFVTH39lofQIEuKiPxWxmj+nvp3b8RCkCjOZKVgCfdqB1NrPhrq
   5BxanI2AJWdtWVKt9U/2XjEsX5q20u9EG0I18wOIq/JOAYPxyGfcnFn67
   UF3q4+fnx1C4FKI71N5ZxiDT54d0qVAnj8EyD6Uo51V3vVvT0jgAwlfFO
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ECVuIMJ6qhn/k4YM9wWciLBMk9VTUKiaxKgqHIXQeb5fgpjiqhr5Eu1Kd5J0sQUJKltc4c9XTx
 9XmkDNvYbITvQe8HevvRmoYMGhEeveYCeNmEyHBwSxBn/pjZTrvECx88Nk6lO2Y+ttKeZLNqKN
 BYlpI5AP7v6ZjK+7sM+NXKk2wWziC+2SvRu1CoDKNh53lFVm1NoI961+CY+8dtLWL1h/HW3ymi
 iuTQ6zHaslXz5JeujxfC4Hb7tHRMoqYJVZqiCQbPvD1AEi4loYKGj1TVPc2516NTpoKbuArRq6
 WZI=
X-SBRS: 5.2
X-MesageID: 37081939
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,373,1602561600"; 
   d="scan'208";a="37081939"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCjXCtSJkoBJR39sKclJ8vDezcjA1N8bmb56qVWxINKDec4Lsam/xIGtughXBFWb3fpIoTu0UgN1fd9LXP+LF7jfGllo36yiU8wes2C/6IBWIWfLj2WvwlmHy+nwAo2gtIzfh5M3Er+FwMf9N3IIS7litnWz1GdmH4Dgk6BuGWRrD3ajWZ+mhcSgK+4wjvrq7NWtUxXRheeiw7YA0/UxQP+J2SwDE/mkCpfT4D7lhG7EP2+vnasbDrOU2c21xWa25hAOgUyqkcE6rejwwDOpfBOIxfR2GwbRyaXdeh8aDL+ccvbl+5B4qRmg+qY88eLCse6znpd7uiBh+JXPNO9T+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvy7hGr4a4fUni3Y0CLqa44PJuYz02SDENvdoydSYug=;
 b=UpcZ+XBczvHZT5I5gAmUrsD4tEEznJjP6jN2XFpR3YvvB07SPavA/A2NHo+G6JJMwOBIQfJARvpnau0ZeUYahLuzty1lnpTVWsehIFTqAQqfouxGnhoyIk8kilS3WTY2sHw4iIGulAgcBpcGY/kQNXUkNELV0ubDDgs0JRdIHUa7ixQ/mtZpHigQXdnK9zQOy+UEig+dhA4L9fZT35yc0YCb1o69/2H9j16jyVFXKmaMhUdoLKE0yU7gYzwNS2wA4JdQ8zv1SBkxcvcqMnPNIz56C8E+mxunANtRAlIcTceNq2RWsAHoivxbwC+43eKGpr2EuHClzbp9NQF6/hLNVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qvy7hGr4a4fUni3Y0CLqa44PJuYz02SDENvdoydSYug=;
 b=vsBwqwhIJfFMjQy3MC+OvgtkgM7Cj6FoFYXuDgZJY683IhgEPs01b6XKctTm4HwCJ8FnpMbFEFNs3UG6BWcn3Un7YZQqWW37ruTiIftazFTbedRoHXekGS9ykdY1F8T/RIg9XzIHzCbKvk8xrTc0FdJCj6wdsnti9wLcD7gP4k8=
Subject: Re: [PATCH] tools/xenstore: fix use after free bug in
 xenstore_control
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210125072331.22093-1-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <9561aebf-c704-2def-23e1-841fa56d27a3@citrix.com>
Date: Mon, 25 Jan 2021 10:41:01 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125072331.22093-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0351.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::14) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d2ad272-f047-454a-36e3-08d8c11db935
X-MS-TrafficTypeDiagnostic: BYAPR03MB3478:
X-Microsoft-Antispam-PRVS: <BYAPR03MB347829466DE09648AAC59F63BABD9@BYAPR03MB3478.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CV64r+xJ2t6xjmWOoVOVdwFTHMEI+0VRwl7jdYd2igEGyp7blmplJLWzEUiOORRqoeF7HLnDhBv/JKPgRnBaqp8HsF6ZZ1dUSV1MaKAX0eTVz3ZfqQYvaicNs6vTeIQa0vMX1fHWNPGtL3sK4E/17UuMtunzkS7H69no4jWbRZjkLlN+QVSC/DWZ6VO3ly7kqtNNNW0i0aP8x/OkHkZVg25B8GHxAyO65HE6AhbtATcLcVjjH2EDs+SHTR2cu36FUL1qrgrytorzRxEk/HvMkPyj5BS0nyfyYV5oo+uOQUneh1ZZY0x3cxBNPgRKW1hmWnTAGnCxrwWBh1oSaa6BK6cXF8AnCx9eSWTS9NuGdla14iBzD1Tvqe5Wq9GfA0Tih5X6aKDLAfU1vdqJ4UdYUyUVESrux92/UE35g4WNOKX2j96ESSOBYgQesPlQlHQzhJpe56JBFLFMUFUAzvDhSxqv9iF7sZvf7gC1e+Ppakk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(366004)(136003)(396003)(66946007)(6486002)(26005)(36756003)(31696002)(8936002)(6666004)(16526019)(186003)(86362001)(2616005)(16576012)(8676002)(83380400001)(31686004)(54906003)(956004)(478600001)(2906002)(5660300002)(66556008)(66476007)(53546011)(4744005)(4326008)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTRXNDNMbEFTcHRzRDA0ZExBQ3RsSjEvNmNMUzNLaXJPbHZOcm5RK3N2a2Vs?=
 =?utf-8?B?UlJNNXVHeGJ1dkxCOWd1b3RhMEJuWFFWTzVUVkdmeG9Vb2JHdDdIdENSaGdl?=
 =?utf-8?B?b3I2dGx1VTZFNkllN2UwYi9qY09nLzM1RHQ5S1NoWHNVMnFnYmJ2S0Jjc25F?=
 =?utf-8?B?LzFmOW5aMElxMUFoemU4RmV0MjJacFdITVl0bHd0NnA3cG5XMnRtSVNWR0JU?=
 =?utf-8?B?UEwyT3JrVkUvK29Eb2U5bkIxSVNsdTc2bm1HYkZlU1hLcTdNVmVPSUZmdnhL?=
 =?utf-8?B?Q05YbllhZG9CUmwwZU5NRzBrRFVPU3hHbGVqVzBmYUtzQXh5azFHVGkzUkZB?=
 =?utf-8?B?ZU1aWTBxdERlajJTNEdPTmE2VGlDVHBPakZwTXJiRjRnTFo1T2tuVFJ2Qm54?=
 =?utf-8?B?NjRtTis5V0FMckwrVUtWZ1dsVlk2YXlQRnV6VUlVdWVqdUN0M1RncUV2TnRB?=
 =?utf-8?B?Q3VtWjlmOUpWdStTMjQ5ampoNVU3Znl0VWRsL1lJTDhqTUp4cjZZcFFBTzJG?=
 =?utf-8?B?VG9FdGMwR2VBcEpOZzludGNrdlNwRXU0YmZ0UU53L0hsejFOTDF5dXpTNXJF?=
 =?utf-8?B?cDZ0c05jUHJQaU11cWR5b09sTjROY0I2bW1qUnVKRnFMUHVBQnJNRFFOSnFC?=
 =?utf-8?B?dkhSZm9mOWlYTDMwNUZCa3kyV0RzZHBXT29mb2JsTkhhTkFxWENRNVNIcVpH?=
 =?utf-8?B?UnZBUmJBanVJYU5DNGtNdUJibTdWL25nTmhSeEZFRWg4bmg2dTZOZmVVYVFk?=
 =?utf-8?B?eCs1TEo2Zkwzcy9nK3V1ZlN0ZEdZdnBObVpkYTFUQlJZYmYvc1ZwU1NIeER2?=
 =?utf-8?B?dGFTSFBQOGdBS20rNW1sMHpwWHY0KzBLOUZ0U3l6TWFOUFkxK3gvaG9rc1g4?=
 =?utf-8?B?SHJ0UStydTBzUUFmL0I2Tzd1WGpjZWtWUzlUVlQ2bWp5cWZWUFllUkhTdTdl?=
 =?utf-8?B?UDUzUTN1RHZEaTM4aWhNNU0xanpGalVFeVgrMFRNMW9lbzBTV09tYUlSQmNp?=
 =?utf-8?B?M0s3ZlR0eEVMdm9TaUtIWUh1ZE1GOU9uMndCSWU0eU1lUjlHaUg4RkdDUmR1?=
 =?utf-8?B?dEExZytFdjBzLzg4L3lnYUdRVUhxZDFNek9HL0FVVFlnZUZGVXZPdTh5OXY4?=
 =?utf-8?B?bFd2TDEwbEVrSDBDREd5U1ZnWHZ1MmpneEhqVk1BakZxYkNsclErcy9lZTV2?=
 =?utf-8?B?MXNYYkZtT2xGVTl3Y3Y3V0JHbGJsUFlzNXJXb1VySWlMZlZ2L0k1NEJtZkpI?=
 =?utf-8?B?NTErR1dTU2FKUjBKcFRMdGFEUjFLSEpzVjc3K0RjbXhOU0VycGI3OVV3c1Jw?=
 =?utf-8?Q?KXwbCXcUPzjIUQNqrhp2i595Sr250LopWN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2ad272-f047-454a-36e3-08d8c11db935
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 10:41:08.0728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUCg8x+HzFtb7uEzPND4NsMeXPyJ+IMgya3CnAeG4GOkp/TPH+iFS78tOamtD/LuST0pS46Q2/fzrBu6bIAhNQNIN/X14hgRPx3KoUqakA0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3478
X-OriginatorOrg: citrix.com

On 25/01/2021 07:23, Juergen Gross wrote:
> There is a very unlikely use after free bug and a memory leak in
> live_update_start() of xenstore_control. Fix those.
>
> Coverity-Id: 1472399
> Fixes: 7f97193e6aa858 ("tools/xenstore: add live update command to xenstore-control")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

