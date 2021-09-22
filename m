Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAEE4145AB
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:59:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192385.342791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSz14-00088X-HJ; Wed, 22 Sep 2021 09:58:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192385.342791; Wed, 22 Sep 2021 09:58:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSz14-00086A-Dv; Wed, 22 Sep 2021 09:58:14 +0000
Received: by outflank-mailman (input) for mailman id 192385;
 Wed, 22 Sep 2021 09:58:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DDUS=OM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mSz13-000861-Fe
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:58:13 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3aa6c4b4-5b1d-42e8-9fa0-d20add663a38;
 Wed, 22 Sep 2021 09:58:12 +0000 (UTC)
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
X-Inumbo-ID: 3aa6c4b4-5b1d-42e8-9fa0-d20add663a38
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632304691;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DTRDvWjV3s8RJWq5ihgcGzd0yOtwznkzp54/ChzgSsg=;
  b=St5bI7HABuHwccQvQdwi28uvh41cjM6Iq5for4Gf9wIWkVJ2ijWzxGQd
   QmpV9WSAsqHiMbzzkNpYFXiJ5xkvsm+wYZKv/kWcACBYHI1IsVnbpuMRG
   ER0x0D/ZZtne1ZiEKyRRh2tybrC39lu4/xgF32xSbVFLtLPmWbGsv9a7p
   U=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 5T8Zr5SU7sMpWSQnJVtxeJK7T/IGxN8mI2WYdPJ7uhTBmqroHO7Sf8ACna9xZlfxVRw2q7T8uL
 OPdmtMTzZX9Wowd3PRuOB1rvuRTRA/mvLKi5SQEI//6zGJ9outfphwqC9sEAP1OLv3KzbYkx1k
 X0VaIiWaivEYu+Fo6xSQqmWC/IWzkVqyyQB1WAZ+7u48JoOQmyoY0zbwRZ8ZmqUfTEiK1q7D7n
 vUZYw7juOA+qQQGDDDFtEXvtJFGbqblI9xJ2/pd5t090Awa03+kinaJixLmSunNjPGxucgzMnC
 KzYzs4UOe+aUA73DAbMIohF9
X-SBRS: 5.1
X-MesageID: 53300481
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4PATpq07erMgiyz30fbD5et2kn2cJEfYwER7XKvMYLTBsI5bpzJSy
 TccCmzUOfqPMDP2Ltt/PYW0/UwHvpXUy4IwSVRvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan0ZqTNMEn970EoywbRh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhnI1/+
 ehQr5GLFiwCIKvMgMI6VyVWOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuIQDhG9s1pkm8fD2f
 PA/bBxvQDX8SARfMGgYAqslv8qpiSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1XkVyfv
 Xnu5HniD1cRM9n34Tua8Fq8i+nXhyT5VYkOUrqi+ZZCgkCXx2EVIA0bUx28u/bRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJt//YSsV/XjPCOukDAWzZCHmUphMEaWNEeRmEk5
 2KUhd7SWhdErruVUVS68ouahGbnUcQKFlPudRPoXCNcvYK5+dFt0kqWJjpwOPXq1YyuQFkc1
 xjP9XJn1utJ1abnwo3mpQivvt66mnTeoufZDC3sV2S550tSYIe/buREAnCKsK4dcO51orSH1
 UXoevRyDshVVvlhdwTXGY3h+Y1FAN7fa1XhbaZHRcVJythU0yfLkXpsDNRCGauUGpxcJW+Bj
 LDvVfN5u8YIYSrCgV5fSIOtEcU6pZXd+SDefqmMNLJmO8EpHCfepX0GTRPAjgjFzRl3+Ylia
 MjzTCpZJStDYUiR5GHtHLl1PH5C7n1W+F4/srihnkz7juLBNCDKIVrHWXPXBt0EAGq/iFy92
 /5UNteQygUZV+v7YyLN9pUUI0xMJn8+ba0aYeQNHgJaCgY5SmwnFdHLxrYtJ95sk6hPz7+a9
 XChQE5IjlH4gCSfewmNb3libpLpXIp+8i1nbXB9Yw7w1ihxe5ur4Ycea4AzIest+tt8wKMmV
 PICYciBXKhCE2yV5zQHYJDhh4V+bxD31xmWNi+obWFnLZ5tTgDE4PH+eQ7r+HVcBya7r5Jm8
 bahyhnaUdwIQAE7VJTab/emzlWQu3kBmb0tAxuUc4cLIEi1qdpkMS38iPMzMvogExSby2vIz
 RuSDDcZufLJ/90//u7WiP3WtIyuCeZ/QBZXRjGJ8basOCDG1WO/2oscAv2QdDXQWW6oqqWvY
 eJZk6P1PPEdxQsYtoN9F/BgzL4k5suprLhfl1w2EHLOZlWtK7VhPnjZgpUf6vwTnudU6VmsR
 0aC2thGIrHYasrqHWkYKBchcuneh+ofnSPf7KhtLUj3jMOtEGFrjamG08GwtRFg
IronPort-HdrOrdr: A9a23:yR2iRaF++gSehrmYpLqFdJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfChHZKTBkXGF+r8bqbHtms3Y5pa9vgRQpENRGtpdBm9Ce3em+yZNNXB77PQCZf
 2hDp0tnUvfRZ1bVLX3OlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJr3CQKR0BsyWy5Ghe5Kyx
 mLryXJooGY992rwB7V0GHeq7xQhdva09NGQOiBkNIcJDnAghuhIK5hR7qBljYop/zH0idnrP
 D85zMbe+hj4XLYeW+45TPrxgnbyT4rr0TvzFeJ6EGT6fDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7AtD6V3amJazha0m6P5VYym+8aiHJSFaEEbqVKkIAZ9ERJVL8dASPB7pw9Gu
 UGNrCc2B9vSyLZU5nlhBgr/DT1NU5DWituA3Jy9PB96gIm30yQlCAjtYsidnRpzuN1d3AL3Z
 WDDk1SrsA6ciYhV9MKOA4we7rENoXze2O5DIuzGyWtKEhVAQOGl3bIiI9Fk91CPqZ4lacPpA
 ==
X-IronPort-AV: E=Sophos;i="5.85,313,1624334400"; 
   d="scan'208";a="53300481"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wvrf4ja4K8Dubs5Mniqt7EAlltXf7wexR9fasCOjBksLJvTwalMuTq9kPpp5r4HhPsiw34L0nRBeWMFExKFU3gPVoM3A/X5xqSS0SoYpDuMfJccqtAuo223Ex7R8bfaA6mNYrm7YzjhhuzHTIN2mrAGTYMnj7n0+i7PhhA/kBQ0WiH538H4KrKJ1XX7Ss9jdeNxmKILaHVdtzzLMuHaKOgpDO4+TyCtAR02k6VOXkNtpTsltq3tof/m34aEXPQKEW9nnmAk+OaUCr9fvi3I1JEbEEV9+95JRKpVUJ7yinEu4MvsDG5J8UycBUFeif5lJ+q6N3fvsySnexK+3GI0NIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=iOweIw6GDgJGrSJfIfCc3qcy8BGDuRSYU6DmWE4tBrg=;
 b=hCve4hT35pE5scLUtLBHQ0ecfBhSdNec6PqedYKZGTLhlh1kReopuz410utedyTYBB1+2WkM0y/gh9P8vMoBgFv3j804IyWnc7WPIztzJUNz8rtmgnMIEmFxDEpRueFMiAOF1+mtA5IxXmykckSaCZuMDlkPW8rhTwbVkymHVF3cKAtLCkTY3C6uRYr8S3WCvM+tb0ksLFYSND5PeaKgnW2j7xttGUBdpFjuTaaKSuWqnjvkKq3yN0skWI77Kk4sMyWw6oYvVCwqWmGDQg7dEUlaSKQc7H7DZm1TlbIFMGyXNeTgsMKHXtogRYqd3Z9uWqGXD5mnASuVkh/v7tSDsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOweIw6GDgJGrSJfIfCc3qcy8BGDuRSYU6DmWE4tBrg=;
 b=lY6e4CdaTpCZvTb++l5dYivOZsfppzgR9Px1bTSrAQybmqPETy6M7pYkjjaOdwDTAo+Jzd4LMFQPAJLUV1jiFh1UF1eK33SCBBhwfjO++f/ewJbamHggy1CjK8fzEaFuRq6s2y15TZ1OFwAkSi1i8uyDIWk1le77TT+jjkSVWyM=
Date: Wed, 22 Sep 2021 11:58:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 5/6] tools/xenstored: partially handle domains without
 a shared ring
Message-ID: <YUr+K0tg6mspyOyd@MacBook-Air-de-Roger.local>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <20210922082123.54374-6-roger.pau@citrix.com>
 <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0aed8667-7f31-b0fb-3358-c5fd9a5734a1@xen.org>
X-ClientProxiedBy: LO4P123CA0036.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7e2e83f-0783-449c-3e01-08d97daf7a60
X-MS-TrafficTypeDiagnostic: DM5PR03MB3370:
X-Microsoft-Antispam-PRVS: <DM5PR03MB337026DF38E8F14CFCC06E318FA29@DM5PR03MB3370.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xFodaEwPN+EyugCyukMtg3iMxDrKwJUxKaiMnPkUwmL333HO7utu3JqXSPbpFQJbN2370uOm+4FaCgi6MpN7aPSt6XBDkCS3bZA+XJhCx5d+iE7l8ZfXy6XIV6UIu4ZrRbiJZehTEz4k2lyH4mY4ZSVIrXcHVSycD2MeA9Lek2z/wwrMMxBWtBTf4gs4XHX3JMCp4ng3HM9lDwv2ok7uAo7rvnorUCe17Hjtk/x/VhfsH07k1PEks6hN9KSDKzzCXjVJNnJQ5ZrOQJu/6eAjkE1G/0mp3ArH3Ky9X1MQejKESyusdesqC/qVNltK3KFC7g4D6J6sOt6SXZXOAr8Oiso9GfZeLMnCuC697AgTRxk2xBpJgMAYed085p3jBvCD9na4Q1EnjgIsMWb3QbPvRkhVsHKOLDMf0T3VNxzs5Yw3VOF25YPXTFCI1AuWRCtyDs4pDsrovDr3bi8/KgFM4eLDc/mDwQq3hDkZi6E7ImNea/8jEQid4iWy9sRgJH0z6e8u0Y2YBOqxEzJ8vnWoWW6E6T/62qMToudUdc954sZxrIzTik3gWtdbT6ea/6aaLWGpwyHYJ+CaTkEeHgkAq6/8nrFrnKk79Am+wuUCPFjaVnNyBe0NMAvgXmTU53gfXkv/24ePrX2jZWO3FNMQxSbcooqhw4lZm4Qh2AtLu+7uz3wzknqTfnU2/136bhkDlAeg3PCmqIUOkW51+vgajA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6496006)(66556008)(6666004)(53546011)(66946007)(26005)(66476007)(6486002)(5660300002)(83380400001)(186003)(8676002)(316002)(8936002)(54906003)(38100700002)(2906002)(956004)(86362001)(508600001)(4326008)(9686003)(85182001)(6916009)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1J2L0N3R0xxa0lTa29CeXkvQnVyc29QODZDbkp4TGdGWFI4THR3WjgrS2Vr?=
 =?utf-8?B?TzNUa3BLSFYvL1hQMGwrWUtYb2x3ZWVCcUkzOWJVRkU5dm92M3FQZGFubytj?=
 =?utf-8?B?NFlOcDhkQU5hWmxOVDB1NUZLUlc1WmxlOVZubUhHaGVFZWVlaDVVNzd1a3pm?=
 =?utf-8?B?NlNwMGRNTmRIQnJpWUZyUWI0cWJWbmEyNGs0bGNWUDErUDFHdmdrYXlxaUtG?=
 =?utf-8?B?a1k5NUo1clQ3YzN4WTl4KzVBMDlrR1ZvOW15ZDU5UC9wNWtsQTVoK3Ywd1hT?=
 =?utf-8?B?RmJNaFkwSGVnNE1ESXFmd0xYVXFBMzY4OTQ3MVkrYkQrOHh3dXRHWkh3cnVT?=
 =?utf-8?B?ZkdBTGpoNTlwZjdKcWI4QWtUakl0VTBJM2VGNWJ5VDdvYWpsZDF5ZmlhWVl2?=
 =?utf-8?B?U0lUTzRYa29IYUEwVTRFcDVDbU9iNCs2YU83eW5aOFMxUkhtdWtKQVdvMmpW?=
 =?utf-8?B?OG9zK3RjNjZvK09sSUM0WlhvWXF3ajY1bnoreUQrbVdIN3VXb2RybEVOOVNa?=
 =?utf-8?B?bXZ0SVkxa0hhODh0eVBjbHdVN25pTm1ZMFNUVkFmNGhSV0tPTTZ2dXRnVEM1?=
 =?utf-8?B?eXpJNDZQMzduZzVGN3Q5aDBUdkp1a1E0V3hzVnVlWjI0VUZySlRvbU9pRTkx?=
 =?utf-8?B?eVpsVVZURGtTYWJKY0s4SldZYlBVVVZ3MkdQeDZ4NzcvN2Z0aHAvejluc0J1?=
 =?utf-8?B?Qlg5OTI4MjA0TE1oRGRvV1B4d1c0Qys3TVJVcEthbnRyeTBWTVJzQUIzUVJR?=
 =?utf-8?B?MHE3a08rWTdKbS8xUWttS0ZCNzExOXkwSEdmdXRueUFuMmlQMnV4RGErK3Iy?=
 =?utf-8?B?TDFqZjI4ZW9PNFc4aXptZHJVS3FZTFBBT3dyMTlFWVVWMWxVZEZ0WUlhY3BO?=
 =?utf-8?B?c0x4Y29QMzZQUkRQKzlTSVF6MnV3aHNrU3FDYlhPb3Z4SXNVTzBSbUU5MTNw?=
 =?utf-8?B?QVVmcEI4RndWZnA4ZW05UHVZaHNTRUF0R1FnNkIyZFRFQkNKTEg5ZExiaGc3?=
 =?utf-8?B?OG5xeko4NWxnSGRZY1NqREsvRytNUzZBOFh4cUN4dXJaQXRzaXlkUS80aDRs?=
 =?utf-8?B?SThDQmxvc0lwTFcrZ0lUaExEVWVPSS93RWlBd2RrU3kzUXZDdDgzVnMvS1RP?=
 =?utf-8?B?bTdPR3pySWEwMWx0QUZRaUJJa1JWVW1vTlcvSGVDM3JDZFRZaC9JeG5KOTZN?=
 =?utf-8?B?M1hJZExZU3U2VDZVakREay84VCtZM2JFSmdmRXB2T0lKZk9VeFh4TE5mYlJ4?=
 =?utf-8?B?UU9NNmhoRnhZVEM5YlI3UGd2WmdxWXQrOXA1YjkzbjJyR2x5aFRwQklkdHRm?=
 =?utf-8?B?NFhQK3laajEyMnhMQzZ4TjJEQ29Jb1NpK000UmRaQTV6RlVtZ1Z2cHhSS2xI?=
 =?utf-8?B?UlBaaUlYR3VGSGJBcnhlemNlaWdRVG01VHF5YVpyZ0Nndy9OT3ZoOFlJc2I0?=
 =?utf-8?B?TkRkRFVYUFMzeVpnSldWYkJwOXF1VThsRTJxOGw0RDl2R3RtRFZzYUgyU0Vl?=
 =?utf-8?B?QStnM3h1QUt3ZGRCaGlPR0lZdjkxZSsxRm9waUU4SVZNNHJNWTU3RDc1MEZk?=
 =?utf-8?B?eVplR0VYR0c1Vk5SaXZOdXQrL0VJOXFBT1AwSDlaL1c2M1lZeFB1UkhUdUIv?=
 =?utf-8?B?RXE4WXV4bTNpNFN0cmFjQzhtYUZ2akxNZTFUZm54UnNIRUJMWmtLRGhzSDRj?=
 =?utf-8?B?UHR6aHlNTlAyNFdBN0VxRjdtSmlRb2RYbzFqMkxFalMwTVFQUm9hQ2d5V3pK?=
 =?utf-8?Q?k0ijAKCXzpkAjSpr85LlDEHFqYTnYbMsqDkMMW2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e2e83f-0783-449c-3e01-08d97daf7a60
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 09:58:07.7025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5ECqy4FzhLGhyEdLMqWMwQ9mRl+MHiIRLLxuXYeBZuDnzqMeto9T8c9wN6B+JDsXZ1HhpsNz7zuwRc/Yt812A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3370
X-OriginatorOrg: citrix.com

On Wed, Sep 22, 2021 at 02:07:44PM +0500, Julien Grall wrote:
> Hi Roger,
> 
> On 22/09/2021 13:21, Roger Pau Monne wrote:
> > Failure to map the shared ring and thus establish a xenstore
> > connection with a domain shouldn't prevent the "@introduceDomain"
> > watch from firing, likewise with "@releaseDomain".
> > 
> > In order to handle such events properly xenstored should keep track of
> > the domains even if the shared communication ring cannot be mapped.
> > This was partially the case due to the restore mode, which needs to
> > handle domains that have been destroyed between the save and restore
> > period. This patch extends on the previous limited support of
> > temporary adding a domain without a valid interface ring, and modifies
> > check_domains to keep domains without an interface on the list.
> > 
> > Handling domains without a valid shared ring is required in order to
> > support domain without a grant table, since the lack of grant table
> > will prevent the mapping of the xenstore ring grant reference.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > oxenstored will need a similar treatment once grant mapping is used
> > there. For the time being it still works correctly because it uses
> > foreign memory to map the shared ring, and that will work in the
> > absence of grant tables on the domain.
> > ---
> > Changes since v1:
> >   - New in this version.
> > ---
> >   tools/xenstore/xenstored_domain.c | 30 ++++++++++++++++++------------
> >   1 file changed, 18 insertions(+), 12 deletions(-)
> > 
> > diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> > index 9fb78d5772..150c6f082e 100644
> > --- a/tools/xenstore/xenstored_domain.c
> > +++ b/tools/xenstore/xenstored_domain.c
> > @@ -119,6 +119,11 @@ static int writechn(struct connection *conn,
> >   	struct xenstore_domain_interface *intf = conn->domain->interface;
> >   	XENSTORE_RING_IDX cons, prod;
> > +	if (!intf) {
> > +		errno = ENODEV;
> > +		return -1;
> > +	}
> > +
> >   	/* Must read indexes once, and before anything else, and verified. */
> >   	cons = intf->rsp_cons;
> >   	prod = intf->rsp_prod;
> > @@ -149,6 +154,11 @@ static int readchn(struct connection *conn, void *data, unsigned int len)
> >   	struct xenstore_domain_interface *intf = conn->domain->interface;
> >   	XENSTORE_RING_IDX cons, prod;
> > +	if (!intf) {
> > +		errno = ENODEV;
> > +		return -1;
> > +	}
> > +
> >   	/* Must read indexes once, and before anything else, and verified. */
> >   	cons = intf->req_cons;
> >   	prod = intf->req_prod;
> > @@ -176,6 +186,9 @@ static bool domain_can_write(struct connection *conn)
> >   {
> >   	struct xenstore_domain_interface *intf = conn->domain->interface;
> > +	if (!intf)
> > +		return false;
> > +
> 
> Rather than adding an extra check, how about taking advantage of is_ignore?

Right, I just need to change the order in conn_can_read and
conn_can_write so that the is_ignored check is performed before the
can_{read,write} handler is called.

> >   	return ((intf->rsp_prod - intf->rsp_cons) != XENSTORE_RING_SIZE);
> >   }
> > @@ -183,7 +196,8 @@ static bool domain_can_read(struct connection *conn)
> >   {
> >   	struct xenstore_domain_interface *intf = conn->domain->interface;
> > -	if (domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0)
> > +	if ((domain_is_unprivileged(conn) && conn->domain->wrl_credit < 0) ||
> > +	    !intf)
> >   		return false;
> >   	return (intf->req_cons != intf->req_prod);
> > @@ -268,14 +282,7 @@ void check_domains(void)
> >   				domain->shutdown = true;
> >   				notify = 1;
> >   			}
> > -			/*
> > -			 * On Restore, we may have been unable to remap the
> > -			 * interface and the port. As we don't know whether
> > -			 * this was because of a dying domain, we need to
> > -			 * check if the interface and port are still valid.
> > -			 */
> > -			if (!dominfo.dying && domain->port &&
> > -			    domain->interface)
> > +			if (!dominfo.dying)
> >   				continue;
> 
> This is mostly a revert on "tools/xenstore: handle dying domains in live
> update". However, IIRC, this check was necessary to release the connection
> if the domain has died in the middle of Live-Update.

But if the domain has died in the middle of live update
get_domain_info will return false, and thus the code won't get here.

If the domain is in the process of being removed (ie: dominfo.shutdown
being set for example), it would eventually get into dominfo.dying and
thus be removed normally.

I assumed those checks where needed in order to prevent having a
domain without a valid interface on the tracked list while it was on
the process of being removed. With the other changes on this patch
tracking a domain without a valid interface should be fine, and it
will eventually be removed as part of the normal flow.

Thanks, Roger.

