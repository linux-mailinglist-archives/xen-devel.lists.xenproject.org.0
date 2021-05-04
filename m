Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A31CC3729C4
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 13:58:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122168.230418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldth1-0008Fa-SO; Tue, 04 May 2021 11:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122168.230418; Tue, 04 May 2021 11:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldth1-0008FA-OQ; Tue, 04 May 2021 11:58:23 +0000
Received: by outflank-mailman (input) for mailman id 122168;
 Tue, 04 May 2021 11:58:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Og=J7=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ldtgz-0008F5-IG
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 11:58:21 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11c97783-1b22-4e9d-aaa7-868f2bcdce86;
 Tue, 04 May 2021 11:58:20 +0000 (UTC)
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
X-Inumbo-ID: 11c97783-1b22-4e9d-aaa7-868f2bcdce86
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620129500;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=JER8YN7eMcReMDldAxAP6IfKeDIGNAZD1whjWnDYBdA=;
  b=Otq59TAJ7HsaQG8MdjBAnQvL/RCWHYsoPyqAvVi9tmV6+iyRolx0ZWsp
   hEeKlw2c6tPC/8j1jl0GnfCr1BWnHwljfTgn9El73GY9VIKBSd8Iy/kPb
   4eBxUFfz6bVfPdPDDTJ2U1MFJV4PVQrISUwZ6jMod+LIerd96UcYsSbiD
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VwZUlls91Vr6Pv+7PmjLpTqmgtbcfrOWykP2AKavfxnSEWVZZgIr80rPiswJN9pFDnU6Fclvii
 0/N33GdYAfCUYfNEd6ILId22OPNuVfnulvEDaKMGfFN143q6Nf0yTk3R6Awhd8M7eXlIvnJf2b
 u1R6RFKELOfVRPd7wZYKtF3bHxqnJOWdNontWCCqvhXyRMZRiPNcaKIn5Msb4pO4ZYZT5c5sXF
 NRXQwC+MOsnbwwf6jwFaKE1slbli686a6xfqMYyq3UfFwrk7vrsU5zjZYTsaSNKLIQ2X7sWMFv
 MXw=
X-SBRS: 5.1
X-MesageID: 43024916
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OQb/S6PECRH7EMBcT3Hw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAsa9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrwHIMxbVstRQ3a
 IIScVDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RZQZCtBApsQiDtRIACdD0FwWU1qBYAhEo
 Cd+8pAoFObCA4qR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+GLzGz2BACXzRThYoz6G
 StqX2D2oyPkdGejiXd2Wja8ohMlLLapOdrKcSQhqEuW1fRoymyYoAJYczmgBkUp6WV5E8ugJ
 3wpX4bTrhOwlfwWk3wnhf3wQnn118Vmg/f4HuVm2Hqr8C8ZB9SMbs5uatjfhHU61UtsbhHuc
 ohtQLp1OskMTr6kCvw/NTOXR1x/3DE2UYKquIPk2dZFbIXdb45l/1vwGpuDJwCECjmgbpXdt
 VGMce03oczTXqqK1rdvmVp3eW2WGUyEhqsUiE5y7Ko+gkTs3Zjw0QCwssD2l8G6ZImUpFBo9
 /JK6Jyidh1P4MrRJM4IN1Ebdq8C2TLTx6JGGWOIW7/HKVCH37WsZb47Jg8+enCQu1G8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRzw18B3/fFCy/3BbYuuFRfGZEElksOmrflaKNbcQe
 yPNJVfBOKmBXfyGLxOwxb1V/BpWDgjefxQnux+d0OFo8rNJIGvnPfcauzvKL3kFithdXj4Bl
 cFQTjvNORN5k2mQRbD8VrsckKoXna60YN7EaDc8eRW4pMKLJdwvg8cjkn8xszjE0wGjoUGOG
 9FZJ/3mKKyome7uUzS6X9yBxZbBkFJpJHpU3ZAox42I1r5GIxz/+m3SCR35j+qNxV/R8TZHE
 p0vFJs45+6KJSW2GQEB8+4NHmZy18evmiDQZtZuqDr37aqRroISrIdHIBhHwTCEBJ43Sxwrn
 1YVQMCTkjDUhX0iauki5QQLPrFd8Z1hTqqJcI8kwOdiWys4eUUAlcLVT+nVsCaxSw0QSBPu1
 F3+6gDxIablS2XMms5iuQgOFhqYGCaaYg2SzitVcFxoPTGaQtwRWCFiXi/hwsocmTnzUkUm1
 fsNDaZY/3NH1pbtE1Jy6qCyiIGSkytO2ZLLlxqu4x0EmrL/kx+1uKGfYKf+WqcYFlq+JBXDB
 j1JR8pZi9+zdG+0xCY3AuYHXI935M0I6j2F7I4aYze3XurNayFnawLBOVv4Z5gLdzi29V7F9
 63SkuwFnfVGukp0wuaqjIZIyFysmAjiu6t9xv/7mS0tURPd8b6ERBDffU8LN6d5WS/GKrN/5
 V9kN4vvey/dk/2ccWLzKnLbzhFbjPfyFTGO90AmNRxh+YVsrA2IrzwFR3v/1tD1A8lLMj1mF
 gFKZ4LqIzpC8tKRYgqZyld/lAVj9yBI0sgjxzuDoYFDCQQpk6eG+nM3qHBprUuCHCQvQfcOV
 GQ9CtG4vfONhHzooIyOuYVIW5MblI752kn1OSed5fIAAHCTZAIwHOKdlu8eqRaUq6LBPE5qQ
 t7+ciBm6uyezDj0A7d+Rt9LaQmyRfrfeqCRCaNE/VP6dq0JBClhbar+te6iHPPcgSAAn5ozL
 FtRAg3dcRMij4rkY0x3GyTc8XM0z0YumobxypmmF7r0pWh+0HBEyh9QFTkvqk=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43024916"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0dDvNMXIwg3AJbVqYpB4Bj10OwKZ1t6iLdCSj4nSI+4C397cFTGGA+OkZkCxHkDnuH7GvJBQQ8sloWye4xya/waE86uUQ+axV0/jrh6DYbYU3kcsLJg1bxQY1eU/iRlk8B/7e+Pn/dVc0jHth+tFTPbtLQZ8tLihQSJ1F7xxxm14mFMR/w4uW3liCljdE5ur4PlqVNfadoCVeVBTf8GoRaCVTv4xPGebCTDnA/vP6mlYe6rFqgjqCTcvDHcMG/DJ438T+oyG+PLSneYqbIAmj/ITYf5isEVX9F00rd3mqmzmqlka6qd52yB/+X8iIExlc9ZNju1Po2sSHOeuAwrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONepewlv+FsTt9OZUtOs7BhlRHHkSUMAl/yz4LBnMrg=;
 b=gxEIOh6ZtFhruRqzuO/FFw+lDzlJOsBbnTAk1rH0hv7q7xwWGH6kH635+mRSP7BPjDscdgdX53hC3ROUQF2bB/ZtcPEcQdgg37BKY5GNrVh5c0DXTPjNJBAmMgsHEDIpvEgIUgf+si0cEqq+MNx9o/8g82eEFV/67HyczNz9idzOZJx+bgvLHwxD1Cg6xWvQoIBAqlkVLpL58DIqYytgKj0aEXfzA9U/dOzdeXLkHaQY7JnOkfpeLmMpsS1eMNaj1JbO5bty/xl8lGjv6agG5vlZ2G3mRyU7bvlDQUYz50CG7Pw238o2z3GL9tubNG0GPCmCCpePNaeKSrGLezN2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONepewlv+FsTt9OZUtOs7BhlRHHkSUMAl/yz4LBnMrg=;
 b=GqcdB2yhVAUpWxDWirdXokfVahn1c8vj8TA1sA+nFEIjWUmg/RQhzDBGPIaMQ0jTze3SGisDyW0fSCboO5coM1fd5EuwjLtlAHAHFp1Nw8hZm5PDii8X29xRUjW3DQ9WS3KDFl/EodNgAo43PYTLYXOvQ+ebh8LDN2V3Tv0ZBRM=
Date: Tue, 4 May 2021 13:58:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Wei Liu <wl@xen.org>, <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 03/13] libs/guest: allow fetching a specific MSR entry
 from a cpu policy
Message-ID: <YJE20/M+OCER2vPn@Air-de-Roger>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-4-roger.pau@citrix.com>
 <273ba6f9-dee9-00db-407b-10325d21afae@suse.com>
 <YJEoS6P1S6NbySFd@Air-de-Roger>
 <54c48a0f-075f-c379-eeb4-60b4439d8907@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <54c48a0f-075f-c379-eeb4-60b4439d8907@suse.com>
X-ClientProxiedBy: AM5PR0402CA0001.eurprd04.prod.outlook.com
 (2603:10a6:203:90::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19575167-aead-40ce-b79d-08d90ef3e766
X-MS-TrafficTypeDiagnostic: DM6PR03MB4970:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB49706CA96E017F604A0FADFC8F5A9@DM6PR03MB4970.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajyUbhCGr9pvc7PPVqCQmrFomm8q8LPjQ0/xaf92J82gYSx0r7dRsRwmddJcrI5rSoSN27AA0sKmk+LPxcX48zkHGtK2jv0BCO5WARtZ+GIsrZlReREB3B9mrVrMZFtqFesJHRQeUWuNrL1i6sNJo3rpHo9lDYWbl4bd5kaVUwBzrCpAJgaDyTTaO6jjIUcLcFE48xc0ID+hrQzeJhIz7alaYRKluImwJ3GtwXveU7iw5M3TWJnq2p/teHO74pZRN+NeBVkHp4k7AGkFOwL0ZTlJPi5x6MPNdP5GvcAvlGYVwicHSJAVohZiEMMvjmB248/gNOdbT4r+3v+2lZuA31WT1jyVMvymgiu7qm2Otffm/M00WRSTi8jlkSAM9ObQFm3BlcqS2lBFCqXs8uoGtuvVDhZSnj6F/B/MoyUYAxK/1mr80n8mIT4+F0IVoIqsL8ChLzTHOWUePmKIkixxagnwVe7RKLkLlFYZSf/0eIgdQAnxENgesXTxjZVin2CXJyVs3q6dur2AmES99XMBzDjbd3h/yUJtco+ZsjtH4JzxTpwkJZJQdKbqq729OvDePlguiS6MIIh/lnwhxOVeCwcpXmjgnFtK1lSO91wuZKY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(346002)(366004)(396003)(376002)(26005)(6486002)(5660300002)(6496006)(8936002)(6916009)(316002)(956004)(478600001)(4326008)(6666004)(54906003)(66476007)(9686003)(66556008)(2906002)(86362001)(16526019)(53546011)(33716001)(186003)(83380400001)(85182001)(38100700002)(66946007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bjZ4NEh6N0lpVmJQZWt5SjdoY1VLa0VvUWJwdXFXbU5HMjVXYTQ4OFp1MTNN?=
 =?utf-8?B?SkU1R1l4a1hORyswY0NETGJObkpmTEVqRnBWVVBzQ1BWdzNTb3BCcXVQTUpY?=
 =?utf-8?B?Zm4zZHhOcXRnWlkyMzhsYWpHM0pibzk4dEd4T2RFK3hyZzlVYmU0aGwzcnVH?=
 =?utf-8?B?aG51dWowb2ZSaU1vdlIzL2RzZjZqd2pRdmowdXFrRHFtTkJqK1poMEpJRStn?=
 =?utf-8?B?OXRaSi9MTVg1cTZySHJpVzVNZ1l2cVdscTE0dnNnK3RxQjh2NzJLUFhmVk1X?=
 =?utf-8?B?QjdXUlBqeDN4elpaamhIbEIvQ0orckpBd3JQcDJoZzgyUWtYblF6MEJCSm5y?=
 =?utf-8?B?dkxHRzJkc1RZR3puOFJYUEVGNTZQdkRVMzdZQzMvNm15MDRQK0NwS3dydUxj?=
 =?utf-8?B?T29zN1Q2RDRzQ1RkNXRCUUVnMWhlUTZaMUIvQjRHckk0WXEvek4xVFZyM0g0?=
 =?utf-8?B?ZHlTZXRVWUJLUUFFeU9MWXZZZHluN2RpZlZzbk5KOE9tUExXVVN5ZUl5VXB1?=
 =?utf-8?B?TzlUTW5aNjMrZEwwbk14L0JLQVFGZ3Iwa1lGdkdYVE5zRXVGaVc5UTZtaWtR?=
 =?utf-8?B?MERtcC9WY3l5ZUJLdkY5ZW03RmdDZEwvc05NQzQwR0NUcGUwYUR2dlMwdm0x?=
 =?utf-8?B?N0YvR3hBb0twMHZJN1Z1SEdNVzVVeDFUQThDL1B1OWhLMzRJaVR5YW01blBN?=
 =?utf-8?B?RVNEWnN0TVYxdWs0WkVlNkRhemtIQ0VPdGVNN2d3ZjhMRUxIRGh4bDBBNzA0?=
 =?utf-8?B?MFZwZzJMUlVkVWM1NkdhNWFQak8wZXV5UmJmQWNqNitVcXJYSy8rekdST0NJ?=
 =?utf-8?B?YUJjNEVmZXdLZ01leklnUm9ySWdCNkZJZlh3NHNYQ0Z1VTQvSVRUMzRyREFi?=
 =?utf-8?B?c2JTaWhsbFJZMWVIUVBGL3NGa0xCWjR4MFVwUHNQNit4U1VES3M1c3lrT29i?=
 =?utf-8?B?SS9oM2FjTFJQSVgxT3Z5VjcvZWp3M2l2ZURlSWdpdjd4TEVaRFB3Q3lMdThm?=
 =?utf-8?B?UEpJUnhSdlp2S0JQOG5ZNWs0U2RCSXpiZHpxdzZwRXYvT3JsN3E1cUtLMVEx?=
 =?utf-8?B?M0dWRFVsWXV1c2dxUVZ6eDRSZFBWeXRpcHBDTjdaZ29aU2RpWW5KeTdqWjRy?=
 =?utf-8?B?QnJOaEpMOEpqU0NGQUVJQnZjT1BDRHk5ZVpPUU05aVpDZkprVS9tQlRoSjMr?=
 =?utf-8?B?L1ovVG9ETGQ4ZWZZQUp3bm45N1hIaUlOM3l6cndoRzdORm9LbmpKY2RuajFa?=
 =?utf-8?B?UnpKQXdrNmF6czR6V1BucXhOa01QN04ycmdQckJBdjgzVTJuUS9uZHJLWWly?=
 =?utf-8?B?S3gxSFc4ano5NHBjUkdaeVZZNzRVZzA0eGdqN0xaSis5NDlLc3RYU1l4cFhD?=
 =?utf-8?B?Unh0L0hZMHlxdlo2bVNadC9aOHVITDIwVTRmWjY0Z3BmZG51QU9yU1Jidzda?=
 =?utf-8?B?cWJhQU9tekZFQnJ3c0lSUjBZdUJwQ0JoUHAvK3ZqNW52NHN5ZlVIR1k1QzBj?=
 =?utf-8?B?N1ZLY2FrNWhmSUlFdlNReFk2QTZNdzJwNGdIZ0lkNmtCZGRDejlEQytoWmU5?=
 =?utf-8?B?VFpEZ3IyalRFaVpqdDgrK0VSODVBS3lxWnduQ1hrL29mK2NPKzU3a2R1WGJa?=
 =?utf-8?B?d1pKRnZVTjcvelZhV2ROTGtVQzFtbkY1TkxITlQvRkZsNERTU1NITEZrdTZT?=
 =?utf-8?B?SkZKdi9pV0dvanBmSDhXVUc1S3poSFFVV1Z3eHB5eGdoempQSUQ0V0lucW94?=
 =?utf-8?Q?m4Is1HoKtJP0Pja2Q3Z7WNIV3FSMOeYZwB+VDLP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19575167-aead-40ce-b79d-08d90ef3e766
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 11:58:17.2522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jloVTjBGbq5LG2y8Wwwtt4Zm+2/i5OLDF/53JFSY+8EG8FB+FTGaSL62CTB/tPMVWJg75JuAuXtPGpOx2AparA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4970
X-OriginatorOrg: citrix.com

On Tue, May 04, 2021 at 01:40:11PM +0200, Jan Beulich wrote:
> On 04.05.2021 12:56, Roger Pau Monné wrote:
> > On Mon, May 03, 2021 at 12:41:29PM +0200, Jan Beulich wrote:
> >> On 30.04.2021 17:52, Roger Pau Monne wrote:
> >>> --- a/tools/libs/guest/xg_cpuid_x86.c
> >>> +++ b/tools/libs/guest/xg_cpuid_x86.c
> >>> @@ -850,3 +850,45 @@ int xc_cpu_policy_get_cpuid(xc_interface *xch, const xc_cpu_policy_t policy,
> >>>      *out = *tmp;
> >>>      return 0;
> >>>  }
> >>> +
> >>> +static int compare_entries(const void *l, const void *r)
> >>> +{
> >>> +    const xen_msr_entry_t *lhs = l;
> >>> +    const xen_msr_entry_t *rhs = r;
> >>> +
> >>> +    if ( lhs->idx == rhs->idx )
> >>> +        return 0;
> >>> +    return lhs->idx < rhs->idx ? -1 : 1;
> >>> +}
> >>> +
> >>> +static xen_msr_entry_t *find_entry(xen_msr_entry_t *entries,
> >>> +                                   unsigned int nr_entries, unsigned int index)
> >>> +{
> >>> +    const xen_msr_entry_t key = { index };
> >>> +
> >>> +    return bsearch(&key, entries, nr_entries, sizeof(*entries), compare_entries);
> >>> +}
> >>
> >> Isn't "entries" / "entry" a little too generic a name here, considering
> >> the CPUID equivalents use "leaves" / "leaf"? (Noticed really while looking
> >> at patch 7.)
> > 
> > Would you be fine with naming the function find_msr and leaving the
> > rest of the parameters names as-is?
> 
> Yes. But recall I'm not the maintainer of this code anyway.

You cared to provide feedback, and I'm happy to make the change.

Thanks, Roger.

