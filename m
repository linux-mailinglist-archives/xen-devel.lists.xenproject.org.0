Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3630E60510E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Oct 2022 22:10:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426007.674178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olFOE-00020h-RM; Wed, 19 Oct 2022 20:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426007.674178; Wed, 19 Oct 2022 20:10:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olFOE-0001xE-OP; Wed, 19 Oct 2022 20:10:10 +0000
Received: by outflank-mailman (input) for mailman id 426007;
 Wed, 19 Oct 2022 20:10:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rl4W=2U=citrix.com=prvs=284ee54c8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1olFOD-0001x8-I4
 for xen-devel@lists.xenproject.org; Wed, 19 Oct 2022 20:10:09 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0523028a-4fea-11ed-8fd0-01056ac49cbb;
 Wed, 19 Oct 2022 22:10:07 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Oct 2022 16:09:46 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5919.namprd03.prod.outlook.com (2603:10b6:a03:2d8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Wed, 19 Oct
 2022 20:09:43 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::1328:69bd:efac:4d44%3]) with mapi id 15.20.5723.034; Wed, 19 Oct 2022
 20:09:43 +0000
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
X-Inumbo-ID: 0523028a-4fea-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666210207;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=f/IRuNciZO2iCUAHCt/9LQ3hJ9mpBNMdmcJrw49+R8c=;
  b=XA5fK3gPVWh9yxL7Dn6loluMyLTusyCstwih5kZ9YM6lhX3hrhQJ2cOq
   J+qSaNUJ1W1ee87a3CZqp95irMu7Jnfej7o5+UHgu0LhL7UDOQ1UznM5t
   R+ijHNpntpzKWyLumH/U0eJR+gKZE1vwSlPNSvr5mwtGu1DX/k2Z2OelQ
   g=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 82733994
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JYshzas6HDKeN2CgfdmC9oQ7mOfnVNlfMUV32f8akzHdYApBsoF/q
 tZmKT/QP66OZzDze9F1Ydvgp00DupOBxtA1SQA6qXhmRixD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiefHgZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIy1BjOkGlA5AZnPaka5AS2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklXz
 MYcLQ0GRyu8iv6J5+ydFNFdmsgaeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgNABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTCNhNT+bpp6ICbFu7w0MrUzkOcV2C8aOGphWCW99yJ
 kU79X97xUQ13AnxJjXnZDW0vXiAtwYTc8dVEuY6rgyB18L8wwufHHlCcTdHZ/QvrspwTjsvv
 neZktWsCTFxvbm9TXOG6qzSvT60ITISL2IJeWkDVwRty8L4vIg5gxbLT9BiOK24lNv4HXf32
 T/ihCojg7Qei+Yb2qP9+krI6xqmq4LVVAcz6kPSV3i88wJiTIe/Ysqj7l2zxchHKIGVX1yQp
 k8uksKV7P0NJZyVnSnLS+IIdIxF/N6AOTzYxFRpT58o8m30/2b5JN4ApjZjOE1uL8AIPyfzZ
 1Pesh9Q45kVO2a2aahwYMS6DMFCIbXcKOkJn8v8NrJmCqWdvifep0mCuWb4M7jRrXUR
IronPort-HdrOrdr: A9a23:qUhKIq81r0V20V0Mck5uk+Fudb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQodcdDpAtjifZquz+8O3WBxB8bpYOCCggeVxe5ZnOzfKlHbehEWs9QtrZ
 uIEJIOReEYb2IK6/oSiTPQe7lP/DDEytHQuQ609QYOcegeUdAF0+4PMHf/LqQZfml7LKt8MK
 DZyttMpjKmd3hSRN+8HGM5U+/KoMCOvI76YDYdbiRXpzWmvHeN0vrXAhKY1hARX3dk2rE561
 XIlAT/++GKr+y78BnBzGXehq4m1ucJi+EzRfBkuPJlaQkEuTzYJriJnIfy+QzdldvfqGrCVu
 O85yvIcf4DrE85NVvF3CcFkzOQrArGrUWShWNwyEGT3/AQDlgBerV8rJMcfR3D50U6utZglK
 pNwmKCrpJSSQjNhSLn+rHzJlhXf2eP0A0feNQo/gpieJpbbKUUoZ0U/UtTHptFFCXm6Jo/GO
 0rCM3H/v5ZfV6Tcnic5wBUsZeRd2V2Gg3DTlkJu8ST3TQTlHdlz1EAzMhamnsb7poyR5RN+u
 yBOKV1k7NFSNMQcMtGda88aNryDnaITQPHMWqUL1iiHKYbO2jVo5qy+7kx7PHCQu198HLzou
 W1bLp1jx9AR6u1M7z+4HRiyGG8fEytGTLw18pZ+591/rXhWbuDC1zwdGwT
X-IronPort-AV: E=Sophos;i="5.95,196,1661832000"; 
   d="scan'208,217";a="82733994"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvXuaKfPFqXGeY1fYYsIteseqMsiECZt609cc5BGLW19lxhBrpkGsCbqr0bagHgt3IERZSLt8SfCTyFD/tz8CaAt6ZT/+ch9Pv74YUI1VLG9IqBYlWrAS8eHM1PrFE833ImI2AXf/0/4vfqnRzWjp7OmV2eoNNd7w88gyTnfxi5k7u3Ykf/mXDffBcf4WicyBcSXQGm7JZrdyCZEyy6zOL8J7ivV4NtvGwMo1nFsswbgyk0JmkVm54Kobzzp7Xi8ZjMlsrk9DFzojFihFqZrbLI5HXF+/BO4zlOCTfRiHj3pVb8P2uLJI0YTusb3tktf01SNLTM026Oz0BOBb36gkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/IRuNciZO2iCUAHCt/9LQ3hJ9mpBNMdmcJrw49+R8c=;
 b=Mx3Tq8ZLv/eq2KZ8G6s9m2AKzYxhWLzkvWhQFidQ0vngeuE+FE2cGCPkzSskoWYgoDpWgSBmPnI6r+AVjAKslQc78MR60auS6CTGESSHxven3R+eVB+zWXZ1ZKMJa7UFs3zQEPYVIEtiRkRz0GeVBrSoZ+oSPXloKEC+hVege3ddM9GfWRZDwsPOyT6ls4/VDtgqt2Kielb9ZtZQ+HqfNoz39Fp85nTOcs9l9+9imAdnOzf2ZUOU1FmHlEyOOZIgS+VpZ467YnUJK4oK84MqGx3YOglEh8ac2xxi7sDpxtyg0fyAtqc7Wa4VByHcnhS7003gAtkkuIfVYJCVfXdlpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/IRuNciZO2iCUAHCt/9LQ3hJ9mpBNMdmcJrw49+R8c=;
 b=IMNMUt1Ld9alR6PuuM296/0grAsVUMgzRasOXEw/j1HNwlQFa41h+YlfyJSuFSu4lj81tPQsEiFOwFNRsZUvKusVEWqpbtDJwwH1xYzqidydaFROmNdhHt/N5CABMEOgq9dNPmcSePSJbcHEY3c1bEZRsnaL3WlRT2/7r9VjreQ=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: George Dunlap <dunlapg@umich.edu>, Henry Wang <Henry.Wang@arm.com>
CC: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: Policy: A release acks for the release manager's patches (was Re:
 [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init())
Thread-Topic: Policy: A release acks for the release manager's patches (was
 Re: [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 p2m_init())
Thread-Index: AQHY4893wY6db56RwEawpyEuXhxcpq4WJdMA
Date: Wed, 19 Oct 2022 20:09:43 +0000
Message-ID: <7c6b1894-4dbe-8d8b-9f08-c07214b65844@citrix.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>
 <20221018142346.52272-3-Henry.Wang@arm.com>
 <CAFLBxZZ59zkuNJM1vQSv_Syv8i0Q_dAFk0p-JXY4oFs0cCUSnQ@mail.gmail.com>
In-Reply-To:
 <CAFLBxZZ59zkuNJM1vQSv_Syv8i0Q_dAFk0p-JXY4oFs0cCUSnQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5919:EE_
x-ms-office365-filtering-correlation-id: 28bd6bd7-f982-4a87-c1af-08dab20ddcad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vF3iVgP6r/nGzYoUwitGxJtcZQt5O4fe4qnA6FeprfN69uB4FSXUf5o5n1xYjJH4jsRl++wh6oytOpk/k++et1RJ5G86CP95uZgcu67y5x9ymlIVrKxadWVze8/b5B214OxfeRScl88OlS/xAb07LzeaXZJY1byd93e7l8FAe1EZUugjeHfgPF0q6sfMp0YxMj7eoQ9yfgzTTXW/gt23EH1+Hg4fGFdlogx1B8tBuDRwWHJKCWz9dkneoxzGm3FoJdZowRQcsHRaNqYxn0X088M6P/meyKSUCWwfKHfyrcE9OY8RTg/9CU033CBQJ3kY3k6oH6W2XvdzYvKEZPLDdMRlL/8YS3Wozo04bzH1biq+sDwkwu6qrVcbgErcxSuS3/YiPSLgxWsniAxLZGpNwzfXt8NZTRBl+i036K/Hbga0FVTMgfna2t63lIVB5kGHcyBQ2djYpQ24bhCLKNAoggGofubgj2A0FseOeUcXhmwpoJVI5l+IWqL1quwqtK7W7eHqSMPVl4qUoECEnydbupo9aqw9u+I1EnCYyyQV3Kij0LzEYoIluFo00FMIAELD1Lb5PnZoxY2crjGMX+dgjxmOgN0Rftn8UoIq6OoxdYFo9ujkd61auLMl6pR22Q8r9bHSqER4Dqn2JQYBxoDc+AFQxqbRRbL9zzw1eZUY4gIOT7NsR5oBN36hL+V+yDo7Fiy/hzkXLptFmxa6TfN5aN/T3M2TJLZ5/fFD9AFQ7ixXgIIlKgrkvtvCkv5OpVcxJq6If1Pb50qo49cHjfcNKOTJBE9K1vYEHqEkbYHbXAhBWt3LGNrhV6DNvpjH/H0WZ47XndStRzFgr1xB0shaZA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(451199015)(31686004)(36756003)(8676002)(66556008)(86362001)(6512007)(122000001)(6506007)(26005)(38070700005)(82960400001)(66476007)(66446008)(64756008)(2906002)(31696002)(8936002)(4326008)(38100700002)(41300700001)(5660300002)(91956017)(76116006)(66946007)(83380400001)(316002)(54906003)(6486002)(186003)(110136005)(53546011)(2616005)(478600001)(71200400001)(107886003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L1lLRXMwQVdvTWdkVjJDMzdkaitsTkRub2dPSVdsQ1BnLzdWaS9XWHdScUNq?=
 =?utf-8?B?MTdSZWFLMUZRV2h0YWNWSlV1ejhYY1MzcVpSOStRN0VQL1B1SG1DVFRGSWZL?=
 =?utf-8?B?OXBSNjhtYjBDcXZWaVVuTm5INFpqUDZVdlEwZVFlVFlKdERleVF2VzNWL2VU?=
 =?utf-8?B?SHZ0eURsTitieFVBQjdhamU1NUxIQm1HM2NnbkwyWUJZSlFjSUcyYm02NDVY?=
 =?utf-8?B?MVM4Q2JVRnplOTUzdVFOZnZUTFNXL3BUOWdhMGl0b09JSjdDSkY0c1ZKL2xj?=
 =?utf-8?B?T2I4cTJmb2RmU0h5V0lDcTQ3a21yWE82ZzFjU3JQelNJeUYxYzBpZ2twQXRN?=
 =?utf-8?B?eVc2NUh4elM4VlNvVlJkbXZmZVJFdThLSEJ4bWZwdVk5Q1RMQzd2UUZBTUdE?=
 =?utf-8?B?a01keGFicHRKWUVRM0hKTVhocGluUDFUamJlWU8vK08wOW1GUDhzbXdjRWYx?=
 =?utf-8?B?OStRaGNLR0ZuSHJ1MjRPTUlaNXcrclUra2ZVWVNKak40RzdCaDJHUnNFSzZs?=
 =?utf-8?B?MGlsbVlQYk1RVllMSDRlZTVENXFWVUdQTktMMmcyNHhkSnNjaW16YXlOdDJS?=
 =?utf-8?B?Y09SdkVQZGdIYXhGZVRMSDZ5cWd1NlAxZ0Z6THF1V0lkUlJiN0twZ1VzbWlk?=
 =?utf-8?B?Zks0KytuNkpEYTQ3YTBGckg2WG53RmZrSExkMEYra1U3SXdseEFtUm9wZTcx?=
 =?utf-8?B?RUxTMlRjemlvKzRQKzNUWnhOeHY4OEZQRGdyMk9rejkveWdFcm51K2NrbThx?=
 =?utf-8?B?SUdBSEpPMzMvMmhlOWl5OEtQNW5lVTVpVUFLRzlVbmhVVU5uNXExcWpzbmky?=
 =?utf-8?B?MGYrVm1KREZSSlhZMzBERGduWC9TZnZ0SHpyQUJnU3hSTVMzYk1zUlVuWWZW?=
 =?utf-8?B?YlNGeUVMaVhnemwrSzBrK2dsa2ZGMEk4L0FjSHdiODlldmpSblp1V1paTGFO?=
 =?utf-8?B?WlFnRy9pYmNmYjBLSEtvbGdGSzZkTHZWcVgzbVNDQkttNjdjRFh5eDBYbUZ6?=
 =?utf-8?B?WEFienVJRlRWY3laNzVsQjRVSk1yeEM1MEZUcEt6VXViL0poYkx5b0lTT2dk?=
 =?utf-8?B?OXAxMWM0V3c4M0tqc1IwREh0cVhYN3BIQ2FPMStBOWZrREZ3Y2ZLY0xiN2RX?=
 =?utf-8?B?dnJZRlhVUGpEWExtMkt2eE9zTGNISnowalAyakNhMkx5NDVPZ3ZVaW5NTjVl?=
 =?utf-8?B?bjk4WitTTzhwY1U3c0I2UC9LZXNzNjlROWlGRlZ5UlhhLzYyK3VEQ2dnSyts?=
 =?utf-8?B?ejR0dXJ4bWZQOUJvekdWT2g0TEZCN2pxaWxuRTVGOFFFK0hWWU54ZHhkanlo?=
 =?utf-8?B?UDJCeVNMWFR3b0V3TFBNWVZWWHczVk1PbUZBSWhncldiYXJQZHd5QUtJWTNN?=
 =?utf-8?B?MWJNSE5WV2RydkptcFdFMlMrcEZyS2dZQVByL2w0Ty9rc2htS25YTWEydGxJ?=
 =?utf-8?B?SnRZQi94MUVWcTduSW5tK25SbFo4TEo4MnBvdGV2c1RJTEd0QzF6ajg4cGhv?=
 =?utf-8?B?UjU1WWx1U09qZy9uWmRFUkFxTThkQVNpdktpOHpEU0k5aXJjT1pLRzhQN3c2?=
 =?utf-8?B?cWlyNzlZcUlKcHVtWTAyaDI5MUxoVEtlb1NRd1dxRExUbzlNZWlwUEJhSzJx?=
 =?utf-8?B?YWpNamtpNXRta0x3RWR5RFZjOUNENDVHblFtMXh2ZGtvUTdRM2s4RDU5czFF?=
 =?utf-8?B?bVhralVMODcxUzNBa2pmdVAxWjBrNWNQcGZzTXV2U3NLWXkrazl4bVZ6b3V6?=
 =?utf-8?B?VGhCVDdTQStxUEpRMVl5bnFHZDFsd0ZjaUQreCtENWRhWDlkQVQydDRsV2hw?=
 =?utf-8?B?RThtb1pmemd1UjdHSWFqRm5iQ2RLdjI3ZFVRZm1nNGhSMEhmUHVJTUJBNzdI?=
 =?utf-8?B?NWptSS84NkFlUzRVbm53aTlzQ3ZJVitnTUN6eThUNW8rR2hFYngwSDlvMVBm?=
 =?utf-8?B?N01KbGZKbHpGbEhLMk55Sjk1dTNReHJQOHZsa0hjZFVpczZjSFdFNU5qN1ZI?=
 =?utf-8?B?N1JuN3pNemU2Y1NuMnNSUnd5VStsSVllM3BqUmNjSU5KL05TRnJLckwxL2lS?=
 =?utf-8?B?NW9SRTZpVjNqUWdHODdFb0g5K2tFZzdyaGYvZ1dBdlB0T0tYTXVqdEs2YTMw?=
 =?utf-8?Q?PCpAj1L4Dvm91RwRn+4536NTs?=
Content-Type: multipart/alternative;
	boundary="_000_7c6b18944dbe8d8b9f08c07214b65844citrixcom_"
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28bd6bd7-f982-4a87-c1af-08dab20ddcad
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2022 20:09:43.2727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rpxS5r7HAIdwWrE4mEFuN5WykQG3neMETnHTODiWX4KbslJ0bGhzFU9t8vWEfICQ3KtfCPlW3Qpt6aq+HW4f3NPV9yMwmRxtPLhSX2zrA58=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5919

--_000_7c6b18944dbe8d8b9f08c07214b65844citrixcom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMTkvMTAvMjAyMiAxNjoyOCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCg0KDQpPbiBUdWUsIE9j
dCAxOCwgMjAyMiBhdCAzOjI0IFBNIEhlbnJ5IFdhbmcgPEhlbnJ5LldhbmdAYXJtLmNvbTxtYWls
dG86SGVucnkuV2FuZ0Bhcm0uY29tPj4gd3JvdGU6DQpIYXJkd2FyZSB1c2luZyBHSUN2MiBuZWVk
cyB0byBjcmVhdGUgYSBQMk0gbWFwcGluZyBvZiA4S0IgR0lDdjIgYXJlYQ0Kd2hlbiB0aGUgZG9t
YWluIGlzIGNyZWF0ZWQuIENvbnNpZGVyaW5nIHRoZSB3b3JzdCBjYXNlIG9mIHBhZ2UgdGFibGVz
DQp3aGljaCByZXF1aXJlcyA2IFAyTSBwYWdlcyBhcyB0aGUgdHdvIHBhZ2VzIHdpbGwgYmUgY29u
c2VjdXRpdmUgYnV0IG5vdA0KbmVjZXNzYXJpbHkgaW4gdGhlIHNhbWUgTDMgcGFnZSB0YWJsZSBh
bmQga2VlcCBhIGJ1ZmZlciwgcG9wdWxhdGUgMTYNCnBhZ2VzIGFzIHRoZSBkZWZhdWx0IHZhbHVl
IHRvIHRoZSBQMk0gcGFnZXMgcG9vbCBpbiBwMm1faW5pdCgpIGF0IHRoZQ0KZG9tYWluIGNyZWF0
aW9uIHN0YWdlIHRvIHNhdGlzZnkgdGhlIEdJQ3YyIHJlcXVpcmVtZW50LiBGb3IgR0lDdjMsIHRo
ZQ0KYWJvdmUtbWVudGlvbmVkIFAyTSBtYXBwaW5nIGlzIG5vdCBuZWNlc3NhcnksIGJ1dCBzaW5j
ZSB0aGUgYWxsb2NhdGVkDQoxNiBwYWdlcyBoZXJlIHdvdWxkIG5vdCBiZSBsb3N0LCBoZW5jZSBw
b3B1bGF0ZSB0aGVzZSBwYWdlcw0KdW5jb25kaXRpb25hbGx5Lg0KDQpXaXRoIHRoZSBkZWZhdWx0
IDE2IFAyTSBwYWdlcyBwb3B1bGF0ZWQsIHRoZXJlIHdvdWxkIGJlIGEgY2FzZSB0aGF0DQpmYWls
dXJlcyB3b3VsZCBoYXBwZW4gaW4gdGhlIGRvbWFpbiBjcmVhdGlvbiB3aXRoIFAyTSBwYWdlcyBh
bHJlYWR5IGluDQp1c2UuIFRvIHByb3Blcmx5IGZyZWUgdGhlIFAyTSBmb3IgdGhpcyBjYXNlLCBm
aXJzdGx5IHN1cHBvcnQgdGhlDQpvcHRpb25hbGx5IHByZWVtcHRpb24gb2YgcDJtX3RlYXJkb3du
KCksIHRoZW4gY2FsbCBwMm1fdGVhcmRvd24oKSBhbmQNCnAybV9zZXRfYWxsb2NhdGlvbihkLCAw
LCBOVUxMKSBub24tcHJlZW1wdGl2ZWx5IGluIHAybV9maW5hbF90ZWFyZG93bigpLg0KQXMgbm9u
LXByZWVtcHRpdmUgcDJtX3RlYXJkb3duKCkgc2hvdWxkIG9ubHkgcmV0dXJuIDAsIHVzZSBhDQpC
VUdfT04gdG8gY29uZmlybSB0aGF0Lg0KDQpTaW5jZSBwMm1fZmluYWxfdGVhcmRvd24oKSBpcyBj
YWxsZWQgZWl0aGVyIGFmdGVyDQpkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSB3aGVyZSBy
ZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgaGFzIGJlZW4NCmNhbGxlZCwgb3IgZnJvbSBmYWlsdXJl
IHBhdGggb2YgZG9tYWluX2NyZWF0ZSgpL2FyY2hfZG9tYWluX2NyZWF0ZSgpDQp3aGVyZSBtYXBw
aW5ncyB0aGF0IHJlcXVpcmUgcDJtX3B1dF9sM19wYWdlKCkgc2hvdWxkIG5ldmVyIGJlIGNyZWF0
ZWQsDQpyZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgaXMgbm90IGFkZGVkIGluIHAybV9maW5hbF90
ZWFyZG93bigpLCBhZGQNCmluLWNvZGUgY29tbWVudHMgdG8gcmVmZXIgdGhpcy4NCg0KRml4ZXM6
IGNiZWE1YTExNDljYSAoInhlbi9hcm06IEFsbG9jYXRlIGFuZCBmcmVlIFAyTSBwYWdlcyBmcm9t
IHRoZSBQMk0gcG9vbCIpDQpTdWdnZXN0ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpv
bi5jb208bWFpbHRvOmpncmFsbEBhbWF6b24uY29tPj4NClNpZ25lZC1vZmYtYnk6IEhlbnJ5IFdh
bmcgPEhlbnJ5LldhbmdAYXJtLmNvbTxtYWlsdG86SGVucnkuV2FuZ0Bhcm0uY29tPj4NCg0KDQpI
ZW5yeSBicm91Z2h0IHRoaXMgcGF0Y2ggdG8gbXkgYXR0ZW50aW9uIGJlY2F1c2UgaXQgbmVlZHMg
YSByZWxlYXNlIGFjaw0KDQpBY3R1YWxseSB0aGlzIG9uZSBkb2Vzbid0LiAgSXQncyBhIHNlY3Vy
aXR5IHBhdGNoLCBhbmQgdGhlIG9ubHkgcmVhc29uIGl0cyBvbiB4ZW4tZGV2ZWwgaXMgYmVjYXVz
ZSBPU1NUZXN0IGRpc2NvdmVyZWQgdGhhdCBYU0EtNDA5IGlzIERvQSBhZnRlciB0aGUgZmFjdC4g
IEFuZCBvbiBhbGwgc2VjdXJpdHkgc3VwcG9ydGVkIGJyYW5jaGVzIHRvby4NCg0KV2hlbiB0aGUg
YnVncyBoYXZlIGJlZW4gZml4ZWQsIGl0IHdpbGwgY2F1c2UgZm9yY2UgYSByZS1pc3N1ZSBvZiBY
U0EtNDA5Lg0KDQosIGJ1dCBpdCBkb2Vzbid0IHNlZW0gcHJvcGVyIGZvciBIZW5yeSB0byBiZSB0
aGUgb25lIHRvIHJlbGVhc2UtYWNrIGhpcyBvd24gcGF0Y2hlcy4gOi0pDQoNCkkgZG9uJ3Qgc2Vl
IGFuIGlzc3VlIHdpdGggYW4gUk0gUi1hY2staW5nIHRoZWlyIG93biBwYXRjaC4gIFRoZXJlJ3Mg
cGFzdCBmb3JtIGZvciBzZWxmLVItYWNrLCBhbmQgdGhlIHBhdGNoIHN0aWxsIG5lZWRzIG9uZSBv
dGhlciBwZXJzb24gYW5kL29yIGEgbWFpbnRhaW5lci9jb21taXR0ZXIgYW5kIHRoZSB1c3VhbCBy
ZXNvbHV0aW9uIG9mIG91dHN0YW5kaW5nIGNvbmNlcm5zLg0KDQpUaGVyZSdzIGFkbWluaXN0cml2
aWEgd2hpY2ggdGhlIFJNIHR5cGljYWxseSBkb2VzIGNsb3NlciB0byB0aGUgcmVsZWFzZSwgYW5k
IHdlJ3ZlIG5ldmVyIGhhZCBjcm9zcy1SLWFjayBmb3IgdGhlIGRvY3MvcHJvY2VzcyBzaWRlIG9m
IHRoaW5ncy4NCg0KDQpJIHByb3Bvc2UgdGhhdCBhIHN1aXRhYmxlIHJ1bGUgd291bGQgYmU6DQoN
CiJJZiB0aGUgcmVsZWFzZSBtYW5hZ2VyIHRoZW1zZWx2ZXMgaGF2ZSBzdWJtaXR0ZWQgYSBwYXRj
aCB3aGljaCBuZWVkcyBhIHJlbGVhc2UgYWNrLCB0aGVuIHRoZSBwYXRjaCBuZWVkcyBhIHJlbGVh
c2UgYWNrIGZyb20gb25lIG9mIHRoZSBDb21taXR0ZXJzIHdobyBpcyBub3QgaW52b2x2ZWQgaW4g
dGhlIHBhdGNoLiINCg0KR2l2ZW4gdGhlIHRpbWUtY3JpdGljYWwgbmF0dXJlIG9mIHRoaXMgcGF0
Y2gsIEkgcHJvcG9zZSB0aGF0IHdlIGFkb3B0IHRoZSBydWxlIGFzIGFuIGV4cGVkaWVuY3kgbm93
LCBhbmQgd2UgY2FuIGRpc2N1c3MgYWZ0ZXJ3YXJkcyB3aGV0aGVyIHRvIG1ha2UgaXQgcGVybWFu
ZW50Lg0KDQpXaXRoIHRoYXQgaW4gbWluZCwgaXQgbG9va3MgbGlrZSB0aGlzIHBhdGNoIGlzIGNy
aXRpY2FsIGZvciBmaXhpbmcgYSByZWxlYXNlIGlzc3VlOyBpdCdzIGluIGNvcmUgY29kZSwgYnV0
IGhhcyBhbHNvIGhhcyBhIGxvdCBvZiBzY3J1dGlueS4gIFNvIHdpdGggdGhhdCBpbiBtaW5kOg0K
DQpSZWxlYXNlLWFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b208bWFpbHRvOmdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4+DQoNCkF0IHRoZSBlbmQgb2YgdGhl
IGRheSwgUi1hY2sgbWVhbnMgIkkgaGF2ZSBkZWVtZWQgdGhpcyBpbXBvcnRhbnQgZm9yIHRoZSBy
ZWxlYXNlIiwgYW5kIHRoZSBjb21taXR0ZXJzIGFyZSB0aGUgZmFsbGJhY2sgZm9yIGFsbCBjb3Ju
ZXIgY2FzZXMuICBJJ2Qgc2F5IHRoYXQncyBhbHJlYWR5IGNvdmVyZWQgaW4gdGhlIGV4aXN0aW5n
IHJ1bGVzIGFuZCBjb252ZW50aW9ucywgZ2l2ZW4gdGhlIGV4cGVjdGF0aW9uIHRoYXQgY29tbWl0
dGVycyB3b3VsZG4ndCB0cmVhZCBvbiB0aGUgdG9lcyBvZiB0aGUgUk0gaW4gdGhlIGZpcnN0IHBs
YWNlLg0KDQp+QW5kcmV3DQo=

--_000_7c6b18944dbe8d8b9f08c07214b65844citrixcom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C7E45BFAD12E324DB24EA296BF572877@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdiBjbGFzcz0i
bW96LWNpdGUtcHJlZml4Ij5PbiAxOS8xMC8yMDIyIDE2OjI4LCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ojxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOkNBRkxCeFpa
NTl6a3VOSk0xdlFTdl9TeXY4aTBRX2RBRmswcC1KWFk0b0ZzMGNDVVNuUUBtYWlsLmdtYWlsLmNv
bSI+DQo8ZGl2IGRpcj0ibHRyIj4NCjxkaXYgZGlyPSJsdHIiPjxicj4NCjwvZGl2Pg0KPGJyPg0K
PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPg0KPGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0
dHIiPk9uIFR1ZSwgT2N0IDE4LCAyMDIyIGF0IDM6MjQgUE0gSGVucnkgV2FuZyAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOkhlbnJ5LldhbmdAYXJtLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIG1vei1kby1ub3Qt
c2VuZD0idHJ1ZSIgY2xhc3M9Im1vei10eHQtbGluay1mcmVldGV4dCI+SGVucnkuV2FuZ0Bhcm0u
Y29tPC9hPiZndDsgd3JvdGU6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSBjbGFzcz0iZ21haWxf
cXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgNCiAgICAgICAgICAgIDAuOGV4O2JvcmRl
ci1sZWZ0OjFweCBzb2xpZA0KICAgICAgICAgICAgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxl
ZnQ6MWV4Ij4NCkhhcmR3YXJlIHVzaW5nIEdJQ3YyIG5lZWRzIHRvIGNyZWF0ZSBhIFAyTSBtYXBw
aW5nIG9mIDhLQiBHSUN2MiBhcmVhPGJyPg0Kd2hlbiB0aGUgZG9tYWluIGlzIGNyZWF0ZWQuIENv
bnNpZGVyaW5nIHRoZSB3b3JzdCBjYXNlIG9mIHBhZ2UgdGFibGVzPGJyPg0Kd2hpY2ggcmVxdWly
ZXMgNiBQMk0gcGFnZXMgYXMgdGhlIHR3byBwYWdlcyB3aWxsIGJlIGNvbnNlY3V0aXZlIGJ1dCBu
b3Q8YnI+DQpuZWNlc3NhcmlseSBpbiB0aGUgc2FtZSBMMyBwYWdlIHRhYmxlIGFuZCBrZWVwIGEg
YnVmZmVyLCBwb3B1bGF0ZSAxNjxicj4NCnBhZ2VzIGFzIHRoZSBkZWZhdWx0IHZhbHVlIHRvIHRo
ZSBQMk0gcGFnZXMgcG9vbCBpbiBwMm1faW5pdCgpIGF0IHRoZTxicj4NCmRvbWFpbiBjcmVhdGlv
biBzdGFnZSB0byBzYXRpc2Z5IHRoZSBHSUN2MiByZXF1aXJlbWVudC4gRm9yIEdJQ3YzLCB0aGU8
YnI+DQphYm92ZS1tZW50aW9uZWQgUDJNIG1hcHBpbmcgaXMgbm90IG5lY2Vzc2FyeSwgYnV0IHNp
bmNlIHRoZSBhbGxvY2F0ZWQ8YnI+DQoxNiBwYWdlcyBoZXJlIHdvdWxkIG5vdCBiZSBsb3N0LCBo
ZW5jZSBwb3B1bGF0ZSB0aGVzZSBwYWdlczxicj4NCnVuY29uZGl0aW9uYWxseS48YnI+DQo8YnI+
DQpXaXRoIHRoZSBkZWZhdWx0IDE2IFAyTSBwYWdlcyBwb3B1bGF0ZWQsIHRoZXJlIHdvdWxkIGJl
IGEgY2FzZSB0aGF0PGJyPg0KZmFpbHVyZXMgd291bGQgaGFwcGVuIGluIHRoZSBkb21haW4gY3Jl
YXRpb24gd2l0aCBQMk0gcGFnZXMgYWxyZWFkeSBpbjxicj4NCnVzZS4gVG8gcHJvcGVybHkgZnJl
ZSB0aGUgUDJNIGZvciB0aGlzIGNhc2UsIGZpcnN0bHkgc3VwcG9ydCB0aGU8YnI+DQpvcHRpb25h
bGx5IHByZWVtcHRpb24gb2YgcDJtX3RlYXJkb3duKCksIHRoZW4gY2FsbCBwMm1fdGVhcmRvd24o
KSBhbmQ8YnI+DQpwMm1fc2V0X2FsbG9jYXRpb24oZCwgMCwgTlVMTCkgbm9uLXByZWVtcHRpdmVs
eSBpbiBwMm1fZmluYWxfdGVhcmRvd24oKS48YnI+DQpBcyBub24tcHJlZW1wdGl2ZSBwMm1fdGVh
cmRvd24oKSBzaG91bGQgb25seSByZXR1cm4gMCwgdXNlIGE8YnI+DQpCVUdfT04gdG8gY29uZmly
bSB0aGF0Ljxicj4NCjxicj4NClNpbmNlIHAybV9maW5hbF90ZWFyZG93bigpIGlzIGNhbGxlZCBl
aXRoZXIgYWZ0ZXI8YnI+DQpkb21haW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKSB3aGVyZSByZWxp
bnF1aXNoX3AybV9tYXBwaW5nKCkgaGFzIGJlZW48YnI+DQpjYWxsZWQsIG9yIGZyb20gZmFpbHVy
ZSBwYXRoIG9mIGRvbWFpbl9jcmVhdGUoKS9hcmNoX2RvbWFpbl9jcmVhdGUoKTxicj4NCndoZXJl
IG1hcHBpbmdzIHRoYXQgcmVxdWlyZSBwMm1fcHV0X2wzX3BhZ2UoKSBzaG91bGQgbmV2ZXIgYmUg
Y3JlYXRlZCw8YnI+DQpyZWxpbnF1aXNoX3AybV9tYXBwaW5nKCkgaXMgbm90IGFkZGVkIGluIHAy
bV9maW5hbF90ZWFyZG93bigpLCBhZGQ8YnI+DQppbi1jb2RlIGNvbW1lbnRzIHRvIHJlZmVyIHRo
aXMuPGJyPg0KPGJyPg0KRml4ZXM6IGNiZWE1YTExNDljYSAoJnF1b3Q7eGVuL2FybTogQWxsb2Nh
dGUgYW5kIGZyZWUgUDJNIHBhZ2VzIGZyb20gdGhlIFAyTSBwb29sJnF1b3Q7KTxicj4NClN1Z2dl
c3RlZC1ieTogSnVsaWVuIEdyYWxsICZsdDs8YSBocmVmPSJtYWlsdG86amdyYWxsQGFtYXpvbi5j
b20iIHRhcmdldD0iX2JsYW5rIiBtb3otZG8tbm90LXNlbmQ9InRydWUiIGNsYXNzPSJtb3otdHh0
LWxpbmstZnJlZXRleHQiPmpncmFsbEBhbWF6b24uY29tPC9hPiZndDs8YnI+DQpTaWduZWQtb2Zm
LWJ5OiBIZW5yeSBXYW5nICZsdDs8YSBocmVmPSJtYWlsdG86SGVucnkuV2FuZ0Bhcm0uY29tIiB0
YXJnZXQ9Il9ibGFuayIgbW96LWRvLW5vdC1zZW5kPSJ0cnVlIiBjbGFzcz0ibW96LXR4dC1saW5r
LWZyZWV0ZXh0Ij5IZW5yeS5XYW5nQGFybS5jb208L2E+Jmd0Ozxicj4NCjwvYmxvY2txdW90ZT4N
CjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5IZW5yeSBicm91Z2h0
IHRoaXMgcGF0Y2ggdG8gbXkgYXR0ZW50aW9uIGJlY2F1c2UgaXQgbmVlZHMgYSByZWxlYXNlIGFj
azwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjxicj4NCkFjdHVhbGx5IHRo
aXMgb25lIGRvZXNuJ3QuJm5ic3A7IEl0J3MgYSBzZWN1cml0eSBwYXRjaCwgYW5kIHRoZSBvbmx5
IHJlYXNvbiBpdHMgb24geGVuLWRldmVsIGlzIGJlY2F1c2UgT1NTVGVzdCBkaXNjb3ZlcmVkIHRo
YXQgWFNBLTQwOSBpcyBEb0EgYWZ0ZXIgdGhlIGZhY3QuJm5ic3A7IEFuZCBvbiBhbGwgc2VjdXJp
dHkgc3VwcG9ydGVkIGJyYW5jaGVzIHRvby48YnI+DQo8YnI+DQpXaGVuIHRoZSBidWdzIGhhdmUg
YmVlbiBmaXhlZCwgaXQgd2lsbCBjYXVzZSBmb3JjZSBhIHJlLWlzc3VlIG9mIFhTQS00MDkuPGJy
Pg0KPGJyPg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOkNBRkxCeFpaNTl6a3VO
Sk0xdlFTdl9TeXY4aTBRX2RBRmswcC1KWFk0b0ZzMGNDVVNuUUBtYWlsLmdtYWlsLmNvbSI+DQo8
ZGl2IGRpcj0ibHRyIj4NCjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4NCjxkaXY+LCBidXQgaXQg
ZG9lc24ndCBzZWVtIHByb3BlciBmb3IgSGVucnkgdG8gYmUgdGhlIG9uZSB0byByZWxlYXNlLWFj
ayBoaXMgb3duIHBhdGNoZXMuIDotKTwvZGl2Pg0KPC9kaXY+DQo8L2Rpdj4NCjwvYmxvY2txdW90
ZT4NCjxicj4NCkkgZG9uJ3Qgc2VlIGFuIGlzc3VlIHdpdGggYW4gUk0gUi1hY2staW5nIHRoZWly
IG93biBwYXRjaC4mbmJzcDsgVGhlcmUncyBwYXN0IGZvcm0gZm9yIHNlbGYtUi1hY2ssIGFuZCB0
aGUgcGF0Y2ggc3RpbGwgbmVlZHMgb25lIG90aGVyIHBlcnNvbiBhbmQvb3IgYSBtYWludGFpbmVy
L2NvbW1pdHRlciBhbmQgdGhlIHVzdWFsIHJlc29sdXRpb24gb2Ygb3V0c3RhbmRpbmcgY29uY2Vy
bnMuPGJyPg0KPGJyPg0KVGhlcmUncyBhZG1pbmlzdHJpdmlhIHdoaWNoIHRoZSBSTSB0eXBpY2Fs
bHkgZG9lcyBjbG9zZXIgdG8gdGhlIHJlbGVhc2UsIGFuZCB3ZSd2ZSBuZXZlciBoYWQgY3Jvc3Mt
Ui1hY2sgZm9yIHRoZSBkb2NzL3Byb2Nlc3Mgc2lkZSBvZiB0aGluZ3MuPGJyPg0KPGJyPg0KPGJs
b2NrcXVvdGUgdHlwZT0iY2l0ZSIgY2l0ZT0ibWlkOkNBRkxCeFpaNTl6a3VOSk0xdlFTdl9TeXY4
aTBRX2RBRmswcC1KWFk0b0ZzMGNDVVNuUUBtYWlsLmdtYWlsLmNvbSI+DQo8ZGl2IGRpcj0ibHRy
Ij4NCjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj4NCjxkaXY+PGJyPg0KPC9kaXY+DQo8ZGl2Pkkg
cHJvcG9zZSB0aGF0IGEgc3VpdGFibGUgcnVsZSB3b3VsZCBiZTo8L2Rpdj4NCjxkaXY+PGJyPg0K
PC9kaXY+DQo8ZGl2PiZxdW90O0lmIHRoZSByZWxlYXNlIG1hbmFnZXIgdGhlbXNlbHZlcyBoYXZl
IHN1Ym1pdHRlZCBhIHBhdGNoIHdoaWNoIG5lZWRzIGEgcmVsZWFzZSBhY2ssIHRoZW4gdGhlIHBh
dGNoIG5lZWRzIGEgcmVsZWFzZSBhY2sgZnJvbSBvbmUgb2YgdGhlIENvbW1pdHRlcnMgd2hvIGlz
IG5vdCBpbnZvbHZlZCBpbiB0aGUgcGF0Y2guJnF1b3Q7PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2
Pg0KPGRpdj5HaXZlbiB0aGUgdGltZS1jcml0aWNhbCBuYXR1cmUgb2YgdGhpcyBwYXRjaCwgSSBw
cm9wb3NlIHRoYXQgd2UgYWRvcHQgdGhlIHJ1bGUgYXMgYW4gZXhwZWRpZW5jeSBub3csIGFuZCB3
ZSBjYW4gZGlzY3VzcyBhZnRlcndhcmRzIHdoZXRoZXIgdG8gbWFrZSBpdCBwZXJtYW5lbnQuPC9k
aXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5XaXRoIHRoYXQgaW4gbWluZCwgaXQgbG9va3Mg
bGlrZSB0aGlzIHBhdGNoIGlzIGNyaXRpY2FsIGZvciBmaXhpbmcgYSByZWxlYXNlIGlzc3VlOyBp
dCdzIGluIGNvcmUgY29kZSwgYnV0IGhhcyBhbHNvIGhhcyBhIGxvdCBvZiBzY3J1dGlueS4mbmJz
cDsgU28gd2l0aCB0aGF0IGluIG1pbmQ6PC9kaXY+DQo8ZGl2Pjxicj4NCjwvZGl2Pg0KPGRpdj5S
ZWxlYXNlLWFja2VkLWJ5OiBHZW9yZ2UgRHVubGFwICZsdDs8YSBocmVmPSJtYWlsdG86Z2Vvcmdl
LmR1bmxhcEBjaXRyaXguY29tIiBtb3otZG8tbm90LXNlbmQ9InRydWUiIGNsYXNzPSJtb3otdHh0
LWxpbmstZnJlZXRleHQiPmdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbTwvYT4mZ3Q7PC9kaXY+DQo8
L2Rpdj4NCjwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGJyPg0KQXQgdGhlIGVuZCBvZiB0aGUgZGF5
LCBSLWFjayBtZWFucyAmcXVvdDtJIGhhdmUgZGVlbWVkIHRoaXMgaW1wb3J0YW50IGZvciB0aGUg
cmVsZWFzZSZxdW90OywgYW5kIHRoZSBjb21taXR0ZXJzIGFyZSB0aGUgZmFsbGJhY2sgZm9yIGFs
bCBjb3JuZXIgY2FzZXMuJm5ic3A7IEknZCBzYXkgdGhhdCdzIGFscmVhZHkgY292ZXJlZCBpbiB0
aGUgZXhpc3RpbmcgcnVsZXMgYW5kIGNvbnZlbnRpb25zLCBnaXZlbiB0aGUgZXhwZWN0YXRpb24g
dGhhdCBjb21taXR0ZXJzIHdvdWxkbid0DQogdHJlYWQgb24gdGhlIHRvZXMgb2YgdGhlIFJNIGlu
IHRoZSBmaXJzdCBwbGFjZS48YnI+DQo8YnI+DQp+QW5kcmV3PGJyPg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_7c6b18944dbe8d8b9f08c07214b65844citrixcom_--

