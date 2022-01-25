Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FB49B6D1
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 15:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260418.449884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN9R-0007A1-Un; Tue, 25 Jan 2022 14:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260418.449884; Tue, 25 Jan 2022 14:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCN9R-000772-PM; Tue, 25 Jan 2022 14:50:29 +0000
Received: by outflank-mailman (input) for mailman id 260418;
 Tue, 25 Jan 2022 14:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nUgY=SJ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nCN9P-00033A-RR
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 14:50:28 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20d22f4d-7dee-11ec-8fa7-f31e035a9116;
 Tue, 25 Jan 2022 15:50:26 +0100 (CET)
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
X-Inumbo-ID: 20d22f4d-7dee-11ec-8fa7-f31e035a9116
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643122226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=lDIDZVb6t5MamQ41A+NyYPcTCeYrA/MdjwSZFQy8WBQ=;
  b=fjmZJwaRxS8F+UOKlK+eajEsTFuDnpxjUIEXNb7nRDvTmmvF/DzkuKxy
   hfraZIT8RfSxNtoryZ9D8/Fvr0Ds0s5rcHVMkv4J+38n3Wnlsl8+hb7Mq
   RlsgT1qewxZ6BKawMKS9OcCm54xiHDA31kgsvkMr/HKXDfb45xMmdIRkf
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /4tu2aQOqTy+hLp6kZeyDKlUaENKrTvE/R1IgRQDgCp+HlhJdIFqe8Q7fps9D2qkYxj8HOnDnT
 8EncfjmiKlendAAq1UNct+K1a8n6dSCCH/aazlWC/wAiMORYFMebtOJ4lu+72cky2NbEBCQWXP
 8PywGwCUrOxYsHM3NBkNrnPw1IVhB6onSaYkgkeh8XhQ7kHQGhXF2QlU+t3yGk6tE/A4yETxaf
 7euTY0UJSc2N+fUA9tO9dlednhLtQMMVZ45kyDy8g7r7vtNlP+BmuI+2jQOBKByX8TYLTdDYa9
 qvPnvsDQ9R1GWduk4azWGV9o
X-SBRS: 5.2
X-MesageID: 63124361
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:YpUyyKksk8wjF+gyA9QhAzro5gxlIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIcWmHVOPeDZTOjL9h3aIrioUkBu8KDzdVqTVNs/n08FSMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29Q12YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NFErYStDl8PBbSSvb48aBoBNhonZbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glr35oSRqiHD
 yYfQRBjQynhPgESAUsOEJA5pfjrln/UUTIN/Tp5ooJoujOOnWSdyoPFMtXPfceRbd5IhUver
 WXDl0zmBjkKOdrZziCKmlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHqNpgYBHIJ2KPRkzVus8amNxj3AXndRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtrxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtgMsW4hehY4aq7onAMFh
 meJ5Wu9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l4Y9f5yrI9YY112aNTk+bD5
 HamXUFEjlH4gBX6xc+iNhiPsZvjAsRyq2wVJyspMQr60nQve9/3vqwea4E2bf8s8+k6lax4S
 PwMesOhBPVTS2uYp2RBPMel9IEyJg62gQ+uPja+ZGRtdZBXWAGUqMTveRHi9XdSA3Pv59c+u
 bCpyijSXYEHG1Z5FM/TZf/2lwGxsHERlfhcRUzNJtUPKkzg/JIzc376j+MtItFKIhLGn2PI2
 wGTCBYehO/Mv45qr4WZ2fHa99+kSrIsEFBbEm/X6aeNGRPbpmfzk5VdVOuofCzGUD+m8quVe
 ugIner3N+cKnQgWvtMkQapr1683+/Dmu6ReklZ/BHzOYlmmVuFgL32B0ZUdv6FB3OYE6w6/W
 0bJ8dhGI7SZfsjiFQdJdgYia+2C09ASmyXTsqtpcBmruncv8erVS1hWMjmNlDdZfel8P44Sy
 Os8vNIbtl6kgR0wP9fa1i1Z+gxg9JDbv3nLYn3CPLLWtw==
IronPort-HdrOrdr: A9a23:ch644q4mlwXFCwk2UwPXwVKBI+orL9Y04lQ7vn2ZFiY6TiXIra
 +TdaoguSMc6AxwZJkh8erwX5VoJkmsiqKdgLNhQYtKOTOGhILGFvAa0WKP+UyEJ8S6zJ8m6U
 4CSdkPNDSTNykDsS+S2mDReLxMsbr3kpxAx92uskuFJTsaGp2IhD0JbDpzfHcGIDWvUvECZe
 ShD4d81nCdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lIn9y6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zX0IidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6q9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfFL9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc4a+d
 FVfYLhDcttABGnhyizhBgr/DXsZAV9Iv6+eDlDhiTPuAIm2EyQzCMjtboidzk7hdUAoqJ/lp
 b525JT5cZzp/8tHNFA7dg6ML6K4xT2MGnx2UKpUBza/fI8SjnwQ6Ce2sRA2AjtQu1P8KcP
X-IronPort-AV: E=Sophos;i="5.88,315,1635220800"; 
   d="scan'208";a="63124361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jWxxymfO+xm7lzsZl18IKJ8ifsKXfSbQlSK9CNa4y5BojxTACQxJSTNBWBtJfGbJaj5wiQDPAhHULOgybPR6daGOCoQb01pXC8w607B6ZiVTfdHIFACME8p+7p7RChN2rKpjSpbRjo3lyRX3eCytRlPxTh0yCSGsrTmdK7WMvH9LrvaUuIdo8PPvrIqcSA4+ziLg4kIk9lOavMl2SkmGIhykQmjKCrcWuY72LSEs/nuvCymuJyoEGgJK6hv9fkvQ0todznSAI0AIXyp5x9PCTSYXq3PiUrHbuCeYKK1YhaQcyZsfvWbq6XrtIlibbjc2GwwQzQl3ZbtQ6nY75Xr58A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5SdJW4L4cnkKhyxvx6qW9ANbG0AO2oH1BePie71Hvo=;
 b=arl7Ti4CAljTVZcILAT6m93JBm5X2jBP1D/Od5sVRwaYDKB3prZ87N3JXklvdA8CVurc/n/LsERKJRQG/wa9yYNQdBe27NSXOkxkqHdlRSmPvkuhymdutVI1PvOfE/NSzsI6Syg85ROkKBoNmtA/gK9DymQ9sgoG7hAtMHjtNlwv4oStB1dy5fOc6PlADEoIkGKz90Hpl1RPFTHg25P3k1HaUjkeMjtlkDQgtICBIxsOZHZ4X/eFbg9VswZ9ChTbkROCzh6L+JruC0QF2Zx9vIUf+J6iPV1vABWKfR8wIluRDKEiXeOOgE6LyqEW7X5+w3vJkMw2er7LJZX3mI+OXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5SdJW4L4cnkKhyxvx6qW9ANbG0AO2oH1BePie71Hvo=;
 b=Hkfpk8PqJvBvf/h4bVns3/ytS9T23PYGwh7wSkiQLfJZFZVgBjiAHBfrljo1JjEkhpeB9I3t9MQvgC1cHBo3NNzBWaa1IQ6B5moAql+xqhVweJHHTD+QC+GzOkDWUOYT7vsqRcyC/nPeCT19+4hEwW10QZT7G5/W35sGBL72hE4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 07/11] libs/guest: rework xc_cpuid_xend_policy
Date: Tue, 25 Jan 2022 15:49:31 +0100
Message-ID: <20220125144935.44394-8-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125144935.44394-1-roger.pau@citrix.com>
References: <20220125144935.44394-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcf90436-44da-42fc-18a0-08d9e0120255
X-MS-TrafficTypeDiagnostic: BYAPR03MB4568:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB4568786A4EFBA89E83B7B39D8F5F9@BYAPR03MB4568.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:65;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/M9tjTP9PlX8iQoM/Vf9iWEktbwQgp90VaQvB8QhqraMSRb4PNmQzVjhqIbh/OnK7jHP/7UkXKAhBXRWFyTclrn8Uy+YRi0sgzScxgmLxq8TgJBeQuaVn+dW90gTHs0HQyA4RTuzKForKUGQu+t6oCjbTfnzBIrgVITHSYMm0CFCekVjR4kp0Va3ETgOV/YSx0pBof1WDibe7ZAgBujcVdJ0D7+MxBOgbMnqx5Xe8vST5vY+eayNQHuI1W3oXK3JzOvdpQ/X/x08BgQEtdwdYU4Azt+aV1QpFdSGuem+clUGw9JQgzNDzpkBk+0Pv7Xax91x5OTUqiduNeYKgYyqVbZjUbuNtljXs1ykkug6buUWBRdhN2gMlubivOqfZ49vidKtEC8S08MV8lETa0jmqrDGYKy3RcvcBudL/PRbi+1tAygb09mxn2wvw3z9GxGy4Qwe2rYkTua4ACoer9GwYIUmOLJDfFW2IjXgDn0Qs2dEo5kcjnsbQk79Mt5OqiF/RZNGmDmCxBs+my9/vhHgQVnUW2GBIoPO6dfGG50D20JlN7GBHKH38LAnduMufhw306tnpWaUJan/31O2AvY7p2Et+0cprSc5wOaZMaM9NY1i0kzsjcqDLS7hmGHxAukHgPlrClubqwBxN0LbBBTgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(8676002)(26005)(1076003)(2616005)(6512007)(508600001)(6916009)(83380400001)(54906003)(36756003)(2906002)(316002)(8936002)(66476007)(5660300002)(86362001)(6506007)(82960400001)(66556008)(6666004)(186003)(66946007)(6486002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnR1NGFjTnV6cmh1eE5GVDNtb1BxTDdldjVFUVpOeDgySkg2RW9KOUtIemFR?=
 =?utf-8?B?Sk9JdVBZKzJmTjZTOWZNK1Y1SWZJeGJMK1pQN1ByTS9kWUxFMXRzanBhNWYx?=
 =?utf-8?B?SXZNd1RqMHF2MXp2YU1LVGplWUpQN2dERm82VGFLTnBEcFVPL2JvR2p3RzFG?=
 =?utf-8?B?VkpOQjVlTDd5bDNQVTF0bVExcnhSR2Q2RURnWGJqRzdsUlNWOTVuNFdrYVps?=
 =?utf-8?B?NWR2OXVmZkhydytOckVQcGxvNTRSY0E0NmcrUkRqOXJ5eTY5OWJMN1hXbVFX?=
 =?utf-8?B?dUN4cTgzb0lCMHRtQkJpS2JKRDA1ZUFnd0xNb2xTUUxLTlpPRHArdGFvbFlS?=
 =?utf-8?B?VGVIamh0b1ptL3hMNk5OUnJ5ZE11cjk3T1RJb0wrTGlKYk1OeDlSNmtlbmdH?=
 =?utf-8?B?M2RFK2xGemhxVDVkR2hLZU12ZGhIZ2Z1QStSWGNsSFk4b2NWMmlnSEhLeTJJ?=
 =?utf-8?B?WE9td1N4MUF2dDFEQldDcFczY0VzSkNGWXNya1ErVjZCdElJQ2IzZ05WTWpT?=
 =?utf-8?B?TVRKRGlPMm0vSmdHY0xwUGVsYzlSV1RpWm9uZWtDZ0pvcE5TL3pmTDF3UzA1?=
 =?utf-8?B?aG1KZGcwaVhUNGdHYmhENVl5VUdSc3Y3aGR1Q3lIQXlES2I1bWMxMzlJd1p6?=
 =?utf-8?B?elZXRndPalZoL3FTMFVjUDNxUjJQb2RIZ0swZDRaR3pwb2cvU0JWdktWYW5M?=
 =?utf-8?B?QUpxMDFzMUZ2aXFGRG1DOUQ3Q1hWUnFFa0NZRTFDRjhYd1Y0ZnhiV1VpNWU2?=
 =?utf-8?B?RU5YbGhmUTVBdnZncVNpTkNoK2NmUDhlUmZFRUx4N0ZzSXBMSm1ONFBxQXM3?=
 =?utf-8?B?ZVpzZ3hXeXNSa3dvdXVIZlMrRnkvbnJGNHdnbnFFQndtNFIrajBpTk8zeCs4?=
 =?utf-8?B?Vktob3BNOHpING5iaGd2dkNNTkRrZldLY2M4T3cwVWZzYWFDd0pXanVVRlRZ?=
 =?utf-8?B?VVY5bzJwRDRwTGVMNFhkdzVENHpWMzdFQVkvUHVSUkYrV21KZkkzRk81RDl3?=
 =?utf-8?B?K1dlR3hXQUs5QkhiT09qaWg5ZXFEb2V0TFYyV1A3Y1VUV0dPOGVzbk5DOS9t?=
 =?utf-8?B?T2h5R0JQbjliQ1pXRWxiTWFSWHNQWHdqYnowendRTlpiQTVVbDUrcFdWTVZT?=
 =?utf-8?B?a2JsWEFub21JZkJPUkFGY0d5SlZPWllhSlhGcm1UUjIxMjl1Z0p5RkZnWVV5?=
 =?utf-8?B?TmhRd29Ic21BWWZJajdXQ091TGdSK2VVU0lJWCtObFFmV0VOOUJBYlRrWkoz?=
 =?utf-8?B?Q2NZdDhYQXp1eVlWMzNsdTB5MjdQTURVbHNYSVBwRS9hZi90d0pYbUZTQWI3?=
 =?utf-8?B?eWJmT2FmMjBYNnh2TEU0eDYwRVZzSEdqNC83a1doUDdDbWZSWjRaQndtOEtm?=
 =?utf-8?B?aW05UVM4VnkwOUlYY3pnYlZRd3ZDQmEvempWbVpxV1gyODRqZ0lJbzZsRSty?=
 =?utf-8?B?TTNsMWJicEFJNFpvL2FrY0hRQjd4TzN4TWhNbzJNR3hwL2o1Rnc3dkk0QzJo?=
 =?utf-8?B?Q1ZwVlgwcjZmR2Njb3JEeUF2L1FZT2xDOUUzSDdhakdnaUJjK2owOXJsc2Ux?=
 =?utf-8?B?eE8veDR1dGZOSnJPVlpiK2grMWhHNWNvYWxpc09tdy80TkYyTi9XVEZHbWx2?=
 =?utf-8?B?Q3BiWTN5a2tkaUt6UTdKVkRXc3BlOVJ0QUMxOFhzZkhZSHdNL2lDT0YxWWRJ?=
 =?utf-8?B?cWZ0b25qZWlOV0diL1ZOc21peVc1WnpUQUdCanFleGlOaXFieGZtQWtBMFZO?=
 =?utf-8?B?b0thUWVTK3ZHdGJIOE1CYUVIVndpQjk5QU1uTGdMeElJSExqNnlZdU9mU2dI?=
 =?utf-8?B?MlRxUEUxU1BVS1hSUFhKWXBPQ01xZ1ZmQzkvMDNTTCtGZklUblhac2hkME9F?=
 =?utf-8?B?UUdWdGhpOVpoeUpGOGc2anZBTC9ENTBSdkVFQm1lbElLdmNsU0hraWxCaVZZ?=
 =?utf-8?B?Z2poOUwycjBwNUgzWTlqUDBYS05FVStCUmxtSWtzTGZMWWNtai9URnhWRzlU?=
 =?utf-8?B?dnNOSms0NzdLSnkrd3JiM0VLNVhPYkU2NEphQ3FzWkRyY2ZGTjRGUEtlKzd2?=
 =?utf-8?B?dVVYM3E1aW13SHFHWlEwdmRsblRwQkU0Y1cxbDZHWGVWR1lQdGR2WFVNeis4?=
 =?utf-8?B?cVFWcWkrekdaZVlod2FudXFhNjRHN1lHZjRWVTc4ZndpSkVta2pKYW04SmVB?=
 =?utf-8?Q?VY3NpekdNF5tjGSoUsLt9Wc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf90436-44da-42fc-18a0-08d9e0120255
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 14:50:20.4518
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjnJlXs7Q/OLnNIMNnFjBIKLME6Xe9dgxA75kxIEApHxsgKX/+5HbCxL5KmXBsoIh8InBrKp6NzpMXjdHdRowQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4568
X-OriginatorOrg: citrix.com

Rename xc_cpuid_xend_policy to xc_cpu_policy_apply_cpuid and make it
public. Modify the function internally to use the new xc_cpu_policy_*
set of functions. Also don't apply the passed policy to a domain
directly, and instead modify the provided xc_cpu_policy_t. The caller
will be responsible of applying the modified cpu policy to the domain.

Note that further patches will end up removing this function, as the
callers should have the necessary helpers to modify an xc_cpu_policy_t
themselves.

The find_leaf helper and related comparison function is also removed,
as it's no longer needed to search for cpuid leafs as finding the
matching leaves is now done using xc_cpu_policy_get_cpuid.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v6:
 - Pass a host policy to xc_cpuid_apply_policy.

Changes since v3:
 - Drop find_leaf and comparison helper.
---
 tools/include/xenguest.h        |   5 +
 tools/libs/guest/xg_cpuid_x86.c | 203 ++++++++++++--------------------
 2 files changed, 81 insertions(+), 127 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 5e60f81192..98a998f11d 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -830,6 +830,11 @@ void xc_cpu_policy_make_compat_4_12(xc_interface *xch, xc_cpu_policy_t *policy,
 void xc_cpu_policy_legacy_topology(xc_interface *xch, xc_cpu_policy_t *policy,
                                    const xc_cpu_policy_t *host);
 
+/* Apply an xc_xend_cpuid object to the policy. */
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const xc_cpu_policy_t *host,
+                              const struct xc_xend_cpuid *cpuid, bool hvm);
+
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps);
 int xc_get_cpu_featureset(xc_interface *xch, uint32_t index,
                           uint32_t *nr_features, uint32_t *featureset);
diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index 6d8d16eed5..3503f21793 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -254,144 +254,99 @@ int xc_set_domain_cpu_policy(xc_interface *xch, uint32_t domid,
     return ret;
 }
 
-static int compare_leaves(const void *l, const void *r)
-{
-    const xen_cpuid_leaf_t *lhs = l;
-    const xen_cpuid_leaf_t *rhs = r;
-
-    if ( lhs->leaf != rhs->leaf )
-        return lhs->leaf < rhs->leaf ? -1 : 1;
-
-    if ( lhs->subleaf != rhs->subleaf )
-        return lhs->subleaf < rhs->subleaf ? -1 : 1;
-
-    return 0;
-}
-
-static xen_cpuid_leaf_t *find_leaf(
-    xen_cpuid_leaf_t *leaves, unsigned int nr_leaves,
-    const struct xc_xend_cpuid *xend)
-{
-    const xen_cpuid_leaf_t key = { xend->leaf, xend->subleaf };
-
-    return bsearch(&key, leaves, nr_leaves, sizeof(*leaves), compare_leaves);
-}
-
-static int xc_cpuid_xend_policy(
-    xc_interface *xch, uint32_t domid, const struct xc_xend_cpuid *xend)
+int xc_cpu_policy_apply_cpuid(xc_interface *xch, xc_cpu_policy_t *policy,
+                              const xc_cpu_policy_t *host,
+                              const struct xc_xend_cpuid *cpuid, bool hvm)
 {
     int rc;
-    xc_dominfo_t di;
-    unsigned int nr_leaves, nr_msrs;
-    uint32_t err_leaf = -1, err_subleaf = -1, err_msr = -1;
-    /*
-     * Three full policies.  The host, default for the domain type,
-     * and domain current.
-     */
-    xen_cpuid_leaf_t *host = NULL, *def = NULL, *cur = NULL;
-    unsigned int nr_host, nr_def, nr_cur;
+    xc_cpu_policy_t *def = NULL;
 
-    if ( xc_domain_getinfo(xch, domid, 1, &di) != 1 ||
-         di.domid != domid )
+    def = xc_cpu_policy_init();
+    if ( !def )
     {
-        ERROR("Failed to obtain d%d info", domid);
-        rc = -ESRCH;
-        goto fail;
-    }
-
-    rc = xc_cpu_policy_get_size(xch, &nr_leaves, &nr_msrs);
-    if ( rc )
-    {
-        PERROR("Failed to obtain policy info size");
-        rc = -errno;
-        goto fail;
-    }
-
-    rc = -ENOMEM;
-    if ( (host = calloc(nr_leaves, sizeof(*host))) == NULL ||
-         (def  = calloc(nr_leaves, sizeof(*def)))  == NULL ||
-         (cur  = calloc(nr_leaves, sizeof(*cur)))  == NULL )
-    {
-        ERROR("Unable to allocate memory for %u CPUID leaves", nr_leaves);
-        goto fail;
-    }
-
-    /* Get the domain's current policy. */
-    nr_msrs = 0;
-    nr_cur = nr_leaves;
-    rc = get_domain_cpu_policy(xch, domid, &nr_cur, cur, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain d%d current policy", domid);
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to init policy");
+        rc = -ENOMEM;
+        goto out;
     }
 
     /* Get the domain type's default policy. */
-    nr_msrs = 0;
-    nr_def = nr_leaves;
-    rc = get_system_cpu_policy(xch, di.hvm ? XEN_SYSCTL_cpu_policy_hvm_default
+    rc = xc_cpu_policy_get_system(xch, hvm ? XEN_SYSCTL_cpu_policy_hvm_default
                                            : XEN_SYSCTL_cpu_policy_pv_default,
-                               &nr_def, def, &nr_msrs, NULL);
-    if ( rc )
-    {
-        PERROR("Failed to obtain %s def policy", di.hvm ? "hvm" : "pv");
-        rc = -errno;
-        goto fail;
-    }
-
-    /* Get the host policy. */
-    nr_msrs = 0;
-    nr_host = nr_leaves;
-    rc = get_system_cpu_policy(xch, XEN_SYSCTL_cpu_policy_host,
-                               &nr_host, host, &nr_msrs, NULL);
+                                  def);
     if ( rc )
     {
-        PERROR("Failed to obtain host policy");
-        rc = -errno;
-        goto fail;
+        PERROR("Failed to obtain %s def policy", hvm ? "hvm" : "pv");
+        goto out;
     }
 
     rc = -EINVAL;
-    for ( ; xend->leaf != XEN_CPUID_INPUT_UNUSED; ++xend )
+    for ( ; cpuid->leaf != XEN_CPUID_INPUT_UNUSED; ++cpuid )
     {
-        xen_cpuid_leaf_t *cur_leaf = find_leaf(cur, nr_cur, xend);
-        const xen_cpuid_leaf_t *def_leaf = find_leaf(def, nr_def, xend);
-        const xen_cpuid_leaf_t *host_leaf = find_leaf(host, nr_host, xend);
+        xen_cpuid_leaf_t cur_leaf;
+        xen_cpuid_leaf_t def_leaf;
+        xen_cpuid_leaf_t host_leaf;
 
-        if ( cur_leaf == NULL || def_leaf == NULL || host_leaf == NULL )
+        rc = xc_cpu_policy_get_cpuid(xch, policy, cpuid->leaf, cpuid->subleaf,
+                                     &cur_leaf);
+        if ( rc )
         {
-            ERROR("Missing leaf %#x, subleaf %#x", xend->leaf, xend->subleaf);
-            goto fail;
+            ERROR("Failed to get current policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, def, cpuid->leaf, cpuid->subleaf,
+                                     &def_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get def policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
+        rc = xc_cpu_policy_get_cpuid(xch, host, cpuid->leaf, cpuid->subleaf,
+                                     &host_leaf);
+        if ( rc )
+        {
+            ERROR("Failed to get host policy leaf %#x subleaf %#x",
+                  cpuid->leaf, cpuid->subleaf);
+            goto out;
         }
 
-        for ( unsigned int i = 0; i < ARRAY_SIZE(xend->policy); i++ )
+        for ( unsigned int i = 0; i < ARRAY_SIZE(cpuid->policy); i++ )
         {
-            uint32_t *cur_reg = &cur_leaf->a + i;
-            const uint32_t *def_reg = &def_leaf->a + i;
-            const uint32_t *host_reg = &host_leaf->a + i;
+            uint32_t *cur_reg = &cur_leaf.a + i;
+            const uint32_t *def_reg = &def_leaf.a + i;
+            const uint32_t *host_reg = &host_leaf.a + i;
 
-            if ( xend->policy[i] == NULL )
+            if ( cpuid->policy[i] == NULL )
                 continue;
 
             for ( unsigned int j = 0; j < 32; j++ )
             {
                 bool val;
 
-                if ( xend->policy[i][j] == '1' )
+                switch ( cpuid->policy[i][j] )
+                {
+                case '1':
                     val = true;
-                else if ( xend->policy[i][j] == '0' )
+                    break;
+
+                case '0':
                     val = false;
-                else if ( xend->policy[i][j] == 'x' )
+                    break;
+
+                case 'x':
                     val = test_bit(31 - j, def_reg);
-                else if ( xend->policy[i][j] == 'k' ||
-                          xend->policy[i][j] == 's' )
+                    break;
+
+                case 'k':
+                case 's':
                     val = test_bit(31 - j, host_reg);
-                else
-                {
+                    break;
+
+                default:
                     ERROR("Bad character '%c' in policy[%d] string '%s'",
-                          xend->policy[i][j], i, xend->policy[i]);
-                    goto fail;
+                          cpuid->policy[i][j], i, cpuid->policy[i]);
+                    goto out;
                 }
 
                 clear_bit(31 - j, cur_reg);
@@ -399,25 +354,18 @@ static int xc_cpuid_xend_policy(
                     set_bit(31 - j, cur_reg);
             }
         }
-    }
 
-    /* Feed the transformed currrent policy back up to Xen. */
-    rc = xc_set_domain_cpu_policy(xch, domid, nr_cur, cur, 0, NULL,
-                                  &err_leaf, &err_subleaf, &err_msr);
-    if ( rc )
-    {
-        PERROR("Failed to set d%d's policy (err leaf %#x, subleaf %#x, msr %#x)",
-               domid, err_leaf, err_subleaf, err_msr);
-        rc = -errno;
-        goto fail;
+        rc = xc_cpu_policy_update_cpuid(xch, policy, &cur_leaf, 1);
+        if ( rc )
+        {
+            PERROR("Failed to set policy leaf %#x subleaf %#x",
+                   cpuid->leaf, cpuid->subleaf);
+            goto out;
+        }
     }
 
-    /* Success! */
-
- fail:
-    free(cur);
-    free(def);
-    free(host);
+ out:
+    xc_cpu_policy_destroy(def);
 
     return rc;
 }
@@ -425,7 +373,7 @@ static int xc_cpuid_xend_policy(
 int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
                           const uint32_t *featureset, unsigned int nr_features,
                           bool pae, bool itsc, bool nested_virt,
-                          const struct xc_xend_cpuid *xend)
+                          const struct xc_xend_cpuid *cpuid)
 {
     int rc;
     xc_dominfo_t di;
@@ -554,6 +502,10 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
     xc_cpu_policy_legacy_topology(xch, policy, di.hvm ? NULL : host);
     *p = policy->cpuid;
 
+    rc = xc_cpu_policy_apply_cpuid(xch, policy, host, cpuid, di.hvm);
+    if ( rc )
+        goto out;
+
     rc = x86_cpuid_copy_to_buffer(p, leaves, &nr_leaves);
     if ( rc )
     {
@@ -571,9 +523,6 @@ int xc_cpuid_apply_policy(xc_interface *xch, uint32_t domid, bool restore,
         goto out;
     }
 
-    if ( xend && (rc = xc_cpuid_xend_policy(xch, domid, xend)) )
-        goto out;
-
     rc = 0;
 
 out:
-- 
2.34.1


