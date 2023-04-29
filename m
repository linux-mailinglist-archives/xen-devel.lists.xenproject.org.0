Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681656F261B
	for <lists+xen-devel@lfdr.de>; Sat, 29 Apr 2023 21:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527690.820352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psqYm-0001mx-Q6; Sat, 29 Apr 2023 19:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527690.820352; Sat, 29 Apr 2023 19:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1psqYm-0001kU-NB; Sat, 29 Apr 2023 19:48:44 +0000
Received: by outflank-mailman (input) for mailman id 527690;
 Sat, 29 Apr 2023 19:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/eqU=AU=citrix.com=prvs=4767ec71a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1psqYk-0001kO-MP
 for xen-devel@lists.xenproject.org; Sat, 29 Apr 2023 19:48:43 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5b92ab9-e6c6-11ed-b225-6b7b168915f2;
 Sat, 29 Apr 2023 21:48:40 +0200 (CEST)
Received: from mail-co1nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Apr 2023 15:48:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5520.namprd03.prod.outlook.com (2603:10b6:a03:282::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.26; Sat, 29 Apr
 2023 19:48:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.024; Sat, 29 Apr 2023
 19:48:31 +0000
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
X-Inumbo-ID: d5b92ab9-e6c6-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1682797720;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eSL1KX72Djd4ue6cSxqJmzE9iKTQ2rMjQ3821BQWYyM=;
  b=SOP8ZAPln6l6DzYqxeGvYZ7w0/XLnSVwUZk4ZK4qMQtIKICmDFRt4B+2
   TsOT+AQh7vQbm4LUq5FOGqPpmsJ2SmFBis1ydA8gtj0mkBPjUX96nyMyX
   F64IExbs5+S5fttVqWRx6vspPaL0l0Je661yCcYf9uFEUbmQf/1pOXf/u
   s=;
X-IronPort-RemoteIP: 104.47.56.171
X-IronPort-MID: 106096200
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:dyCNVK3VJEL7FFC7wvbD5UZwkn2cJEfYwER7XKvMYLTBsI5bp2RVn
 WBOCGjSM/uKNmqjfYp+bI3joUpUvpeEnNZkHlA5pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBkNKgR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfQntAr
 PMCMxYxcA2H2MGwzb38Y+JLiZF2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6Kk1UZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqjBtpDSufgrpaGhnWu6GgNLTgcaWG5gtyDiWmPVZVwN
 2kLr39GQa8asRbDosPGdxixunuNpBMfc9tWDewh6QuJx7bU4gCWHWwNRHhKb9lOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hTq2NCocK2MYYmkaRA8B7tvkiIo3iQ/DCN1kFcadhdrwHDDs3
 z2QtwAuirMLl8kJ2q6nu1fdjFqEo5nCTgcxoALNTG+hxgp8aMiuYInAwUjW67NMIZiUSnGFv
 WMYgI6O4eYWF5aPmSeRBuIXE9mUC+2tNTTdhRtkGMAn/jH0onq7J9kPuXd5OVtjNdsCdXnxe
 kjPtAhN5ZhVeny3catwZIH3AMMvpUT9KenYujnvRoImSvBMmMWvpUmCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:Lw7gTKDPxWx9by7lHejKsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ4OxoS5PwJk80kqQFnLX5XI3SJjUO3VHFEGgM1/qA/9SNIVyaygcZ79
 YaT0EcMqyPMbEZt6bHCWCDer5PoeVvsprY/ds2p00dMj2CAJsQizuRZDzrdHGeCDM2Z6bQQ/
 Gnl7Z6TnebCD0qR/X+IkNAc/nIptXNmp6jSRkaByQ/4A3LoSK05KX8Gx242A5bdz9U278t/U
 XMjgS8v8yYwryG4y6Z81WWw4VdmdPnxNcGLMuQivINIjGpphe0aJ9nU7iiuilwhO208l4lnP
 TFvh9lFcVu7HH6eH2zvHLWqkPd+Qdrz0Wn5U6TgHPlr8C8bDUmC/BZjYYcVhfC8UIvsPx1za
 oOhguixtFqJCKFuB64y8nDVhlsmEbxiX0+kdQLh3gadYcFcrdeoaEW4UsQOpYdGyDR7pwhDY
 BVfYnhzccTVWnfQ2HSv2FpztDpdnMvHi2eSkxHgcCR2yg+pgEM82IogOgk2lsQ/pM0TJdJo8
 7eNL5zqb1IRsgKKYpgGeYoW6KMey3waCOJFFjXDUXsFakBNX6IgYXw+q8J6Oajf4FN5Icuma
 7GTEhTuQcJCgzT4PW1rd52Gy32MSeAtWyH8LAa23E5gMyyeFPTC1zCdLh0+PHQ58n2AaXgKo
 OO0dxtcrjexFDVaPV0Nj3FKuhvwEYlIb0oU/YAKiWzS5HwW/vXn92eVsrvD5zQNhthcl/DIx
 I4LUrOzYN7nwyWZkM=
X-Talos-CUID: 9a23:Bk5g5W0E0jD0hzsfKchFYrxfWdorK3LH11HsPVK8VkVvRbLSYFS39/Yx
X-Talos-MUID: 9a23:228M+QhD9pDxwUQGAnfXasMpCels/YGLAnw3k7YjgcqjBCI3FCu4k2Hi
X-IronPort-AV: E=Sophos;i="5.99,237,1677560400"; 
   d="scan'208";a="106096200"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxDl+COO8GYZ4N3xlWIFk5YURD2+5KAOIQ22l/aQQ8k2zrwpoJAq2ELwcHJfUXPGNbbdnd8e8EKOxD2gO2jNo9ruVQ2ddpnRthkGrD0POjrK7TPJr2Ds+7EaWLJ33z86gxXXBf9/XoYSr1EKu4l0s7WsedamYu5Ts8YVNe9mpSJ0udshGgLgPUx6292sROZVu15hynWaCBxher8IFFIuGe3AeTKzKn9r75jb+l+aVIhCli+zAmotN8+vLcp3KVvUwvxMXL6csJ4rtl6PSP9rMjWhKwNQZb+3cdVcBkJpvD+7KyiGpwLGZ5qIDd4cmOLHCZLN+LtyD6XZL0INpnkvvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mi2cszWA+xCK2a3jom6TzyTBnHGobW48pnHq9HdvvWM=;
 b=Vi7/NH9tphvXg/4q3XobjdX67dxBQyx0w9FOCIjgKs9BQDxi2l96ZflQxXPsGGq/zceUU5Wox0rcIN7/FuYzoc8Szb6PIIcHQpP5eT7JhDdl7nbaOBsiufyDMgZpyWpRiwsOtv98pT4eXDIhkqq5U0pKVdGcV+t+MsRERCw/Ks8LcZXTYPtC9k73taaLJ5a2XYimpbmjUbdI4mxgyovfZfZrVyHF9AJzBRsfSTlSDsqX3BYfFBMN4cjm69VGakLOwD8LIk2lYT7aVvzA8XozqzmLkh8cxHPFEZ2UEZPj6w44NCOGSeCaiRA/eLHgZJdyztPX2D/WNAsuYoo4K+l7AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mi2cszWA+xCK2a3jom6TzyTBnHGobW48pnHq9HdvvWM=;
 b=VJSczikk8eoIQ7ZIGPAZSwfqyNrNUIIR+5/jDiHqrVfbAGEi8Vf2Yj9waJtWj7M99yUMX2z7mFxmLAQHKBgOS0bbnf4VNHm0FxvgojtoXRFyyVxqVn1q9qqMOvaYbm/9GKINb6fKzcQRXuxzbrwSrFZIDn4nAm9sEve1LgjmZRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6bbc5ee4-66e0-f81f-112d-b136da71e7aa@citrix.com>
Date: Sat, 29 Apr 2023 20:48:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: andrew.cooper3@citrix.com
Subject: Re: xen | Failed pipeline for staging | 6a47ba2f
Content-Language: en-GB
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, alejandro.vallejo@cloud.com,
 committers@xenproject.org, michal.orzel@amd.com,
 xen-devel@lists.xenproject.org
References: <644bfbc6939d8_2a49bbb403253f4@gitlab-sidekiq-catchall-v2-78885c497-qxnp2.mail>
 <alpine.DEB.2.22.394.2304281905020.974517@ubuntu-linux-20-04-desktop>
 <ca0144a6-2c57-0cc3-fd27-5dbe59491ef3@citrix.com> <ZE0c/dEaIUglww+g@mail-itl>
In-Reply-To: <ZE0c/dEaIUglww+g@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bc::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5520:EE_
X-MS-Office365-Filtering-Correlation-Id: 97a0c597-971d-4c69-de67-08db48eab577
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HYWBhCn8yw8evM3GEG/gxtxNc8765e1ogdavWjK1ukssDDJin3SzdpLUXLS2uXVvZHGbtXpDR/o3lgQRITOVAPww93RpYGxUpzwpH15wGFHCoiHfjnFYlfCxon4GVk3alZFelNcjZCoxUWxwVQmwtUJ52zIaQzWNeBoxgDOKrvlwjcOjNJbpZMV5uac0JASJcEFUQvlnq9j5KwGYvpJKfZGBXMpeTAsOPi9aW8xh+su5KIoEvRpWK4xR5nhwyFNxI3RGY7S56FXfcxaygbsYYfgKSnlEHnTBN6eueojt+sCMp0XXohyr8JjjnEtKUKVezppBrsbK+lZ0HJI3Q9ohUie7BYQeKiuxRW3UJtl7Lf/gZv/L6iBNdqJlrvXQOMt0RHzvms2GFMHzI3yyCLfzWqxge16iYx7uxM3OaOpQOdISVwH65YYYq5mFtdqKRGdSjq3qNbVCEzwmJazXs/ZAr3Ue9kWeQb/m/bR+GsLke9PYad5DFbkaL9/Gi/J7SR3LImUoALJXpK3EdZJbhz3njE2Lyk10ZAl/Ris0k9fKRTvd/aX3I9ZWOlUBLLyS6SlRMDAYJ9ZcyFDxR53gEewQYkmNxadFYMFmOhmLOOUxk23i2ZTKE5y9cwAEyJY24zgg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(38100700002)(82960400001)(9686003)(6512007)(6506007)(53546011)(31686004)(186003)(26005)(36756003)(86362001)(31696002)(6486002)(6666004)(66574015)(2616005)(83380400001)(41300700001)(66946007)(66556008)(66476007)(316002)(4326008)(6916009)(5660300002)(478600001)(2906002)(8676002)(8936002)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXgwSkgraGk0ZWlZdjhjY2t4WXkyZ3JOdGwxQmNraGk0MlFBOUYvNldKN2Fy?=
 =?utf-8?B?dEdHUHVQTFlkV0wwUFY5REpjblZmMjFMbHR1bXArNVhqQmNpd2dwWXcxTk5K?=
 =?utf-8?B?UStVWEdBeWpwOFFaVStrVWlLbFRGYzVKSG9LbnNCMEYvUHE4VVpFdlEzWUtE?=
 =?utf-8?B?UlZyNXc1WTZlaGJhemwxQWVDZjl6aDE1cGdOTE9EdWpSMnN0Umc3MjA5WFZq?=
 =?utf-8?B?VDY2dlBnN1BBZk9YTWV3NkQyNDJCUWlXcTR4dnFpSHBDMnRIM0ZyY2F6VmYr?=
 =?utf-8?B?YzFEdUdqTGQweVo0clRib1FkVjFaak9aMTN6KzFuV0tWUHZOOXRmTm9LQVRk?=
 =?utf-8?B?MTNFTlJNaWoyempZY2ZWOUZrOVBCcnViL3dHS0piclpsRFRQdnd4elhxSVg1?=
 =?utf-8?B?aGo0dmlyUUE4emhPeWZtWi9PSUg2ZE93b015Q1dHUUsvZVNPNFpVendocEg0?=
 =?utf-8?B?VWIwYkU2OFdFRm1KL09NQzVqQW12ZlVMckpMamJvNTM3UU04WTVxdCtnUndq?=
 =?utf-8?B?a3FtWVVxYnpuQmZqcUk3SFFpRTcyZHVhNFZHL0lab01PQnZRdTBFQnNUMG1O?=
 =?utf-8?B?dGtvaUtjUEZESEM5Z1dtVjFCL1VJSGczdER1a0JVaDRTbTdOUHcxdlN0NkxC?=
 =?utf-8?B?bEFQTVliRDErS0VpaWtHMG5zNVIxMkk5Z09Wakl2Qi9KVjJVUXcwMFBCbVdt?=
 =?utf-8?B?Mi8xZStpbC9rUW1XZkVyaVhDSzJRTWxBRmY1SVlXd25PQVZCZXRzU3JPcERp?=
 =?utf-8?B?Wm5HZTErTWliZ1htWGdkTlN0UXVGZmQrTFhvb0dyZE1vRE9teUhRYjFTZ1l2?=
 =?utf-8?B?c2srQ3FNenNFcWFRREpPMEhmVmNLUjlqU3pUeHp5M1ZBeUtGaUNlcmVpQSsv?=
 =?utf-8?B?aXJYSWN3RFMxZktQcTkyYzBhL1orWGltbUF0T1dIeVJSMDZZTFlwRU9RS2Jw?=
 =?utf-8?B?OUQ3c3lOZU8yMm1EbEUvdVVLUnE5MHVnblZLVm9hWG42Rmg5TG0xQS9aRUd1?=
 =?utf-8?B?bmYwRUlXbjNxK2tSdG9ackVDckZ0RXF5VmowZW14UWxLcFAvMjVUWGZIOGdz?=
 =?utf-8?B?RjFmeml0V01XcHgzbUdnajJjQTZZVk90YTVLZEp2c0NabjFub2kwYVh6RDF4?=
 =?utf-8?B?VUtRWVVpbVdWTXFUVkJCMGRmSy9BZm53VDhZZXZ5Ym10ZVVyZVk0OGlkcGhU?=
 =?utf-8?B?SXppOFRjeURvV1N3dDlUZzh6dzVjMVdmU05oVUNuTzBRUmFVV2pDSWNQLzQ3?=
 =?utf-8?B?NFFTQVQ3Rjk3S1ByOHBHSEx2NkllcWxNblVmSGo0NlQrRERzeVd6OGhEdGZT?=
 =?utf-8?B?NEFESXpPWlVGTDFqNjR2cWtOWk5lTml4UUlyMTZ4dVlGY21ya3BMNzAvRHJG?=
 =?utf-8?B?OENzZllxdWlHN3hvc1MzeVVZdHFRM2Y5SUV3VTd6RmpWQmZQVDBtUlp6N0JS?=
 =?utf-8?B?RXZmV0FUdnNLYkR1UTk3RVZsL2RCRzFSelgxdUhrWVJvUmZYcnVXekp4eU1W?=
 =?utf-8?B?d21aMW9iMVlqSThSbmdpUUREcXMvc09odkhpWU9KaFkxckdYV21XZWxPREZD?=
 =?utf-8?B?OXAxZHZoa2tkY0FLZE1rTE5OY0gxanNjZkNTZjkyZ0lWYkR0cm90bXFLVmc2?=
 =?utf-8?B?WkZQNFYya1k3cFpCeU1jSG84L1FVSHlGSmlDQ3JndWIzd0EvZjM3TVE1Nzho?=
 =?utf-8?B?RUhLdUY1dGgzZHVQc0FPZ25SYVY0bElaL2Mxc0pJemJXWFNIYjBySi9Ca3VS?=
 =?utf-8?B?dlA2dGlPLzA4UUFibHBWUUVWNlEzRVA0SGhxNzJhMUw1YzVpdnlSK2x1OUVF?=
 =?utf-8?B?VlRyRTQ3U0t0NW1tcjB6dWRQRGI5ZGFvaFcvQ2tIN3BZRW9rUTNNendST2Fa?=
 =?utf-8?B?SG5jR2F0TGhJdFZYUVF6Q3UvM29QTmYzSXcwSWxzYUxVSEpNdVhnR3RrWWx6?=
 =?utf-8?B?NnhnTXAxTUl4WjluSkNRZkdwdmhMbVYwMnVWZkZVNnFQYXZkOXlZR3plQjBF?=
 =?utf-8?B?cEVXczdzaTVGODZBU1BmNE95cFo4WDdJb21sUDVEcERaaHpQY3JGOHhKYnFr?=
 =?utf-8?B?b1VCM0xGMlRNVnNMNG15ODBhTEN5Qzh1ODRqV3JNMk52VVRjL01ycFdJV21p?=
 =?utf-8?B?UmRnSTdrTExBWEdyRm8yRlpGelQ1NFlMOU9PNkJIL2JwRis1Z28vRWJoeHhC?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?RnBGaXpGRHU4S3lRSUNVMnd3K2Z6NTNBVzRBSGp0c0hUZy9kY0Roc3NPRE5z?=
 =?utf-8?B?T1hXVGZ0QTA5TmdnR1lxZmhVYnVNdmZranhLNndzSDZ0NGlqNVBBdWl1a3Vu?=
 =?utf-8?B?ZjE5VTJJSWdwbEZCS0VkZ25PeUx3cnJZSkdSWjBOaksxK1J0eHQ2eVpsNTcx?=
 =?utf-8?B?QlJpdkZtejV5OVkrVmUrQ3c1UXlaelVMQTM1T0VZaXZhSEFoTVBNT2tXRDRu?=
 =?utf-8?B?ZEM4a2t6bGlFcWw0anIxRHJVUENVZEJqZ09WcDdMNjJOREUxK0hXWnhFZFBN?=
 =?utf-8?B?QVpQTldhbFlSTSt2V3NLWEI0QU9GUkRmNU5oMi95RHM1MVdyampDNmRJVE8x?=
 =?utf-8?B?VStEMUdGZGhPOS81QkdHWW83STR4MG8rWDVXeWxUU3pKSmJOTW9NR3hQZ3Vi?=
 =?utf-8?B?ZXg2dkttOTYxNEplRHNKcWI4bzIrS0dWNUcrNHMvN1I0YVZsRExZM0wxQTU3?=
 =?utf-8?B?cXlQQkhSZ3Z1NHNsSXp2a2o0WmlRc0JYQkYyVnh5MWdPNS9HTGZEWGtoTEFW?=
 =?utf-8?B?dzAvaFE1ejljSEYrajhHMWNNSGlLQ3VpblBLbEFHSVBSQ1BvTmFXNUtaam9N?=
 =?utf-8?B?RE5qZ1haNEUzVWp3Qzl5aEpqTWtnVEVsNHY1S003UjVLVW5Yc3FTalQ0ck5E?=
 =?utf-8?B?eGFoL1VYY00wV003QWsxenJjL0x5UDNoM3I3L2I2Q09YN0dGMVdQU0xJellL?=
 =?utf-8?B?UXV1VzV0bDJKdTJhN0JLR0ovUm9RZlVCTTRFNDk0aU9VbTFpM2IwWlY5eXRQ?=
 =?utf-8?B?WjBSbkExelk4MFhHcGN5TDRqOXBWRDV4cmNjcUJnRFRDMjJBUnpKcGdLQ1FR?=
 =?utf-8?B?N243QmtxSmg3RGw4d28wK0htSUtSbm5NWWR4MTBIVm4yemJ1akx5TjYva0NC?=
 =?utf-8?B?RFNWUkNHWHJ5em45Z1RqTEliY3dGbXE0TzVGTCtBamIzaXQxK3dsQkYyQ2FH?=
 =?utf-8?B?RzFuQkt6OVBJUmlFQ3BqK0VQc1NxTkxjVHBmbzlhRC93M252NDloUnI2bmQx?=
 =?utf-8?B?MG9NbDR0dVEraVhtVmtjTW54TzQ4Z28zQTM0YnlsTlBOWE9wOXQ2cnJON092?=
 =?utf-8?B?dHVyL3RMWXpycHpnTXVVSlB6NVVBSy9vRWJTQlgranRiYXVhODA4Qk1tVEZJ?=
 =?utf-8?B?VVFPQ01WT0ZwazdWWFNxTm40bU5aWERNMmNNVzhjdldBdit4TC9aMjVESlpL?=
 =?utf-8?B?MW1PVDIwcDlNVDEvcmtrLytpdjZwdmV5MG1mV2xibFZaS1UrVUxDdEtyZ0RQ?=
 =?utf-8?B?dWRiVkJQTVNvcWloTkhqUFpKcEwxSmlsemRFdkU5eTZpcEFLZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97a0c597-971d-4c69-de67-08db48eab577
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2023 19:48:31.0925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dptnQs+yZfG2BN/8HvsokFHJkqV2iyl/JAj0iFLd9UNoOm7AghbcBxrTfVxQWZsSbxPOIQxiTkRO16BXYD+tAqALVQubB7dwcUMGWX3Bkfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5520

On 29/04/2023 2:34 pm, Marek Marczykowski-Górecki wrote:
> On Sat, Apr 29, 2023 at 12:41:26PM +0100, andrew.cooper3@citrix.com wrote:
>> On 29/04/2023 4:05 am, Stefano Stabellini wrote:
>>> On Fri, 28 Apr 2023, GitLab wrote:
>>>> Pipeline #852233694 triggered by
>>>> [568538936b4ac45a343cb3a4ab0c6cda?s=48&d=identicon]
>>>> Ganis
>>>> had 3 failed jobs
>>>> Failed jobs
>>>> ✖
>>>> test
>>>> qemu-smoke-dom0less-arm64-gcc
>>> This is a real failure on staging. Unfortunately it is intermittent. It
>>> usually happens once every 3-8 tests for me.
>>>
>>> The test script is:
>>> automation/scripts/qemu-smoke-dom0less-arm64.sh
>>>
>>> and for this test it is invoked without arguments. It is starting 2
>>> dom0less VMs in parallel, then dom0 does a xl network-attach and the
>>> domU is supposed to setup eth0 and ping.
>>>
>>> The failure is that nothing happens after "xl network-attach". The domU
>>> never hotplugs any interfaces. I have logs that show that eth0 never
>>> shows up and the only interface is lo no matter how long we wait.
>>>
>>>
>>> On a hunch, I removed Alejandro patches. Without them, I ran 20 tests
>>> without any failures. I have not investigated further but it looks like
>>> one of these 4 commits is the problem:
>>>
>>> 2023-04-28 11:41 Alejandro Vallejo    tools: Make init-xenstore-domain use xc_domain_getinfolist()
>>> 2023-04-28 11:41 Alejandro Vallejo    tools: Refactor console/io.c to avoid using xc_domain_getinfo()
>>> 2023-04-28 11:41 Alejandro Vallejo    tools: Create xc_domain_getinfo_single()
>>> 2023-04-28 11:41 Alejandro Vallejo    tools: Make some callers of xc_domain_getinfo() use xc_domain_getinfol 
>> In commit order (reverse of above), these patches are:
>>
>> 1) Modify the python bindings and xenbaked
>> 2) Introduce a new library function with a better API/ABI
>> 3) Modify xenconsoled
>> 4) Modify init-xenstore-domain
>>
>> The test isn't using anything from 4 or 1, and 2 definitely isn't
>> breaking anything on its own.
>>
>> That just leaves 3.  This test does turn activate xenconsoled by virtue
>> of invoking xencommons, but that doesn't help explain why a change in
>> xenconsoled interferes (and only intermittently on this one single test)
>> with `xl network-attach`.
>>
>> The xenconsoled change does have correctness fix in it, requiring
>> xenconsoled to ask for all domains info in one go.  This does mean it's
>> hypercall-buffering (i.e. bouncing) a 4M array now where previously it
>> was racy figuring out which VMs had come and gone.
> Can it be that xl network-attach fails and that failure is silently
> ignored by the test?

Well, it's ultimately doing a ping test between the two VMs, so the
network-attach is rather important.  I don't see an obviously way for us
to get false negatives like this.

~Andrew

