Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE113516B5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 18:31:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104653.200449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS0ED-000251-Ux; Thu, 01 Apr 2021 16:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104653.200449; Thu, 01 Apr 2021 16:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lS0ED-00024c-RU; Thu, 01 Apr 2021 16:31:29 +0000
Received: by outflank-mailman (input) for mailman id 104653;
 Thu, 01 Apr 2021 16:31:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Onq8=I6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lS0EC-00024X-NR
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 16:31:28 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c896356e-41e1-481f-ac42-eed24845bd7e;
 Thu, 01 Apr 2021 16:31:27 +0000 (UTC)
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
X-Inumbo-ID: c896356e-41e1-481f-ac42-eed24845bd7e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617294687;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=H7Xc8co0G+8ePjlc3Al49an8ffCJ804pzv/RQcupsy4=;
  b=e/3Ao0kiLhe7NOPvWvaFI5a1MNXDi/gDQI6T6JTjxayEfXH/O+oZInQD
   NFtuHiJViJFxvFB1XqoJ2pqWwkB31TnMJJ5AcGgH/tvRzjxah6HO3KVQU
   0U2bCp5Pd4UCBolXffvJETPJMkdK3D8E9xDHt0I1fdORM71q4SCoc1z8O
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: l5AZFHmbPInJWg4it8rKdckWfHHSNur9aOoMkdY9MtQlM43e3y3p3tQTeBGKsiJNFiu2TY2YRO
 vgMfEM5U10oLARZVaIkBI4xH4SyuK9lV6Zjis2xOejdv2z1iQIgEJIOVeFhvMxpfQO2cZHm+6f
 fO8Da1L90M0EcHjNOS0nNC3nJX3dd/YR8Yb1uiQljptRkpdM/MKSvpUitxm21ce4ucFAyf1/pV
 nlB2OyMyOE1K3YgbjHw5Mil76ero9dyKcZ09CkGX/XB/llQ4gYlHUg1DSXai/y79gLzbasKMso
 RWg=
X-SBRS: 5.2
X-MesageID: 41096457
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:YQ9mTK6q0XL0VAv8ZQPXwWeEI+orLtY04lQ7vn1ZYSd+NuSFis
 Gjm+ka3xfoiDAXHEotg8yEJbPoex3h3LZPy800Ma25VAfr/FGpIoZr8Jf4z1TbdBHW3tV2kZ
 1te60WMrHNJHBnkMf35xS5Gd48wN+BtJuln/va0m0Fd2FXQotLhj0JbTqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAoqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+ELzGz2BACXzRThYoz6G
 StqX2E2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW07RoymyYoAJYcz6gBkUp6WV5E8ugJ
 3wpX4bTrlOwlfwWk3wnhf3wQnn118Vmg3f4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGf9tR/w6NTSWxZhmlDcmwtFrccpg2FCSoxbUbdNrOUkjTBoOa0dFyH34p1PKp
 gKMOjg4p9tADenRkzCsnIq6NKhWWlbJGb9fmEy/uaR0zRQgUljyVoZyME1jh47heIAYqgByO
 LePqtykrZSCucQcKJmHe8EBfC6E2rXXHv3QSyvCGWiMJtCF2PGqpbx7rlwzOa2eKYQxJ93vJ
 jaSltXuUM7ZkqGM7zO4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDHgzjsqJuZwkc4/mcs
 f2HKgTL+7oLGPoF4oM9Rb5QYNuJX4XV9BQksonWmiJvtnAJuTRx6/mWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9rwPWX1/rZ0zj7bN9GKXX5IEoucwwH7wJljJQpUWy58mNJzEHmLcxZl
 FCLLTulb7+hWTexxeO00xZfj5mSmpF6rTpVH1H4SUQNVnvTLoFs9KDPURb3H6NIA5DX9rbeT
 Qv4WhfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+ml6dr6fIg7SrIrQrZ4GwmONxEdo3crlE
 5zLCs/AmPPHDLnjquoyLYOAvvEStV6iAC3ZehOqXzesk2Yjdo1RmQSWgOvVcL/u3dqexNkwn
 lKt4MPiruJnjiibUElhv4jDVFKYGOLRI5dAB+9f4VSkLDzcARWRWOH7Abq0i0bSy7PzQE/l2
 bhJSqbdbXuDkBGsn5V6Krs7Wh5b36QZU52d3B8v7BsDGiugAcH7ca7Io6Il0eBYFoLxe8QdA
 vIZjYfOStC7dG63hz9okfOKVwWgrEVesDNBrUqdL/enk63IIqTjKccArt/55B+Lu3jtecNTM
 OScwKYNynDFusswgCZz0xVYBVcmT0Bq7fFyRfl5G+30DoDGvLUOk1hXKxeDNeG7WToLsz4mK
 lRvJYQh6+XPWrwYNLdlv2SQD5HNx/JoWm5C8svsotZuKoutL11W7nXOAG4ok1v7VEbFoPTkk
 hbfYFQpJbmEaVrd9YJey1Y8kEy/e7/ZncDg0jTOKsGYVopj3XnJNuH7LrDlKo3DiS61XzNEG
 ja1xcYwuzMUCSC34MLEq4cIWxZb04n9XRpldnyPrH4OUGPd+tZ+kC9PWL4WLhBSLKdEbF4lG
 c33/i428uWfTH/wgbeoH9SJb9P6X+uRYeXDBiXEeBFt/y8NlLkuNrk3OeDyBP2QyC8cUIWmM
 lsclERdN1Kjn0at7IMuxLCAZDfkwYCiFtR4TZui17r1MyH2Q7gbDB7GDycpI5XUzlVOmWPlu
 Lf/4GjpS/A3AQ=
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="41096457"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZueQAU9hR5QDzxjOvyJeqGIr/rFSqqz36pqOOVkKhUh6n23QLezPTLaXiS/X5cqz1zSGtZ7M/ydwtTaiwzBJl2HU+mgsWumX/x5lClciZm+FfffZUGInLVbtY7vPY6a9H4bLWvgIUaNFIdx4KIbDEiO44ZjNNuFdJpb6a+KegSw2ZUgNaZ6ex1w+/jxxw/FKmIBozu3XyKmC8FUU2jlsYjlbPIqZ7H9t46Mb7DhXM1q9758OH6KbCCs0Qy6R8BxZivtra0CPlYKYC01hdhqQGYvABHPOGdI09IMWnSTnhWPL0m4Rkcr3R9NfxwRdU3i0H9LnvmRlAHoIAX1Bh2k7Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIJ+tZBCWziwfYboF2SRp6cUSYM25wcSDaFaNBRHWm0=;
 b=ZAN1lJtXJgNH2dp7bMD6lZcNiPJuFERjCNrLPwb65OZKc91yKoCiQlB1Ea05/eIM1WmpSXFo0xFP8EE+5EAvp4QDEEXYTFumgFbu6eh9b4cD0thXtuI3TVIl+/sCbVJJfw6i8d5nlvcEGsQhxkE8Gb/yRFmJZJuaen+O0pOK/6urqHGQJDo3CvV5tCdBklkhu/xaxqprmQUnBSsxNMJEHPa+chaL9Ro4XgxxlYTGXsnU3m2puiyG8674LP2mzkGNOUQerhD6OaBGthHha6ZG/JiAGunzTTmnrPPWZ14zCQJlvY19wWKjK7UkoF69Nap97aeoCsNcbetru1swblg1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xIJ+tZBCWziwfYboF2SRp6cUSYM25wcSDaFaNBRHWm0=;
 b=fmfBP4mOkSPxtunJfMy6lWbPKiGthS5O7v/wbxE3MZtaFYo25tzZbAuzItD4x/4RLNn0Ud2lP7KxH9xmXVpmxpQLap/dZP8nZhgs/m/8iAzQnJkLs5TdSr+Qvtt3GXVsSUW4fKGO4jdweIYsMZNIentqN3J6p0onEMKrHNkB3W4=
Subject: Re: [PATCH 16/21] libs/guest: make a cpu policy compatible with older
 Xen versions
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210323095849.37858-1-roger.pau@citrix.com>
 <20210323095849.37858-17-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ab195203-1ed7-2e9f-b684-11e9dc397661@citrix.com>
Date: Thu, 1 Apr 2021 17:31:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210323095849.37858-17-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0224.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::13) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 916233a7-f5e3-44d8-cec4-08d8f52b9681
X-MS-TrafficTypeDiagnostic: BN8PR03MB5124:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR03MB5124BEA827F1F071D8088741BA7B9@BN8PR03MB5124.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /HNMQYfefAvm1u68ki0GOVmWTQ1c77NfEQmg8u7Gyhq0eCUIGKgQEDvqqD7vKlekxOhmZSxgFz8lpbmw5C4p0wzLjeu3AIdcjM8GanUVyhpC131FZ9NSzq5ZdZzsnLM+Yo4n2ujyrdjT5emy8bVgSvZTkJacaJUA8eJt7+djtTT/gSQJFkZTkwv91ovejLu2cZl7J2p+DewjyHHNzFPSXcYMKvjac7af1Li2G00Yw2Vcrq26BL/cuq8MMZufunlXq/YbLB2sa8OLxWHUVTymBLtR09yGIBAIdIEeospsbQCtmTEN9LFg1NqXmEkMLYOwMu/VOyxBkeXHpgFp6z0p7e9UyFOnNLewNzHe2u/OTXWcBJyxSdqHmomBtRCfBm3fCqm5ZGkSfjgGEWBD0OU0YWIVXe7MFsgMxTbxaym+jIU0q7gIYsziltuZbFJ71EXtYOCmgRe3Wf4bvVsmiweqH0pdxBVGQZVRJldTia2WdQh3FjJwUkZ2QK4BnJ2LVsiXXBWeJW84u3HoLtnLptuysLN3Q62cTJer6u2wyxlr+abNl2JA+txO9TQq+elFUf1LFwpu0DXiOGXUwE9R26Oidt/R2zlr/2eweDsYHtYgTXvP3eBBC2MPy+OvYKM7pRJ7O/V0VssUkiZy9ejRbAmPm4Fp0RFVoTiV5i4WPOgg+8kN1BIov8brVzVdZZQ0lWxVRFSReUdF5FFaYPIbtmiHWZTNukbTuEDcMKD3qVCtG0I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(86362001)(8676002)(8936002)(2616005)(31696002)(956004)(83380400001)(6486002)(186003)(31686004)(16526019)(26005)(66946007)(66476007)(316002)(16576012)(5660300002)(478600001)(54906003)(6666004)(4326008)(36756003)(53546011)(38100700001)(2906002)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aFVBeDFQSXlnV0M1a3JERW1ZaFhGRWs4QVp6eENCM1ZqVXZKS3dWRTRTWlZ6?=
 =?utf-8?B?WTYzOFd5SzBqVmRUTWMzS1crajdoRXN2OUlxNFFFK1IzNzhkMDhwSFdLYUhN?=
 =?utf-8?B?YisxQzRQNFd3Q3hWVjBEbjQrWkdFOVRLSlFKbi9oT2lZWUJNT2VVVndOVTdp?=
 =?utf-8?B?NlFiWTc5WVZCWVhST2NYZHRVRFd6KzZvcXZ0cllxd0poKzR0TStRbkREdlJX?=
 =?utf-8?B?T0ZJUmdISlBlU3VyTisrcGIvdDAzd1VRNjZnSWd3OVNRa0EvNXQyV0Y3eXRV?=
 =?utf-8?B?NEk4ZDhJOWs3eXJIRmlWQXNpcVV1bmk2anlmQWcyMUxqL2tJeERFcXZHTFov?=
 =?utf-8?B?dTdXL2MzaExUd3lheFA2RWJzN0FLVHZSUWgxOXludFR5UTFYdnkwMEFJL0tx?=
 =?utf-8?B?bVJZM1hZZDdRMWxXNWFrQjZmbXZpc3oxbVJ1Skp2Vk13VkppOE0ydWs3Mmpo?=
 =?utf-8?B?K21Bem85bk1XbXhyYXVOSUtkd0pqREtIaEVpRHNIUDRPb0pxNERXY2dqWVVt?=
 =?utf-8?B?dThLTE9sZ01HYW1iU0cvNWFZWElsbWhPbnJNY1BJajhZZlhXcEticCtha2dt?=
 =?utf-8?B?UkVzbFlndVdZYXIrdHg4VVM1K2tXeXJ2QTR5YkVhVCsyQnUwRUQ3ZWhBZEdk?=
 =?utf-8?B?WlJhYnMvZk9XL01QTVF6Ui9nTkZ3ZWFHUjVDN1dZK2h5ZlUrR3lwZktZRnhN?=
 =?utf-8?B?cG5QeTJTcmVGeUViNXVrRmtmbXJYYUtPbW9FamQrT3BjLzlUNzdZdTNUTE9I?=
 =?utf-8?B?emJRWTBVK0hhemhtREQvQWVVRGdkbVBIOXdDcHljZVRBZjMyR3M5N2FHN1Nx?=
 =?utf-8?B?RDYrN1RRNGlyVFBTdkxITzl6SVNGVmhDbGhWdFNvVTJ6dUNQNXhVYUQxTlZ4?=
 =?utf-8?B?dncrcHRBdzlGNHV1MFFicnhhTVBiczV0WTQrckJUcmRKZStRcDdleXBFWXJy?=
 =?utf-8?B?WGVodHBFZWV5ZkJsMWZNblV6eFl1bEcraGV0UWFid3RjSTZpZUZ3YTY4RjRB?=
 =?utf-8?B?cnhLQU9xMVpDRk00UzVyY2prMTduYlNGZW9NK0FTS1VGWnhuNWlNY3ozcVcz?=
 =?utf-8?B?S1pYeFMxUXZOM052N09TNDByNmZXak91RHNFNG4rUFdDdTZZdzVKci9VNXcz?=
 =?utf-8?B?a29CWDFvSUY2ZE1XaVc0ckoxbk9QOTZjSU9ZQThlc3lJN1RqUHpFUWNoS0tO?=
 =?utf-8?B?anMwVllKUTJXMGpTMkp1SjJQamtweG1keUdTc1QwK1Fkbi8yaFNBR05sUjNv?=
 =?utf-8?B?WEQ0UEFmZ2FxUVZscGJaZ3FxK0JOd1lRd1BvRHh5OSs2RjBSSng0T2RCQXVi?=
 =?utf-8?B?TGp6ajJXR1daUm9LNlZyNVhmZ1dDdFR3R2VBekhPMDJqSktJTWxMdmZtOGZW?=
 =?utf-8?B?V3cvemJNQ0xKNG5UM25OZnFHSlg1S3RXL1QxOFJ5TlpOYUl6Ni81NW1PaHRy?=
 =?utf-8?B?ei83K3RyQlJoOXFXNFMzakdKNjNaTDN4VmRiODd6UDBUbUxtcE0wY1AvbFZD?=
 =?utf-8?B?Q2ptcTJVbnA5aFZPR1VWa0xTdnVhN1dnVUxCZCtLc2t4YlVkcGlueFA2Njd2?=
 =?utf-8?B?enR4YkhET2FLdWVLVm02QndRZEsvbTI3Z2I1WDVuL016VXJoK2dERU1wMXRF?=
 =?utf-8?B?Z2tlQ2c3TC8ySGdWR3o1OXkxT3E0K1FTN3dadnRQNHVVV25GckNyVU1MdkR2?=
 =?utf-8?B?ZUVxZC93WVJJMTZOUjZ1STU2a0o3bWlYeklQVWhhVEJQWFVXdjN3N2tOeWRn?=
 =?utf-8?Q?6JDkwQX7tQtQMsqmEiPge4kJiepDSlBPXBNU1SU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 916233a7-f5e3-44d8-cec4-08d8f52b9681
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 16:31:23.3711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0cdBZu9H+3DFhBI6gBEelKIZHKh26vOVezGWHWk1i2EuRSOgaiN/8pLcJLGrku2YIpYR1mldk4PHbxnjy7pIvnh5HJsPu39S1Q5j5Febig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5124
X-OriginatorOrg: citrix.com

On 23/03/2021 09:58, Roger Pau Monne wrote:
> Older Xen versions used to expose some CPUID bits which are no longer
> exposed by default. In order to keep a compatible behavior with
> guests migrated from versions of Xen that don't encode the CPUID data
> on the migration stream introduce a function that sets the same bits
> as older Xen versions.
>
> This is pulled out from xc_cpuid_apply_policy which already has this
> logic present.
>
> No functional change intended.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/include/xenctrl.h         |  4 ++++
>  tools/libs/guest/xg_cpuid_x86.c | 39 ++++++++++++++++++++++++++++-----
>  2 files changed, 37 insertions(+), 6 deletions(-)
>
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 5f3e5e17e9d..6f7158156fa 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2627,6 +2627,10 @@ int xc_cpu_policy_calc_compatible(xc_interface *xch,
>                                    const xc_cpu_policy_t p2,
>                                    xc_cpu_policy_t out);
>  
> +/* Make a policy compatible with previous Xen versions. */
> +int xc_cpu_policy_make_compatible(xc_interface *xch, xc_cpu_policy_t policy,
> +                                  bool hvm);

I think this probably wants  "pre-4.14(?)" somewhere obvious, because
"compatible" on its own is very ambiguous.

~Andrew

