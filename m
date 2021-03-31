Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7B35046E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 18:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104014.198483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRde0-0005Ts-8L; Wed, 31 Mar 2021 16:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104014.198483; Wed, 31 Mar 2021 16:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRde0-0005TS-4P; Wed, 31 Mar 2021 16:24:36 +0000
Received: by outflank-mailman (input) for mailman id 104014;
 Wed, 31 Mar 2021 16:24:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRddy-0005TN-H9
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 16:24:34 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53f1e7d3-d8c3-4ad8-a603-ab78371106c3;
 Wed, 31 Mar 2021 16:24:33 +0000 (UTC)
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
X-Inumbo-ID: 53f1e7d3-d8c3-4ad8-a603-ab78371106c3
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617207873;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+FbbCQsWXfoVlblK3jBwLsh7vNHSwUCNmsLxIdBEOs0=;
  b=B4lrmOfpVJQk6yqn0IrBxPjCtH+kR4crLkBLZpZ6j+8d0xt7Kx3jUT8D
   sFwmpUo9lEHjP/u8W+mYUNarkLuhKHHikE5rqX/gRf6LvtcDsxu8KJVLs
   Lv3ft5iAUwVUTfBqL/l2+yWgP6MqtqNNqKtLmmLw7qDm04CEUWE70cWfr
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4ZoXZWU0qY0op7T41FSkv1zsS2vN7bDe34bboys6V7v/U4qC6b/4ISKWmNydkwaSZPvEf9fU12
 ybVZrEwK9dWprz7lk7S+KJTuAYQTLLqFbYUBqFO16ukizc/h6GxX3VNd0gAzqGCLBGwsNLmWZy
 zFVkb7kqZ0EUtfSCz7o86jQJ0KAoHv9khuV8rUkuHZ+I6ngQIJkbOC+9nzxyvfgsmTxSFjIGFE
 L85b01q+ihFaRgJhdKOqzmGskq9ND0oKycank9J4II2ZbyE2fct2lLdhuIUH1HrwwIZIZSu38D
 MZo=
X-SBRS: 5.2
X-MesageID: 40583250
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:XD+ec6+Gh5vuKsKP1ftuk+F3cL1zdoIgy1knxilNYDRvWIixi9
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
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40583250"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oIT93A/N7xpC0p9RE3BnLjSUmN0o4QjwFsFTU7cB643180awax3nMZupFgbwqaoC4yaPlfomVVicICEg4t9NLh+G5lVNMjtPZM4favbPWPmGKUB0b93zy3B+OMez4Yc87McIcPuaTGtm4bHW3x/+HAUWSjCI4mjTg6Eimq8yd8ReK+wDo7+ZCA2Dg4LBXBcn61KowYChwAHYXWPb6HdXcBQu64FQbIPWR0rRUHd5tEODBDMY2s9TK1rB/jX71KOC3PngZ5QJCkADkt7fGBZMZwUzle928t8DgHOdrDhpobAMQLnlHl1lCVw1QJCwlDv8k0F/Yc81srLvMsOMYkdOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTuz3+j7FuRJ6D1vrBmy6H7dyKLgapmZ4kimdqWiNIQ=;
 b=GURflj4+3hrTSJzWGb+fXXRf1DyUrl7zeL2gAmZW3wRPW+WTeeFVFmqMjgs3QvKXuTUhPUqeGWbvDsJ8bU3FCxhCXLzORlBVtAogt103r4OL1QIGvUU6xGuMylHU1BWZ6gqSSA6JHttqSHEgTBZ7fr95Gj24EfzJP0AAgI+Vixeht04Vkn/d48oJks4z6Gyirx5QJpWuQ/HNRYhs8rpouXtdLRIdcHrIrHBuTF2m208HhDAjks3JywEI8Q4VoK9xzNgNQ1i+UyWs/nqGJyHOMkH439h1/dlw8hBdhy9A+dTRquUiTCAxdQMpc+r623IMvWTBWTOGqd8zmsfq5/NfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTuz3+j7FuRJ6D1vrBmy6H7dyKLgapmZ4kimdqWiNIQ=;
 b=pegZ3ItKGps48xF/MtfagK/m55Hc1BgGCGEo9RlsX6avIe0Db/s0HnfM64H/4RMn0fehhT4+uE9BGYUptTuHRyFV9JV/TKt6W2h8zbuwDzqYH6Teb5jN1Zmfl4VKgAhjVA7IyFWrA7LzGJpy1lcmo7/jBhZAk+q+172UsVe6lps=
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>, Paul Durrant
	<pdurrant@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-2-roger.pau@citrix.com>
 <b4b66347-e06d-1c34-12cc-324f3097259a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI
 callbacks
Message-ID: <1bc56db3-203d-1fa8-ad5c-68d97d584600@citrix.com>
Date: Wed, 31 Mar 2021 17:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <b4b66347-e06d-1c34-12cc-324f3097259a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0010.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::22) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4614ffe4-7fd0-454c-1278-08d8f46175a2
X-MS-TrafficTypeDiagnostic: BN7PR03MB3825:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB382543F24695B220553351B2BA7C9@BN7PR03MB3825.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++2CQLRmesq8U7x4HOI/d33HQ8mQKIWHH2d/z8m48wThVeKy48ij0bhuFFXypTi60c5bv1rGewsaMGcJ4dYMKWt8MGEUXUJWoH0nGgHodcB3I+fEZZLQgv9lTnfKhm5/0HZF02t0BrmoUuOwkJ60Gd27dH+SZ2czoEH6BrCz8wjvXq2JeSj33PkUicTtC3DIlvEkCLDa/DtjaYszh/Kt/zX+n+vi8DxNeC77LcrlyRAupOJHl5EdP454onqyX7SmX805OEiL9aC4wBbjfzkO4QyjQLMN+AFiEn7mogEGjlUk7vuJEZSHOfx8LweDbz9xhkAW2+W77f+NzBWEOnWLNodjcBexbrppi4swWSX7NPBLsYbDsScebGKeZ64pGI4ccOzY/CQ7oXkoebcXoTWATf31LgRunxE4mfL0sf/p4qj1+j4kngi6D+Wy6EVjVcbEPgqRZ5ktNefFGXjuDL2sNbU76mM8Omljffn/L1WUXaqPVk5o+kZaSeQ3AvFkVGDNU04vJ+Hio6MLyUOt9ArFx4RFp4WdPwdSqGG+d9SaiAj8ae6/Nnv43+Esaxf3XvboyZ3ZBoxSnZyvZsG7z4wsx0J79D2WLPxNaaCNyqRDyOUJBYb0Qnv+2RzalV/5Y870VVVnKBBA72t5GH1vMibchlTnbJSPteEGijsqTDFNz/Ft1NyjcIdP/F4XkNCBjm7Vw0QS7ArzYQeetdP04WjmqFXKKpK2SS7SB7cnRO1w9IE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39850400004)(478600001)(83380400001)(66556008)(53546011)(66946007)(956004)(186003)(8936002)(2906002)(4326008)(38100700001)(31686004)(6636002)(5660300002)(54906003)(110136005)(16576012)(8676002)(316002)(16526019)(6666004)(26005)(31696002)(6486002)(2616005)(86362001)(66476007)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MHNPWDZBcVBmb1B3cFAycStZdXJodjZQdzlodkhpZ3hYRzVxTXVUcURUcXlL?=
 =?utf-8?B?MTF6cjM1eGVKNEpvWjErMFpSUnYwNzUvZyszS0E0QXBoa2lrNExqcVJLajhI?=
 =?utf-8?B?U1ZFd2UxUDJNanp2cjFkYXBHZnhVK2VpZTdpMDZTaUJYbXk4d0o1dU5UQzB2?=
 =?utf-8?B?SDlrcTdQbHRiS3U2ZVVkNnVrUlF3RUlnc2krYnNtRlB6eThoZjBseXl1UzU3?=
 =?utf-8?B?OUE0ejQ1OXpjZlAvaGprVzhmNFFtSEdRU1lxSUYwT2dxbTlzWEoveU1pOGR2?=
 =?utf-8?B?clhZRVJwMERRalZ6VFd6bVUrdTZrcDAveDBIK0I3NTl1ajhIQnV0WVVPT0Rq?=
 =?utf-8?B?dW9OaFZ5b3lUcEljSGtydW5QV29mNGtvdjFPbDNlZTlWRTFxSTBBM09yUXY0?=
 =?utf-8?B?bVpQejhTZUlIaWhGb3cyQ0hoZ0R2bFZzTDBzcm9nQ0JpeU02dzJCZnJWcXg3?=
 =?utf-8?B?M3JuMFRxZy9QZ1BiNFIwNVNHZVUvN0dQMXBQVndPUnluQVYreUVMK3lUWm83?=
 =?utf-8?B?T3RHd2dXZXZJZ2V6WDVVNkQ5N2t2MHZFV25LTFZvdGU1SFJEOEQ5MmFZOHRW?=
 =?utf-8?B?VzV0Tk0yRFgwZGFESXRtWWZDeEpRMitqNXk5MEhSQmo4aVBZMS9mc082MkE1?=
 =?utf-8?B?ckI2QmhUaWhZdEZGVTJnaXhyaUxmZ3h6L2tIaG1scWNLMW1ic2NCdmtOTWZ5?=
 =?utf-8?B?YklibFQ1b1BMM1JJS2pWemFUVFB2ZDlMa0FTazFLTlR1U3BocTNkMWYvOTR3?=
 =?utf-8?B?NkJKck9pVDAydG10ZzFOMUxZOHhMSnMwSFgzQVpWMWo5U3hvZms5dVcwakFq?=
 =?utf-8?B?cGRabjhLVzdXMkhnZGNPbzBhRzNLenBZaFJ3b20yWTBFeTFGOVJXc3EycTJ3?=
 =?utf-8?B?amE3aVNFN3d0QWsrY3p2Lzlzd0htRE1IZE44SkpBNUcrNElZMnFiTk1OdGI3?=
 =?utf-8?B?NUIveFFLUWlzSWNBeVc1VnIrdUVRVjFHc3FveUFxbmpDVkdhK3Y0empFRmlz?=
 =?utf-8?B?bHlBYUR5MDgzdHNpaVNOZnYzQWFrWm8rNFBUMXlUckhPSitud2xyTU1NRjRC?=
 =?utf-8?B?dXM3ejd3bTczYXN6dk1tTjFLQzl3c3NiaFVXMjJ6N1h0Uk5JMWNrbmlqSUJY?=
 =?utf-8?B?MUMvajhaTHBaMzltRUxHR3dPanFDeHM1Zlc2UG9HNlpYcDhWMjgySkw1enJp?=
 =?utf-8?B?d2ppT2U0eGlBc1FVR0FtMFVyeU44L202Tmg2T1RxR01pQTNqYTdVVVdJcjVS?=
 =?utf-8?B?MldYN2pvSE40aDZpdVg1ZENMemdaSXhzR2NnZ216NFFWNW5Wc1RsUExPWm5H?=
 =?utf-8?B?LzJkazVMVzJzWDE3NlZoTm9lMkxvanAydERSeDB1MEg3UlovaTF5cVFobDc2?=
 =?utf-8?B?MzlNbTBuYVdaOXNkRm56YUlJSk1hVWN1VUpnZWJVc3lPa2Nnd1pJMUpTbDRY?=
 =?utf-8?B?b1BPNGRTbjg4NWtTajl6TGl2N2k4RXJlclRLNURFOVd3WVErNnBvSTdRSDRj?=
 =?utf-8?B?Sm0vMTZ2aEhPTmlQa3psYXV5bmNDcEVudWJwd3RqaS9iNUFtVFhDdFpLaG1Y?=
 =?utf-8?B?ZVJsYUtBeHNjV0FsL09lMG5PRXBVampTajNqVzNsL1JycE5pWG0xaGJBSnZY?=
 =?utf-8?B?T0pFWGNwcHFsc2kxRnhVVElZdHI1L0JLTExPR2RJa0RPRFE3QlYwekpRY0l5?=
 =?utf-8?B?SzN3TDYva1BuVDZXb0txMVlZN2cyd0dSTlkvRmdwb2tlSDd1ZDhINnpYaUZa?=
 =?utf-8?Q?tUfx8rTde4h2M2S0HfnQsqaSt9K5IwsfeFGY4vr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4614ffe4-7fd0-454c-1278-08d8f46175a2
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 16:24:29.8154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KyP9Fh9HGk/9qBf/UHgSOcdbSeNBSZxv7XTk+jlonu096Hmbcpq81EqMxm20XOXWiah1RMUeDkJ6I2dezeLtAFkGWjvOmA+szhVXYqapZkE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3825
X-OriginatorOrg: citrix.com

On 31/03/2021 17:02, Jan Beulich wrote:
> On 31.03.2021 12:32, Roger Pau Monne wrote:
>> EOIs are always executed in guest vCPU context, so there's no reason to
>> pass a vCPU parameter around as can be fetched from current.
>>
>> While there make the vector parameter of both callbacks unsigned int.
>>
>> No functional change intended.
>>
>> Suggested-by: Paul Durrant <pdurrant@amazon.com>
>> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>> Reviewed-by: Paul Durrant <paul@xen.org>
>> ---
>> Changes since v1:
>>  - New in this version.
> I'm afraid the situation with viridian_synic_wrmsr() hasn't changed
> since v2, and hence my previous comment still applies.

Only just spotted that line of reasoning.

Longterm, I do want to remove all the Viridian special cases, and handle
all of the state via architectural mechanisms (cpu policy for static
settings, and the existing MSR records for dynamic content).

A consequence of this cleanup is that guest_{rd,wr}msr() will be
eventually be used to save/restore dynamic state in the migrate stream,
which is why I've been engineering guest_{rd,wr}msr() to work for MSRs
in "current || !scheduled" context.

As such, it is important to retain a vcpu pointer because it will not be
current on the save/restore hypercalls, which execute in control domain
context.

How much is keeping the vcpu pointer going to interfere with this
series?=C2=A0 My expectation is that this patch would need reverting to
continue the cleanup plans.

~Andrew


