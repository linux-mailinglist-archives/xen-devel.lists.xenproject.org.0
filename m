Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDA8373C6D
	for <lists+xen-devel@lfdr.de>; Wed,  5 May 2021 15:31:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123128.232265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leHcd-0003vJ-87; Wed, 05 May 2021 13:31:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123128.232265; Wed, 05 May 2021 13:31:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leHcd-0003t9-40; Wed, 05 May 2021 13:31:27 +0000
Received: by outflank-mailman (input) for mailman id 123128;
 Wed, 05 May 2021 13:31:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Yav=KA=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1leHcb-0003t1-Cx
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 13:31:25 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8348da4c-c993-41eb-932e-5944ec5f45c1;
 Wed, 05 May 2021 13:31:24 +0000 (UTC)
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
X-Inumbo-ID: 8348da4c-c993-41eb-932e-5944ec5f45c1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620221484;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u1aQVaMOEVuSDFZnklw8RIgePENBBRhLa4zir0WEP2E=;
  b=gGQ9RIPffDD46JhgdJurmwOlhsWUbNwLAvix+0el01qofX4pRQdCcWNw
   XYlWoot/eBekgyeLo3zbOJGcfmnZMSup5Jh8zlJPFyWP9ug7yqZTxER+O
   Ym/+AI///oYiTux2n8HGrc36lgPCDcc8uM7pOB3EynxSlvFWSkwjVmY6H
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /ctoHHYfyu6KX2cJc/f72NTyZhoPXz0a51/FBUtroeD3E7EvzPVlUl4kECzvwK6rqp/Wzs6PTS
 2C0fNUzfW/o0ca1pqodKa5AMifmMqfj5/MCGSFWu4L1Oq32W03rrFu+VXRDRC77d3G4iKfVce0
 /dva08KTg8/wgYKD5l0mvv1eyoBWmdNnPOvTtpEiae2xD+OrObw8/gdaot9b3KaJqD++0t4RmG
 O2v0DlPUkHAr3LQFod3I5jaPVxKviI/KjdtafKfcH9tNHc9/9dsMbo+Zl1CtAEXwFDewPmn1Fu
 xow=
X-SBRS: 5.1
X-MesageID: 44635817
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UOE3Ia2TwSWSYwNleUpw+AqjBR13eYIsi2QD101hICF9Wvez0+
 izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/BIyKErF/OHUBP9sGWlaLtj44zr3iH6F0TFmdJ1/Z
 xLN5JzANiYNzRHpO7n/Qi1FMshytGb8KauwdzT1WtpUBsCUcFdxi1SYzzrdXFebg9AGJY/Cd
 647s1IuzKvdR0sH7qGL1MCWPXOoMCOqYnvZgQICwVixA6Fiz6p77CSKWnm4j41VTRTzbA+tV
 XUigCR3NTej9iX6D/5k1XS4ZNfhcf7xrJ4ZfCkp8AJJlzX+32VTat7XbnqhkFNnMiO7xIQnM
 DIs1McOa1Img7sV0WUhTeo5AX6yjYp7BbZuC2lqF/uu9bwSj5/K+cpv/MgTjLj50AtvM5x3c
 twtgrz3fcnbmKj7VDAzuPFWB1wmk2/rWBKq590s1VlXZYDc7gUlIQD/SpuYeQ9NRjn44MqGv
 QGNrC42N9qdzqhHhTkl1V0zMfpdno+GQrueDl5huWllxJSnHx/0nICwt0eknoq5PsGOul5zt
 WBHaJymL5USMgKKYp7GecaWMOyTlfAWBTWLQupUBraPZBCH0iIh4/84b0z6u3vUJsUzKEqkJ
 CEdF9Dr2Y9d2/nFMXm5uwLzjn9BEGGGRj9wMBX4JZ0/pfmQqDwDCGFQFcy1+O9vvQ2GKTgKr
 SOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+c06So/jMNpbhuoXgAbXuDYuoNQxhdnL0A3
 MFUjS2Dt5H9FqXVnjxhwWUdGjqfmD54JJsAInX9+Ue0+E2R8lxmzlQrW78ytCAKDVEvKBzVl
 B5OqnbnqSyonTz3Wug1RQvBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmF+OJhp1SdLqAB
 dSzm4Hv56fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IPDdo4nCI0lHIh8Dx/CGRAwuQsCkh
 YCVCY0AmvkUh/+g6Ssi5IZQMvFccNnvQutKclI7VTFtUudoskrbmABXyGnVPOWhQpGfUsQun
 RBt4skxJaQkzemLmUyxM4iNkdXVWiRCLVaSDieaJ5sgbDtcgFoRWKsjTiX4itDI1bCxgE3vC
 jMPCeUcfbEDh54tmpD2qjnyl9ya16QZll9cHx8rI17G1nXo3ob657/WoODl0+qLncSyOAUNz
 /IJQEfJQ5j3Pib/h+YkjTqLwRq+rweesjmSJgzebDa3X2gbLCSnaYdBvlO4dJOL9b1qNIGVu
 qZZi6YJD71EPkSxgSQv3opURME8EUMoLfN4lnI/WK41HkwDb7uO1xgXagcOMzZwG7+RfqEua
 8Jxe4djK+VCCHWZdGHw62MMGIGBRPXvGKsT+Yn7bpTprk/sbNvH5/dFRvEvUs3qikWHYPRrg
 c5Rq8+3ZXqfqlIVOYWczhC/lUomM+URXFb+DDeM6sbRxUVk3TfP9m1+LLGprokP12ZqGLLSC
 6i2hwY282AYjCK2rEbAZ8hOGh6aEAz73J54eOJHregQTmCRqVm/FCgNGW6f6IYYK+ZGa8Iph
 IS2aDFo8anMw750hvXpz11P+Zn9HumW9q7BEapFfRT+9K3fXSKja3C2r/9sB7HDR+6YV8fn4
 tLaAg5adlCkCAriMkP6ReJI5aH6X4Noh95+jFollnkx4ig7iP6JCh9QHzkq6QTeyJSPHiOhd
 nC6s6C2h3GkWN45aU=
X-IronPort-AV: E=Sophos;i="5.82,275,1613451600"; 
   d="scan'208";a="44635817"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DM+pDuxxqor8CAb3lKpqsp6DF2swLaHY3u3H3jpouE6D9gURV8goAod/BNjTjVqhkTXKHvdoFkcvn8ellq3FdmsfDVkoKaUHDbEGy3crH5dhGTH7Lb796jBbKXyFLhrH58ZvrnJ3FqTBbQkgMINquTS77R1z5Pw2HKioIlibQWF7NSqjJh58jg8imt9OBsjbXvzWTZhrOI27N8bg1IT/v2iSng0Ol5lnVSvBH+EExrFl653n/HVAia4i1MdoFDw8Xx45F2AXGOhuI+HAoT2v/L3l6oT1a9FWXkzX2uZ8/cn6o3hfG5zqdcKW6qu7bUbwqy22LXiU/g6JowuyboVXvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1aQVaMOEVuSDFZnklw8RIgePENBBRhLa4zir0WEP2E=;
 b=W69eEbvMPzWYHnkPc/zcdE0Tgkeh97kT/udO+JKOvXHcWHAAzfITGRDmsn595zlHxqnGdRFOiLvIk0CYHnZdzVup4/q/qIlRdabhq+1n5+I4zx8FxZQY5wnpUSOLZIU7fm9jd950BTD971quqEOiETaSVP2RsgyPLEplv/WmfFSu8YkVWDhO7HCQAIJHAqvxNnOI8Hg8tXfonQGe0G1OxuaIxeuA3Bru/fA0PgiAziSAdzkb1O4Ew+IaNgO7aEgIdzB+Av27KW3k3kZV2NEYBZSG5nlWBzcIE0yVJw5yMH9gfemvuPNOrOmmw3k3czgrvppr9FgJAvPNasA76itKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u1aQVaMOEVuSDFZnklw8RIgePENBBRhLa4zir0WEP2E=;
 b=Ur/Wr2XzuHy4UFdGT1U4F4gaTK8oNYr9hLNvXRSN6iPGxcGal6Osb2WVxAe6JbZAIZJBvashw3N0FSMX/j9cUs36oPelY2A1I0j+MVqByJdOuS2nLvECiAIz3hNHCDNElMSytdcDYGdw0dQV7XjtEV94RvhP0wvwruGHKDE/OLU=
Subject: Re: [PATCH] tools/libs: move cpu policy related prototypes to
 xenguest.h
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
	<jbeulich@suse.com>
References: <20210505111508.82956-1-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <41c22d5a-c84b-1ff0-087f-e4bb1e9108eb@citrix.com>
Date: Wed, 5 May 2021 14:31:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210505111508.82956-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0315.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4c2c0a1-a23e-41ee-b6cf-08d90fca1166
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5920:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5920758D15DCDECE05DB423FBA599@SJ0PR03MB5920.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: chDGEBBEZEfyZ9HdAIiU0jSqYGk3DjupFBLJKD4G6uMP/HdUEhnxn+9w0T0PEEH0imDlGnMnb9RKghRFFn7Q3ikLwW2J1WGid0leFjYj3hms6kkZ0SmpOIbJA7cWW1L7dmRXFFMoWuVgVIgfYSJTs0USWDwmCnbUDxB1JkptiM47ekyJtQ2bh4e7nmHV570qruc/0e4nmwvoKz0oNH5sgSozUr/ltiMyqatgWdUd+IQgFPeP60LndUBc8A5EtjaTMmH3OX8EMZj0/NKA+zfk/SzqjD0uv0beN2keqSThjZGWmdQFV0MqYyKGlosSeeKDeFH5jRmGstGki6EsNDLG5vHiyLxPOP3YAKhyzhNkaNYxVrRTqutHxb/8VDfy1gsSGpfSfuVwfNRUXVGD3PGTtukuckQWYDOcGUqWYKZc39D7hCZ6q1Lv3eLRDs+A8gTIfEVcF3sfcalzlsOxgVWQ7p6KCXm07UTbu6f6R01aepYI86+57BdHEx7L/8sODTIeAi5LVpBY9j14WjwCODSOKdtGl9+pZXJaTz0O2JwmEA7CknzQClUjGnagRURpvT03PD0VAi4JMuH/iz9H1uj75G6hksI4WX4rcbuRCZhVhCo7wtXSgzMgMudvI6XI88GDZK/Gi1O67RkR57v7TWFkfwimD9p9cbAhxLAjgSQutf4p8ODccW/Pbm//gWlSjjV5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(31686004)(66476007)(316002)(36756003)(956004)(66946007)(5660300002)(8676002)(16576012)(6666004)(16526019)(186003)(26005)(66556008)(54906003)(38100700002)(478600001)(53546011)(6486002)(2616005)(4744005)(31696002)(4326008)(86362001)(2906002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MkVWRWVvQThPdE1mc0tReFIzeGVBbmM0UUE1RGdiNmxFUVZXNWxHem5XK3Fs?=
 =?utf-8?B?c2JpQmF4eHhFWEJ1QkJKcm5ab3h6bTF2ZmZTVlErUEp2ZnMzT3llMGw5TTJ6?=
 =?utf-8?B?ZytZd0dzaFdqUHNZVXRNMEIwQWhxZGR2NGNrcWZHN29PeU5ydGh2dlprb2hv?=
 =?utf-8?B?NDJxb1F0UElkempqMUVKSWxTNVBpUUNxUGFHWmZYQmhYUEZtYWdWOW5ZT0Ri?=
 =?utf-8?B?TmQ1N3liZUF1UWhvOGVxellKL1BCdUxrM2VDLzhMclYyWkxwTDBCekhrRE1B?=
 =?utf-8?B?bHFRaWJJRW45Q0xOUzcvYTdma2o3QlJmRG9MTVk5K1dCODVCNVRFaEc5cXN0?=
 =?utf-8?B?aDFON2pLaTZGQlE1Ump1ZFdMVzJhQkxCQmVzS3g5QVBZSVhNZzZudUJQZERQ?=
 =?utf-8?B?Qi83WHo1NEFtUG9DOTJkcDFCbmxlQkMwWkliYXRkRGJmaDNVQWgyaG55L05L?=
 =?utf-8?B?T2VEeUliazVodmVmQnRQazd2QTZwQVpwaU54KzdDcDJma0JKOVZZeUtJUDAr?=
 =?utf-8?B?ZEh2OVFIbCtPSHdLaGh5VHRKcFduc044Vk1IYjNEdm45ZWN1VzAvQWMxMzdE?=
 =?utf-8?B?WmRseU44MXJsZ1RqT0thQVUyeVI2UHhYOTdSREVhVVcwc2RPVFErL3RQYS95?=
 =?utf-8?B?V2gyZkJIMUtMWlpEMEpkcXQwWXY3VjRNRnNUbWlzKzdLODk1SDNRVkxNRHA1?=
 =?utf-8?B?Q0wwWVdsWVlmZXhubDluNVBOUGpXVHpsd280cmRYV0gyUDBWRUt0QmdYSnVO?=
 =?utf-8?B?YzUwY0c3ZDI2MGk5eDZBMy96alRmeHVqSUdjR2JlV09tM0lWdUd1bFhpM1JD?=
 =?utf-8?B?bENnWVZCMVhmRStTb2ExUnNwQndyR1NnT052WVBRWEtXdlZrbFNSc0l3dFg1?=
 =?utf-8?B?dU40ZTZvRElNUlhIOWVkSmhWSVg4VnJkMXozM1I5VzBUWnJ6TzZDZnY0dGF2?=
 =?utf-8?B?T2puRWJRbGFYV3dIUEdVR1RZdVRkRWFXampwVC94SkJINndsVDEvZUp3dWdD?=
 =?utf-8?B?ampTR3BQdVh0YWFnaXkyaGR1RE5Kdm5RT0tvOFJkNmh2N3ZlZFJoUEV3MTRT?=
 =?utf-8?B?RUZtTi9UOFpmRHFPWElWZlcrSWtqWXhIQjM4aFVJMTAwRFZHU2Rad1l1bEJL?=
 =?utf-8?B?b3pKQ2pzYUpmdW9WbUgvZTZCT3VoN1lwNXF6WERmejdKVzh3UjBFQmdKcWxH?=
 =?utf-8?B?QmdkSndCdHpxcDhwekZpOGRsS1ZMKy9NV3IyU2hmNUI2TkIwWE0zSi85Yy9p?=
 =?utf-8?B?TkluMDNPTnVaZWpNSHBDdU1acThPQkJVc2N2RWtobmgzMGpnNnU5ajdTM1B2?=
 =?utf-8?B?eEg5cGhDU2g1VWdPbG9yN1BZU1VpdUw3bjd6OElXTFo5OEk3YVJaZVVJYkpW?=
 =?utf-8?B?SFhINlFaQU5lNmUyb0xCcktpenpOcStUekhpdVVoZjNSTnBqQ0dpUDlxdm1m?=
 =?utf-8?B?S1BqMXp6MGt6Um41d3crTE45clJyaDI1UUVDYzVSS1BwUEMraVJKTHlvUlBB?=
 =?utf-8?B?RGNLakxnTUZpOFFZUE5oaHlxd2NnS004VmdwVHpzWU0zdXc0TlBPY3NTYUZK?=
 =?utf-8?B?cGlmc3dDU1VwZmlpQ3VBc1BVZEU1MmpZQlhFU0svN09CdU12cXA3aXZ5VkVJ?=
 =?utf-8?B?YVlGb056aStITU01TE1xdmE1SHpKQm41cXgrVnJPZWNSRnM2TCs2UkdUL0ZC?=
 =?utf-8?B?MFpTZFp0MG5PUVNiU0VkT0k2cmdGYlEzWm1LRlp6MGVHcnl0UEVaRHpwSDVQ?=
 =?utf-8?Q?Fkc89Qa3Te1MEaLLxX8ZIDd21NTGPx1fDjuuuz6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c2c0a1-a23e-41ee-b6cf-08d90fca1166
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 13:31:20.0869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XXa96vJj/KTsKB/OV0ekoX8EbXRjZjs0YfO6bnmTm0Zd/qUkS0+HyrdHrAX7FE388+zJWgnhmdg4LPpx39zccQCkrxZ/Oo34yEjJe0RQ2NI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5920
X-OriginatorOrg: citrix.com

On 05/05/2021 12:15, Roger Pau Monne wrote:
> Do this before adding any more stuff to xg_cpuid_x86.c.
>
> The placement in xenctrl.h is wrong, as they are implemented by the
> xenguest library. Note that xg_cpuid_x86.c needs to include
> xg_private.h, and in turn also fix xg_private.h to include
> xc_bitops.h.
>
> As a result also modify xen-cpuid to include xenguest.h.
>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'll commit this alongside my type changes.

