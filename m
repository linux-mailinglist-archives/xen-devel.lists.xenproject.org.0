Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97F645D866
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 11:44:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230853.399075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCEi-0006G3-V5; Thu, 25 Nov 2021 10:44:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230853.399075; Thu, 25 Nov 2021 10:44:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqCEi-0006Cb-RP; Thu, 25 Nov 2021 10:44:16 +0000
Received: by outflank-mailman (input) for mailman id 230853;
 Thu, 25 Nov 2021 10:44:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1dIP=QM=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mqCEh-0006CR-Ik
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 10:44:15 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a030bd92-4ddc-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 11:44:13 +0100 (CET)
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
X-Inumbo-ID: a030bd92-4ddc-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637837053;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=sqK7WTqYcHQP4laJw9wiLU+GfMSE+QhhfqhGP8BQ8UM=;
  b=EsckasjNNygBpYOppFou4wiuhDbX3An9Vzr+N3zCKcwOvrfTu+X6GKSC
   Smuq2HMR9tPfNw6KOl8PSUef+4P1nsOLA9RuSgZzwwFB0JJ/wHhEnzxyA
   MWIck1tPh3Kvg/iU/lrFNNrFSCh+0eQIPnW6eJuQuxru9w9mBpHdWjvvU
   E=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AEAQoPxSfpFi2Bg8a383ZVPJW378NPrg1xYv2CS8vO58jCZ7cYIHWbR9FYC+GZzRaVC5g3QYnZ
 EIfVoDBFck2csGvCBfwB21NIHA+3mC0BAXVhVimEPO0K90B/juknr0GBgHmhzg2ujk6qvKGLqU
 8NWlYVtjP5yzNiu1a67zHSGt6CSJxragXCejBIXz6DXEElQJuljrWJGEbjCcFo7btThI8dDM7W
 e73nSSsMG0VaM0GjQVBOPQDXUR1kuxpWZ0COxUz47jktCDXf/Uh7BKPvhmcpRYHvYy2q/pCYHQ
 qV0ItlJ2Z79mLlZTh278Gg22
X-SBRS: 5.1
X-MesageID: 60624708
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t/eD2KPYBH08ydLvrR1CkMFynXyQoLVcMsEvi/4bfWQNrUoq3mEAz
 WUbUW7UPK6IamL8L40gO461oBlQ75/XxoJgGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En540Eg+w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozaCk9Uu9
 PIVjLnzWzkkHKrUxPwWEBYNRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YvNrick5atHiIasUu216zCGfBvEjKXzGa/uSu4UEg29g7ixINffOa
 ZUwWWJpV1fvPEwIa1Y9AaJguc790xETdBUH8QnI9MLb+VP70whZwLXrdt3PdbSiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoQHrCl8v9hgHWI23ceThYRUDOToOa7ol6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1ILX6AqcWVQjFgdkK84Yue0xXWAy3
 RyGyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9XBm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7FETFtX
 1BewqByCdzi6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1bJmC4M
 B+C410AjHO2AJdNRfUpC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9Wre2JOMGogF+XQ0fUmfYlklL5SjeDG4
 je2XUow9bY1rSSvxdyiZi8xZbXxc4x4qH5nbyUgMUzxgyooYJq17bdZfJwyJOF1+OtmxP9yb
 v8EZ8TfXagfFmWZo2wQPcvnsYhvVBW3ngbSbSCrVycyIsx7TAvT9966Iga2rHsSDjC6vNcVq
 qG70l+JWoIKQglvVZ6EaP+mw16rk2IaneZ+AxnBLtVJIR2++4l2MS3hyPQwJphUexnEwzKb0
 SeQAAsZ+raR89NkroGRiPnd/YmzEuZ4Ek5LJEXh7O67ZXvA426u4Y5cS+LULzrTY3z5pfe5b
 uJPwvCibPBexARWs5BxGqpAxL4l44e9vKdTywlpESmZb1mvDb88cHCK0dMW6/9Iz75d/wC3R
 liO6p9RPrDQYJHpF1sYJQwEaOWf1K5LxmmOvKpteEiqtjVq+LenUFlJO0jegSNQG7J5LYc5z
 Lpzo8UR8QG+1kInP9vuYvq4LIhQwqjsi5kai6w=
IronPort-HdrOrdr: A9a23:zHssfa8IXZjdT4Il9oRuk+E8db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICOgqTMyftWzd1ldAQ7sSj7cKrweQfhEWs9QtqJ
 uIEJIOduEYb2IK9PoSiTPQe71LoKjlgdGVbKXlvg9QpGlRGt5dBmxCe2Cm+yNNNW177c1TLu
 vh2iMLnUvqRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUID/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF+nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSv2OwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KPoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFpLA
 BXNrCd2B9qSyLYU5iA1VMfguBEH05DUitue3Jy+/B8iFNt7TVEJ0hx/r1pop5PzuN4d3B+3Z
 W2Dk1frsA7ciYnV9MMOA4/e7rENoXse2OEDIvAGyWuKEk4U0i93qIfpo9Fo92XRA==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60624708"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoEPTVVTctNGqnXrgWwwMsxT+FoT71u7pzDiF4U0g71xepJ40mgig+QXTAsjotRMBi+X9CcCpMinLVQ+P0Sd54fAIR+SLYsF/sDDVBkQMAbVJl36Rcvojz8Y2lodTDeQyHyTpj2SR/5FhRo+RYKpF9HPLZ12rO10ilL7Dy/ABreWI1fxzkbM3sCNot3uk7Nl468Msxx8BYaa1LYWrnWtzqy+luGSuLa0MoztCIvR2W5BtPzxp8AJzcFvCm8iuc2STbZKAAcOmV7AZ49sny6NFfdHH4zw05hiirnt+FaqsvUGthqa7GRNVqgyTDtkQWTkVp8NllM5KQ3eSyHE0X1jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QrSNUfA6rg/8rOoYMleGgYV1k/V8+exu+bgURlUjxn4=;
 b=VJfnaxQpKDX+enzKyGqnEUgihLwFa0kvdq2DbhUYo0yDMszBn39owCedxmcvT/Lq2Uzte6r1psH9l9JZ4V15VMXEkUxb+73TaOkfQ95mvq98ImGvKgjxZAObIE6RQHrE3XsfddI67Nm7W7Xqyew+Gh9W3fP8x0xO+V9RBTUq+QJdsJkBh3HRwiHkRo+VEOU/p3gVB0DrdPgAcUbvJoQjJWi8lVZe6iXLzRn/BI7IjSEdGXEexU0jkd4ZerbOUQb8ylqJ4l4PDoDBBM+wZIz75Vqh51DpeR8VcJodDcLATZB9/5a9WsWuqO4RpMWcPYE+RViMSrVpCl3FjWLfsXDAUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QrSNUfA6rg/8rOoYMleGgYV1k/V8+exu+bgURlUjxn4=;
 b=edGhCIowk8eqeb1Ti7R0yFm6e3rrS3e2sVf5l2VPzDLbtaTiT7OAiGM3kvrvhSBo/n1hizirTF/KV9JmXFPHdx1SrU4BvgXRg8elx6VJ+RLatyXI95ARP3uso/SPURpcDzrmPnGHKx52SFbmP5v1LlhTJJHJDJluXp/6GwJq0aw=
Date: Thu, 25 Nov 2021 11:43:17 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.16] Revert "x86/CPUID: shrink max_{,sub}leaf fields
 according to actual leaf contents"
Message-ID: <YZ9oxXdnAEXaRtAD@Air-de-Roger>
References: <20211124211152.1142-1-andrew.cooper3@citrix.com>
 <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <00c77026-1b65-c73a-b786-0e0b9d22e994@suse.com>
X-ClientProxiedBy: MR2P264CA0130.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b07dc2ab-c1f7-4a5c-289d-08d9b000826c
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:
X-Microsoft-Antispam-PRVS: <DM6PR03MB51784D30EB4C46D5C82ACE438F629@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XTN8FehQYe8D1YEAD/YWMr2tELExUF91uXzZTIN+LuT9ouyg+JSkK62B5ua4L+itaQRrKqRAho4s668movFQiHWYq9hnV0ROolxVFZpDXXR4xru2pV+/hj6JT2kmfOV8sqiuvRcKfvJEPa25wdqGuecExV3nR48y1XFmOPj0kwVlCoqaOYuENsPNWV4tz3vqMs32+WCS2VLZy7Z1yfdmRtXiEBR0CwxkUvift3TfZIYqDp9E2wlI3YQncC05w9zGke12ihq+8OwxVp1ulCJ//LobKf2jJx/Bc5sQ0WMYLB+A8sogmjgF+ODqRYn5H33dXlnX/+qzVeybElnJstHQhUpxUcPtm4L0THisFHB8RNYgpsYNgDqSn72g/ghotUKymM5dL4dvVM98d8MspqyiwDDkjOPsaiCBFBxecwrwIkvwSdgWQtRv6IL3rTG92QrZM7W/7CkErAfXdqU6x/zTUHDE7NqzZFrNi9ITGUZshPhypk5fS8OCBzDmqXwkXkR01YJSo47wqQKndloih9lyS/B1HH9fjwwzGag/qkJ8zrUAlJraJpT63kj8aCXVx6Egs311vdyZJAuT9yxdNTtxys72XKwN/oyuROyotTWnsHRgRsRtbzHcVvpMbM9sJme86okjvjEu4Q22Jk2KBPT2yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(66556008)(54906003)(66476007)(8936002)(53546011)(9686003)(5660300002)(6496006)(86362001)(82960400001)(26005)(186003)(6666004)(956004)(8676002)(66946007)(316002)(38100700002)(85182001)(508600001)(33716001)(6916009)(83380400001)(2906002)(4326008)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRVR1FUL0tBR0p4eHZKeHdJYUd2MHdPeS9oQW5sODhzK2hQazhGM2xsQmpE?=
 =?utf-8?B?dG9MeGt5cGVBbllROWt2b2xZVHpSSUxUS2FrNHlHeDF0bFdhSmVIUTJDdDF0?=
 =?utf-8?B?NmF4aXJNNjdpNXM0WDUxcllGcytLL0xaREpscktucUplSE40YytOeGhBMGZH?=
 =?utf-8?B?amg2NDZ4cGZRM2EyUnNGTGVNdldCTlNrNHlMdXBBekFmaDdoM1RrUUhqSm16?=
 =?utf-8?B?WVY0R1M0eW1NakN3Z3lZa3Nna1g1VWpRWk5OeTBjQlNHajJuS0N3c2d6VDJQ?=
 =?utf-8?B?VXhEeTI2dVUxT3BpYitFZXdIQ2ZaVG1MdGYyRUovYWNlQk5hL0IzcHlNa25D?=
 =?utf-8?B?bUpQOGdTczZTNzFzb2Y0dTRjcnRLMVRwbloyNm9jWUkreGZjcml1U0NTUWlC?=
 =?utf-8?B?cGJLbjhTMERYbnRWR2xjeXlSZHhMU3BYUHNpUUxVL1AzUGhIL2ZLSVFCenlm?=
 =?utf-8?B?SHZjYkgwellCYXdlR0U4WkZKNUpDZi9YdlZLNjZVV0lGaU15NEd2aks5TDNq?=
 =?utf-8?B?UE9uSWh2ZDE2QlU3b0NsZldscXR4dEJ1RVRTcDI3YUF2V0pKbngvVTZwMWJ3?=
 =?utf-8?B?eDEvTzhmM044WnRKVVdhZWlKUTRESHdFaERBRVd2OVd0STFjdzBveFhSYzY0?=
 =?utf-8?B?cjZWZGxtdkpPUUhCSVpmMjNSNkpTdDlRblY4Qng1UVBzbDl4RUZhUWRzeFhx?=
 =?utf-8?B?VTAzT2diRitmbWtGVUlvZ2hPNm1xM0VjYkEwRmZQeFRqT0hsN0RMbXY1ankx?=
 =?utf-8?B?bmF3aWM1eWNBNFlrY3MvYzZ1bTEzRnlVUkRWQWJiU1U2Sk14cWhBY09tVUE3?=
 =?utf-8?B?RTVkcFZCeWdSblU2Rm5iTXBxYWh1cFl6dndYaXBFdkdDMy9KQXVWTWRmdnN3?=
 =?utf-8?B?czNXemFSaEFQSEcwRTBZdTVrNENjcFVIZmRTWitQVGo4czRXSEVNWFI2Q2I5?=
 =?utf-8?B?SjdaSWQvcnNqaWNKLzJ6NllGRHVIT1FKRDBMNnVWLzNUbmhXeWFnM0loelN6?=
 =?utf-8?B?NmlVWi9ZY3FQYWcxVG5GNlBaK3FrQ2FidS8relRsVURzSEpPa010UWJEeVlh?=
 =?utf-8?B?aWFjcnpEeXFON3ZkNElmUzRTQi9zL1h1SlB5Vld1NTN4TXFSWGhyYWpvWTNZ?=
 =?utf-8?B?QkI1MnZGMjBWTWEyaVNzb010ZDZaUnZHdHFHTktTNGtSTUcydGE2em5yV2NV?=
 =?utf-8?B?M2ZCNGEwRy9zVFVRdFJicjl2MGZnd1RKWmJnSXZVQm5hUzNZVU9NYm1pdHBq?=
 =?utf-8?B?Qno4UkdHVUlIcTFpSGxnMmloTktYU0NwQlVNajlYZ1lZQm1QMkUwc1IvM2FK?=
 =?utf-8?B?cWE2UmJjU0h5VjlueFU1ME5VWVdWWXV6R0xMa09tSlVVRzlqSXcxQkgwSnNz?=
 =?utf-8?B?WlVCS2NCcDJ3Z05OdzljcjJmemF5VmNWbVdBQi9SMitIbHd5dHRjZER6Ynh1?=
 =?utf-8?B?TEZ6UTAvMGo1QXhMUGdWUXBFeTVCTnNBWTNzcjN5K2NYZ2JiVkVyTWgzcnZK?=
 =?utf-8?B?MU1BQzAwelFhODdWRXR3aXBxc1RqM1hnMDNwSDdrZGhLS3J0ZlZEb1U4dlBR?=
 =?utf-8?B?b3M0Y2FFaFE1Nnp2Uyt6aEx5QjgrblpsMVNublVMeU1Pb0tvYnM0MGs3aUN3?=
 =?utf-8?B?aFFqWnNOVE10dmtVaEdhbjFEbHVrTS9zRUd1NmhlWlRyWFBidUd2ZFNQY0Zi?=
 =?utf-8?B?SUFla2dmeVJsNXpxMytkOWlaZ3JZVWdWWUVLUzFQYU9FZ0hwM1pvc2dQdld0?=
 =?utf-8?B?eC9HSHV3ek5OMEF6N0Z2Q0h3SG1IbE5FODZ4UDE3aDZDY0ttbHJMa3Zaczdh?=
 =?utf-8?B?MEkrYnA2OXJjakZmMDdlZFBybk1kWVJabUdZTTJnR09mUGxhQTBwVnk1N1I0?=
 =?utf-8?B?UmVZZW5xL0tCKzh6S2ttU3BkNWdMdTRZZFY1OWRva0REV3Y5T25Ud09KT2tv?=
 =?utf-8?B?a0F3NE5ZUHJ5VHFDWWUxNndMQ1pUcW9vUHZONlVJZlkvZlllWW1YOC84SWtW?=
 =?utf-8?B?c2sybm5xSDZ3bk1BQmtTVXNqV2IwMjd1YmlWNXhzd0JFODhYZ0hRR1c4SG5p?=
 =?utf-8?B?dktrSDU2amdYcm1VaXJFbHZ6bjVscDRZRnEyNWlyYTMxY0JYV2toWEp2b2U1?=
 =?utf-8?B?YWVmUTJNQ1NYQ2s1TkpDU1dENDNqaU91dHY5eERTcWVoMDFkNXA0OE1ML012?=
 =?utf-8?Q?6g3kacnc4x/CP6TUnPSqgog=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b07dc2ab-c1f7-4a5c-289d-08d9b000826c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 10:44:08.5116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtTD+JQL4XMD3ZwoBWGDv83cs8sQIIC+6XhigTfG4g5Id+ymHiIZuxCOry3DJR/0t2TvrheCiXQVpAZEVVoXvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178
X-OriginatorOrg: citrix.com

On Thu, Nov 25, 2021 at 11:25:36AM +0100, Jan Beulich wrote:
> On 24.11.2021 22:11, Andrew Cooper wrote:
> > OSSTest has identified a 3rd regression caused by this change.  Migration
> > between Xen 4.15 and 4.16 on the nocera pair of machines (AMD Opteron 4133)
> > fails with:
> > 
> >   xc: error: Failed to set CPUID policy: leaf 00000000, subleaf ffffffff, msr ffffffff (22 = Invalid argument): Internal error
> >   xc: error: Restore failed (22 = Invalid argument): Internal error
> > 
> > which is a safety check to prevent resuming the guest when the CPUID data has
> > been truncated.  The problem is caused by shrinking of the max policies, which
> > is an ABI that needs handling compatibly between different versions of Xen.
> > 
> > Furthermore, shrinking of the default policies also breaks things in some
> > cases, because certain cpuid= settings in a VM config file which used to have
> > an effect will now be silently discarded.
> > 
> > This reverts commit 540d911c2813c3d8f4cdbb3f5672119e5e768a3d, as well as the
> > partial fix attempt in 81da2b544cbb003a5447c9b14d275746ad22ab37 (which added
> > one new case where cpuid= settings might not apply correctly) and restores the
> > same behaviour as Xen 4.15.
> > 
> > Fixes: 540d911c2813 ("x86/CPUID: shrink max_{,sub}leaf fields according to actual leaf contents")
> > Fixes: 81da2b544cbb ("x86/cpuid: prevent shrinking migrated policies max leaves")
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> While not strictly needed with Roger having given his already,
> Acked-by: Jan Beulich <jbeulich@suse.com>
> to signal my (basic) agreement with the course of action taken.
> Nevertheless I fear this is going to become yet one more case where
> future action is promised, but things then die out.

I'm certainly happy to look at newer versions of this patch, but I
think we should consider doing the shrinking only on the toolstack
said, and only after all the manipulations on the policy have been
performed.

Thanks, Roger.

