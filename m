Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F125778D651
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 15:49:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592948.925816 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLZM-0007cT-O4; Wed, 30 Aug 2023 13:49:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592948.925816; Wed, 30 Aug 2023 13:49:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbLZM-0007Z0-Kr; Wed, 30 Aug 2023 13:49:16 +0000
Received: by outflank-mailman (input) for mailman id 592948;
 Wed, 30 Aug 2023 13:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bwNt=EP=citrix.com=prvs=599f699f6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qbLZK-0007CD-Ah
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 13:49:14 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 000072f2-473c-11ee-8783-cb3800f73035;
 Wed, 30 Aug 2023 15:49:13 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2023 09:49:04 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by SA3PR03MB7466.namprd03.prod.outlook.com (2603:10b6:806:396::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Wed, 30 Aug
 2023 13:49:02 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::8f94:c73a:ffb7:d5e2%5]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 13:49:02 +0000
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
X-Inumbo-ID: 000072f2-473c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1693403353;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lS9kKOqKK0N9SN7YYoaPMuD0/5Jb28uu8zuXueUAjI0=;
  b=KftTnxLsShq6yez380/F0HWhfY1zFEBpLHjsPRh9If476CAtuSjhQM/k
   /9g0PT+C92giXorpz8369UPANHcLoQVkLy2oTFccMFSD11ydyimo1cIOk
   P21xTn5qTWSrce1oK7OpMJ9dIUkf2heAmG74Z3uNPJe7UTUn6Et1gS0w7
   0=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 120393932
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:iOgMfKJOlYRyizLgFE+RX5QlxSXFcZb7ZxGr2PjKsXjdYENShWcFz
 jYbUWuGOKuPN2X9KYh0a46+90wD6pCAyoA1T1BlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrZwP9TlK6q4mhA7gdmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5XJG537
 cM0IgwBd1exg7uZ3qyhDapF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHmjA9NJRebinhJsqFaD6EYBCwVMaQSci6ewun63ae4PE
 lNBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4qjV5QGZQGsNSDEHa8YOu8o/RDhs3
 ViM9/v2ARR/vbvTTmiSnp+IpDa7IgAJLmsPYyAVQA9D6N7myKk6jwnGT9JqOKS0ktH4Fzz2z
 z2Q6iM5gt07ldYKza6y+VnNnhqmp4TFQwA44AnaRCSu6QYRTJ6oYcmk5EbW6d5ELZ2FVR+Rs
 X4cgc+c4esSS5aXm0SwrP4lGbio47OJNWPaiFs2RZ05rW3yoDikYJxa5yx4KAFxKMEYdDT1Y
 UjV/wRM+JtUO3jsZqhyC26sN/kXIWHbPYyNfpjpghBmO/CdqCfvEPlSWHOt
IronPort-HdrOrdr: A9a23:tTqjuqO8ps/uxcBcTsCjsMiBIKoaSvp037BL7SFMoHluGPBw+P
 rBoB12726RtN9pYhwdcIm7Scq9qBDnlaKdg7N8AV7KZmCPhILPFvAE0WKI+UyDJ8SRzIFgPJ
 BbAs1D4Y3LZmRHsQ==
X-Talos-CUID: 9a23:RMSgJW9ctOhf1FCYQhSVv24xFfk9TVHX8HvJZH28UEl3VqfSCnbFrQ==
X-Talos-MUID: 9a23:/87pZwqdpg3eYVQHHAgezzpyGu164Lz0NB8qu8sPi/mNBxAgAijI2Q==
X-IronPort-AV: E=Sophos;i="6.02,213,1688443200"; 
   d="scan'208";a="120393932"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVEHgUR/2lLpyYJYVkGbh+a+b6nOgysGKCmUKASzT7SdKOBA6QxYnODIPg/YOVHTnaPPemwoA7B9zqkMQ9v2pa+Vp+o3EHIG+IYHHdBUe0+Jsx2gz/bGu4zvoHBrhvykTFAN6NHv0G14tytMzVTc7LqZrTBZ+HbLh7dnVv9ozgP2hylmXrp7bcLIhwAArmUNjxHmdv2JB0wggmtqIE8vtugLJ1xA/8g/OnCjVLYGkIkd/i1hBj9wYVJ+WePpcEs5TgYqPc8yPkaP9zjjYmOdvCAKKjez5Ec/clmCh4zmiVWIA6AuFJLEEUhVCOhdqOEG9op4OpDUI8FjVRiDeR78Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZkvpPDYAJc09CEQjtGnfrmOK3SfiysM9KzUYNFS36U=;
 b=NWUGw5HhHpHumppGZEYNL/FHHnXWu9u7mAWp7PJgyEXPdXJG42+pbLGRvZb3NOrb4GCzyl1JDPfekpqwQI6UhJysCqJPcCRODjmvGyDk07azimfLuXDmX8w/t7aV1Ju2QOZv+gsh72Nzge5tSzC4lEtIBAoTjS2Oyds8YjV/X4OSWefVYsdYYZNJVL+g+VszFsSapm2HoqaDFmfifbf8fsL1oquaNnlcovxGWBklUbZmcHAUfdzQ7OReUgDuk91R/RJnAa0pd0YNQNs1JOtROBxDvmOo/00BaZ5daXAeRpbgm2DRyl1GhypcPqintiWNnsmyXKs0tUftUmGpvWscag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZkvpPDYAJc09CEQjtGnfrmOK3SfiysM9KzUYNFS36U=;
 b=TxsWnxDLMHUuM2AKs4iJUdJ5JqegjBrL0tNESh5vKaVVGrxAfzOx34M7Vww/bGyLkjqHL59Qh8P5+cpHOF5vetaW+Lf7uPOHKK1HzzrsV60KCinDXjiAmWzyKofqBqSEEm6TG8d9RXx+meKYfeJqpy+/VGIgz46PKXEK96wgHyY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7a57d56c-d375-493a-0360-92fd14d4c227@citrix.com>
Date: Wed, 30 Aug 2023 14:48:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/8] x86/hvm: Only populate info->cr2 for #PF in
 hvm_get_pending_event()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Jinoh Kang <jinoh.kang.kr@gmail.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <21cc28b9-91d1-1e6e-23ac-00c44f3ec08e@gmail.com>
 <c668f355-0a31-0ffb-a7c2-4fee46705a3e@gmail.com>
 <5d19675c-993d-974c-425d-bd16d3e85905@suse.com>
In-Reply-To: <5d19675c-993d-974c-425d-bd16d3e85905@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO6P123CA0038.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::15) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|SA3PR03MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 13361532-ff7d-4838-4e55-08dba95fde26
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0tIIRhRNj1nWCFhkiexIZUgIL9KKhqgz7UmI5/oet0w1gQD0HZFD1DXqNBaJXzffMcVxqShfzT19gCY1MRw+Z3cn+PvGKge3Za8nZoKb4yCWwbMjxT8oAsYB8NxzMnf49yA3hFREzJVmYy38Mrjtj1nrgbu5n8zRpFf78KmFiReNoRfP3XmpcxRJ/GuWosDeP6QxVqCzQgrp27/JtHB/P/mow0TI6YTFpsGy2L4Lwof38r2R1poYRhDtDRO1DfWKK4QI8yeiKh5gGyZRbTME+87jm8hOAwEbntqPLcwPfbOAFS50xelOYI6Bb8++lFqV5kts/689Q+BVmytVRcOB4TDYYpuH4iMwqEQG98AOypbBepM66I56mNedYpZPXuFRbNKVs7YldHbvOUluZCfS70k4GR0/2XIWZlsn62WjAFanSvbmJ0LKzByAVwsb5prildrdX0LsmdaZSW7MKJg9DQJnVfyLWdpuZo5NakMAO75g9AraVIyC66nHpBBsKUk05k9ECPk64wVWUp9GDBs8JIkcxoCHQMbbjNttgHV3sFM3rnUc902cY/aLSDyRGUP7emCwblcMR1YKJeicj4NczIYzr3y6Rcb1Nqxsp7N3kLHOZk7ZaphRrhmsXaCnAKTlxet78tYAOQ74gLCVbgj7bA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(1800799009)(451199024)(186009)(31686004)(6486002)(6512007)(6506007)(8936002)(66946007)(36756003)(86362001)(38100700002)(82960400001)(31696002)(2616005)(2906002)(26005)(53546011)(478600001)(83380400001)(6666004)(110136005)(8676002)(4326008)(66556008)(5660300002)(66476007)(41300700001)(54906003)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RU5yYnlZMUI4WTNQbjJWTENxeFk3MGlsVit6Vkk5eG44eDRyYlFVWmRPbnFs?=
 =?utf-8?B?ekZCVStXSWphNnZ0K0dZRytSSmVBcHNJM2VlQjUzbzlyVzF5eHFpMk8yTlZE?=
 =?utf-8?B?THdsUmlTREJjNHJ2RkxGTnduUHl5Z3NhZWNqTmtnNDhENmNMM2k3eVZqREhB?=
 =?utf-8?B?a1RGOTdlTThSRjdJdWFFYTYyK091aUYrQ3haaHJvMStqL0hKUTNDd1ZLQThX?=
 =?utf-8?B?cW80YmhFTWhNZ3pqV1VQYkZrS1JDSXhoZUF5aCtPWkpjcCtaak81TDl6dEJE?=
 =?utf-8?B?aklpanBjRThGT2RFeU0ySjdnSVJ1VHpleDVyR1Q3K3dXSlEwQ0hGdDdYMVUr?=
 =?utf-8?B?bUsvSkQwa3oxdU4wSmRObW41dUE4c2RUY0lPcU03eS9OcTM4M0V2cXVyR0s1?=
 =?utf-8?B?WGNoNS9VVDl6cUg0MDgxa3dOU2xiZ2lGWXFhM0pBNzdHdlpoTDJpcmFEdkQ3?=
 =?utf-8?B?Rm1rQWxsZjJ0TnIxc2lqY1hPajNhZ3JPbW5Yc2thaE5KeUI3R2Z3TkhvYVlS?=
 =?utf-8?B?aTkyb0NXZFMxNUhjc0VNcm5taVJib1VLc29kKzJFM3EyUm9vaWpwWDE4aUVv?=
 =?utf-8?B?QlJSRVZaQXB4d3R1WGpmYlJrQ1pNQXlMR0huN0RkWkFZYVdTVjBqN3lHdU54?=
 =?utf-8?B?YnJ2RTNQN0NBdytKZUVBUkVqSndUdmxKdGdvd1NOVGc5TVBwZ1hzWE9STUxM?=
 =?utf-8?B?ZE0zQVBKV1p6eDVuWE0vUEwwV1F2akhuVGw4ZHo4V0NjalVoWkNYdEV6cnRI?=
 =?utf-8?B?QUhtRVNabTNTQVVob05mTGd6R2h0cUpLVUN5WGZKUndLdTBLcHVXRmRkTndz?=
 =?utf-8?B?Vk40cTRuUGdacUgxQTdkZUR5UU51NGZDaHBlcmNDQTBnWDVUSTFvakpDTzI0?=
 =?utf-8?B?SXZkWExpNkY4VmNrOVhtcXBKWW9naHZVMEJieXYvR2t5MWNJSDk5eGdiYVBV?=
 =?utf-8?B?UjRobDNPUS9ScFJKUyt1WXIycnJDNkg4R3RiUGpSSmZDVkM4dVdnRzk4R21S?=
 =?utf-8?B?L2JmTEhzeEY3N01VSWNsS1Z5YVBVNDNKY2krV1g1MFRRNVpnYzIyeW5LT1RX?=
 =?utf-8?B?ZFIvRmhsQ1pzZW50cm5vdHVjNWMvTy9icTFFdmlxckJScWpMcnZ0RDRtVzJJ?=
 =?utf-8?B?YU5NeU1LWE1LeFJ3eVlTSzdxRXB6UzRtSW04dXFta1FSN0RlVDVpQ1FLRENx?=
 =?utf-8?B?dHBteDEyQ1loY1huVmpBTWVYU1RtZFNta3VBZkh4b2hPTVp0R0Q4Rm4rT1N3?=
 =?utf-8?B?MDFIVkNkeDdVb3V2TTJ6YnZvYkw2bzlLQnprUmZHc0xXS0JlY0svYjRiTVd5?=
 =?utf-8?B?NmN5WU1TKzBXUDFmbDl2UXpKaUFBWURtbHBzQ0psR3VabVF6YVBXbFBhb0NI?=
 =?utf-8?B?OTc1SnJJemVVemMwTExWVWRETHNiTGNNd01pbTlJQU84TGF6WWRQZzFXME9n?=
 =?utf-8?B?dUIzdnN0UDFLdUFDcnExRVNnWWZVMlVvS0FPck1KR0R6bmQ0YUtXT3o4MnRZ?=
 =?utf-8?B?UXJONGcxK0poZzJIUmQxWkhRcElqM0MvdjR6NFJFNVV4Q0NYZTdyU3I0Rktp?=
 =?utf-8?B?YTVYbTkwOHMwNzNGZmNRMXRRSTJqZC9ObmFKc1NYa2VMOGlITnNMVllPbUs5?=
 =?utf-8?B?WnFTYnI2TUdKcjJ0aTZUME1pcXREV0pLM2ZLTVZFYUhpcjk3OGRWcVZ0RFl3?=
 =?utf-8?B?Q3ZYWm5PbExYVTVYc1VvUzQrMmJHTU9CcFgyRTNQdkRFb3E2QnMwa1Jic2Rr?=
 =?utf-8?B?YkxVRlZWc0dDL0VJcmpqRm8vVmlUdzBZdW4xKy90WHV0elZUWGk4S05nSTUw?=
 =?utf-8?B?VEladzNvK0Q1ejgwbFVjcTYzNE5IRkd0bGlzV3crSFZIc1M1OFVKSHZmSytF?=
 =?utf-8?B?c3c2dkd3L0ZkcFpSV1YvLzMzYmRCc29MZ2tQeC9QeU1WWFkvNjEyQ0RsZFl6?=
 =?utf-8?B?bmV3VFlFSWhzN3ZWeEdHZmNpVDhSa0hTcDRGNlZpVTh6aDhxdU5wZjNEYUZn?=
 =?utf-8?B?K0VHMjVvSktudkllQXZmcGprRENlQVpqWDNMNFVHZVZqaEU3ZCtzNmRYeWtR?=
 =?utf-8?B?TFFneHZMOXZGYkt3dHIyc3ZvRjJOa0htZXp6NTNpem8ya0wySTlqeFVKZWxN?=
 =?utf-8?B?eGdGTGhhMkZEeFJNRjRxaDA4aE9scHVWa2FXSHdDQVVESStZSk5PZnc0RnRS?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pPoati8MP2tLHuRDGzeYIQ7/W6EuthpJ7tF6vnGhhTcn8qnm+GkxJpOmzF7jXkA0W3G+DF+8/Q1yisa47mcxf6Xu0k1WBe/um9gFNlMsmdeRujK9ZFAu2RbZ/J5JDK2KsijSSLOOfxMAr9f6R/VNcCBRqPJfqr3ENzyH8oV+FN0z4nF1kM11b9Gpt0iUcDH+rgxI8jrxccKXUL4WFq3b3grMokKrPz6336zEJuwGl2yAIxfalfrN9AXqXVmfGVQyEZ8GTSMjWKFnCypA+fXjTTCuVPOIqwBvlZA4RHXYbv4FlPbiZiQ6fGVtcCTregsSB3tKa3C/8zXgwneBF4NkgkcetBQDjLYogEj3a38ClEWZIK6Y0J3EXTS56r3aBoSGlRX70Ud+Ms8NOOjugkXj+YXm2b4eVMxi4VFcUoniuqtZi3+GiwgtFkSRowwg3rPv9js2bDnMRV79WAVW6ey1pasL6Z8RiZPse+8EQ0G8rwQrPPy+9uWm1OWbReRo4dSzISJCg9r71Obxx+9v/xlrG9Ra1akT8dBWDht6JKQnWrjCBbAgjbwaDylcz88gesO3njRWWzsQtdmfqTzooVJ9xmNyG2skmVtnNq0RkO6UjrBBZ4h0ZUY0ceq/iXp2J+BoPzZ8ZNQ+UAzRuJhhWqw5pcyEWZnEW43r2dzTZ/O+wSgqWqrJPFBovHopZgJq+vaugq2mRKDL8V4s+5tqh9sc/vgLIXuxUeyY6U/Q8F1mkHf6b3tJAapLs3vD68oQMtkylIuim6S27CVKCqZzI0n6xnhoCUG47keM9AzcWgkaaNhRlse7MITmPO7MAFFXn/Neh5i75pJ6nKggvbVoYEi33B5+247iGaqlpr8CqkOoM39m37KsRtBf9HP1TWJrhxVh2nw5UoAYMjcRB+Gq2ftTkIqp0fQ/FaRj2iYG1ap3ihs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13361532-ff7d-4838-4e55-08dba95fde26
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 13:49:02.0766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wav7t/0Rr0Ib3g15WAxfzns5DgiJdV+vtRRleBwTLKTBpdCxMqcMUViHyVU1De+n0y8EoAOnb/HmXnGyegF8eWPQvvqRKmVopJ9vvYG/yUk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR03MB7466

On 30/08/2023 2:41 pm, Jan Beulich wrote:
> On 24.08.2023 17:25, Jinoh Kang wrote:
>> Prepare for an upcoming patch that overloads the 'cr2' field for #DB.
> Seeing the subsequent change and the fact that earlier on Andrew didn't
> need such an adjustment, I'm afraid I can't see the need for this change,
> and the one sentence above also doesn't answer the "Why?", but only the
> "What?"

I agree WRT the commit message.

I don't see why, but I also didn't spot this specific bug so I can't
rule out a bug in my original series.

That said, my original series was RFC because of the Monitor breakage
and didn't get much testing.

>
> Jan
>
>> --- a/xen/arch/x86/hvm/hvm.c
>> +++ b/xen/arch/x86/hvm/hvm.c
>> @@ -503,9 +503,14 @@ void hvm_migrate_pirqs(struct vcpu *v)
>>  
>>  static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
>>  {
>> -    info->cr2 = v->arch.hvm.guest_cr[2];
>> +    if ( !alternative_call(hvm_funcs.get_pending_event, v, info) )
>> +        return false;
>> +
>> +    if ( info->type == X86_EVENTTYPE_HW_EXCEPTION &&
>> +         info->vector == X86_EXC_PF )
>> +        info->cr2 = v->arch.hvm.guest_cr[2];

For the change itself, this needs pushing down into the vmx/svm hooks,
because guest_cr[2] has different liveness between Intel and AMD, and
this callpath needs to work for both scheduled-in and scheduled-out guests.

On AMD, I think you need to pull it straight out of the VMCB, rather
than relying on this being correct for a scheduled-in guest.

~Andrew

