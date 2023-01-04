Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 313B465CBA4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Jan 2023 02:51:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470905.730574 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsvy-00052c-3M; Wed, 04 Jan 2023 01:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470905.730574; Wed, 04 Jan 2023 01:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCsvx-00050f-W6; Wed, 04 Jan 2023 01:51:13 +0000
Received: by outflank-mailman (input) for mailman id 470905;
 Wed, 04 Jan 2023 01:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tpAs=5B=citrix.com=prvs=3612a7559=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pCsvw-00050Z-F4
 for xen-devel@lists.xenproject.org; Wed, 04 Jan 2023 01:51:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 408487ba-8bd2-11ed-b8d0-410ff93cb8f0;
 Wed, 04 Jan 2023 02:51:07 +0100 (CET)
Received: from mail-dm6nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Jan 2023 20:51:05 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5429.namprd03.prod.outlook.com (2603:10b6:5:2d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 01:51:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 01:51:04 +0000
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
X-Inumbo-ID: 408487ba-8bd2-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672797068;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=SPun27trLn8T3iqBdiblTkkD7u1SnPWiZG1UR+0D4M0=;
  b=fuwuaw7itMNk2IEAoCXybXvPfZfR179Hxk4Wftpkds23ZUvpw9yKTWDL
   LM8BTBaT/37SgXrmenqqMsVpMRR0xNsV1ru4eNmuvp/74bPtIZXuzb7Au
   q1y4wKVH0QoB59K78Ag17rHD7GXrBtdZJVtGdzzJq9xF1BJKdveoFWF4y
   o=;
X-IronPort-RemoteIP: 104.47.59.177
X-IronPort-MID: 90010737
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:szezXa5XZFkH/nj1LVt+VgxRtNjGchMFZxGqfqrLsTDasY5as4F+v
 mNNWj2CPauKN2OhKYsibY/lpEwD78fSyYBmG1dqpX81Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4pwehBtC5gZlPakT5weD/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m2
 dAcMXMrcCG5gc29npyRafU9wes5I5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+eF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNKTOTgqaU16LGV7nAJCwckfmGQmsG8in/kWN5tF
 UELoDV7+MDe82TuFLERRSaQu2WYtxQRX95RFewS6wyXzKfQpQGDCQAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxRu5MDIZKmIqbiYeQQwIpdLkpekbixPETt9nVqmvnNDxMTj1z
 3aBqy1Wr7IXgM0Q1qT9/k3dhDmspZ/hQQs85wGRVWWghj6Vf6agbo2srFTes/BJKd/DSkHb5
 Sdb3c+D8OoJEJeB0jSXR/kAF62o4PDDNyDAhVloHN8q8DHFF2OfQL28KQpWfC9BWvvosxewC
 KMPkWu9PKNuAUY=
IronPort-HdrOrdr: A9a23:ejJTrK9vAL4WUAkd3gtuk+HGdr1zdoMgy1knxilNoERuA7Slf8
 DHppQmPGzP+XIssRAb6Je90cy7Kk80mqQFhbX5UY3NYOCighrQEGgA1/qU/9SDIVyYygc178
 4JGcQQNDSzNykdsS+Q2njaLz9U+qjjzEnev5a9854Cd2BXgwwK1WpEIzfeNnczaBhNBJI/Gp
 bZzs1bpwC4cXBSQtWnCmIDV+3jocSOsJ79exYJCzMu9QHL1FqTmffHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+5g7A23TV55F2nsKk7tdYHsSDhuUcNz2poAe1Y4ZKXaGEoVkO0ZeSwWdvtO
 OJjwYrPsx15X+UVHqyuwHR1w7p1ytrw2P+yHeD6EGT6vDRdXYfMY5slIhZehzW5w4Lp9dnyp
 9G2Gqfqt5+EQ7ApiLg/NLFPisa3HZc4EBS3NL7vUYvHrf2W4Uh47D3O3klUavoKRiKpLzP1t
 MeTP00qswmMm9yJEqpxVWHiObcJEjamXy9Mw0/Uhj/6UkVoJk+9TpR+OUP2ngH754zUJ9C+q
 DNNblpjqhHSosMYbt6H/ppe7rENoXhe2O9DIupGyWVKIgXf3bW75Ln6rQ84++nPJQO0ZspgZ
 zEFFdVr3Q7dU7iAdCHmMQjyGG4fEytGTD2js1O7ZlwvbPxALLtLC2YUVgr18+tue8WDMHXU+
 u6fJhWH/jgJ23zHpsh5XyKZ7BCbX0FFMEFsNcyXFyD5srNN43xr+TeNO3eIbL8eAxUK18Xwk
 FzIgQbCP8wkXxDAEWI/SQ5c0mdBnDCwQ==
X-IronPort-AV: E=Sophos;i="5.96,297,1665460800"; 
   d="scan'208";a="90010737"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Opey2Jn5lEmHD7A6JW7ki6Qs3qgz+6f+7YetS2xaClZKTF4rEqa28l3i5HnGlWvkbnGrhbczHVdH2Kj3o1eKVylltG6/YlGBvK73E3G+Mfii4iNLAEchtT0C/mHMc0pat18SqVwLsQrJVGMx20N2KtRwymmw8RsyovdK0lfJhi2t87tO2tGuKFuE4yPVyZvIwMhpCZPncAebQdYzqqIxsKRADVQV4dvjW7ZZTQWTjPL4PZ68ir8Z0jCNILB2S/c5i19WDsJ+QrlwTnUpVscsN1pJcNvJlSFW1bBYaqGGEErYoaErhMT5fhTRl1mc5GAz4x5HDuKTFkB5sxqNwEJrbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SPun27trLn8T3iqBdiblTkkD7u1SnPWiZG1UR+0D4M0=;
 b=Y1bJVKCFHDXRN49KpA3e02fvXMvEGfOUO/nNKPwh++URyO1TxzgFhFmV3lfgEtCUgAwcZgsQf10wjB+WAURj0C0Z8I/F8sfAj1k+VhsZDcPkYF8hUrR6Wk5R0y+jjnwPqSoLZbm+SCPvG0xFt7BTzhbZIlQw/Jf207AcCOSWY24ROPCOPoB7VJ9v1f070hub8EZgdQN3tajuJKCndjVs7w1xmDqn4dyDqKFsC3SAh6US44tSblEtpm+9d+CQnS8y22F0Qpxnxw+69ErKAIY01yA76jD/HmCb/5vt/MoFWtf/vh2rzb+GzMr1uISeb40QZJOUIlpIdXf3Ru/yKw30FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPun27trLn8T3iqBdiblTkkD7u1SnPWiZG1UR+0D4M0=;
 b=OTM9vjz2ZpsQmPC5XutVqB65vZx386AVqYFD17OINK8pYzqjLWdugIziRfp9qUNmjIzFYOnFMzQdQ+TunQteGE4PgvwtLRelr2mQzOQ18JV71+FOtLDiklne4ByOZC8qdGcIPvYF8TCfq3g5CJVoBlpuRthpASLexChYfnPlTaM=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Anthony Perard <anthony.perard@citrix.com>, Michal Orzel
	<michal.orzel@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Thread-Topic: [PATCH 4/6] CI: Express HYPERVISOR_ONLY in build.yml
Thread-Index:
 AQHZG+cbFLjU6ViRqEqaO8BfTNldnq6NfEWAgAADPYCAAAKVgIAAAY8AgAABzACAAADAgA==
Date: Wed, 4 Jan 2023 01:51:03 +0000
Message-ID: <5d3ed12e-3c01-5ea8-8d41-4a199fdf92b7@citrix.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-5-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2301031713530.4079@ubuntu-linux-20-04-desktop>
 <34e692e3-ef76-a43e-ec4f-a7c1ed2d094f@citrix.com>
 <alpine.DEB.2.22.394.2301031733410.4079@ubuntu-linux-20-04-desktop>
 <4f9a9927-c287-b40e-e4b0-653e69dbc1bb@citrix.com>
 <alpine.DEB.2.22.394.2301031748140.4079@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2301031748140.4079@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|DS7PR03MB5429:EE_
x-ms-office365-filtering-correlation-id: d51f62b5-468a-40a4-fa89-08daedf62371
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 BMCHowQ0FesAalJ2lN7tvhZh763c5r0KoymdgYXGgAsOZNgVwsV08NPCdA4mWGmp4iJgqYr+CC0pm3KtCBdj571c9d0mqZv5j8/3dupeK5OYOLIuagB3P7EXWrq7R6ghOWqME+VYVpoFb5NrE7uLPU9qIvXEhSHs1IqmkzyMz6jIhS0t5sMrFZYm0DB3QNYzHvwomSasF0WadCmzKXIL8diahwOx3pc1NadAm7ScSuz5t+18nie/33PfDlVjSRbuuB3WMGE+Uj8fJiFoX32Ev1bxrCNm9G36h89PS6X80aCJQqhVC9YTvtVxPnn95z+dNjoN276rsvUsOqZ4118JN3yj7LaffB8BdpZOvlYCC/SGSSoJS+y6GGIyeBEXzU6z++pgEL4G5sPVmviswl0YacU1BC00qWAo7QkQDCnrVeboFgJxr9zWlV2fbE6NfmAWD9pHsoGsFA/vY+3rPhXee5v3L0WcdeTATZQuKMJs71ETU9HLijx+ZM+16Owu7GSumFP/ZU3T5JQv73ot5+kXTd5uMz4F+luu7+8UygGuPyty+h+LdCo7+U04GRF/Z+H60fck/XsQxcsAiJwJwRqAcr8BAYsR7XXMwBXR0GX0Ityvp0iiRxKuw4cvMy59Qrich58dcE2rVCKM3wP6mkMvlaHrDFZemKJ0NPSXkhUcCoV3tAcrJFlc/rP4a/3rw+tH75qugwdVknkB0/CKyQlhXDfDbHAXunHrpYFLAI1DRlUCHevw1w18wfOeLHxNSYIG+a/gzs79dllGWn/Go8c61Q==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199015)(6486002)(71200400001)(6512007)(26005)(186003)(8936002)(122000001)(83380400001)(6506007)(53546011)(478600001)(31686004)(54906003)(6916009)(316002)(2616005)(66446008)(66476007)(4326008)(8676002)(66556008)(76116006)(36756003)(64756008)(66946007)(91956017)(38070700005)(41300700001)(38100700002)(82960400001)(5660300002)(2906002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Mlc3TUlFb21oNnZmWEY1a2JHMlYxNnB1RG1VRmZVOWYxQVNDNWRQa2swOGxa?=
 =?utf-8?B?T20yV2krNXY0ZkNpTjZjOEs5bnZ0N0xIOEtKdVBxYklvR1RobzFHdUR2WXBr?=
 =?utf-8?B?TUZYK1RBb3Z3NFB6S1ZnNlFERzJySmwzM2JvUU5kQTFqTno1ZFhzMmE5d0dN?=
 =?utf-8?B?ajRMNW5oVjNSc3g4Tzhvei9NeHRlbGNGa05xcDUzV1o4VzF6UXY3K1ROL0ZN?=
 =?utf-8?B?K1V0NGc4UVlDZlF5anA3eE5OV3VrTFZYQzZSU3J5NUJwZURZY3BxODc0K2tY?=
 =?utf-8?B?UFd2ZEdST0xuUWFoS0gyNDhWZFRNdnNnZnRKM2xlblU1TDVLVGFKdU10TnBM?=
 =?utf-8?B?NFpPTStNSlplVVZUZW1jN3cxOElodDkwdWF6R1JXbXRnREhqbmJnZ0NoYnlv?=
 =?utf-8?B?citJT2c4d2g3U1pQZTVBNU0xSkF3Wll4QmJNQlR4ZWI1VzYxbUlMUDdYMXBt?=
 =?utf-8?B?bm5ycDlyM1M5d1JUbmhnOWZ2Q3NiNlJJM1EvaWNxZDBuQ0UzeDgrUmFCUTBK?=
 =?utf-8?B?R295WmR6c2xWcmY1OUd0UDdTRDVmUnVxcUJvNHpvSVN5RktocEtkUFdQQnoy?=
 =?utf-8?B?TlNiMVF4dWFMUGhsend2UVNNNTJ6SjFQRG5aVmdEV2E3RnhoelhNTm9kbURI?=
 =?utf-8?B?N1NYVkI3ZlNZMzJLb1dSMXhBSENaanFHalFRdmNHcUdkWVRCaHB4bURCcm5j?=
 =?utf-8?B?RVp5eW9OOGtwalV0SURndjQ4Y1ZDWlN3N0xESWZYbFF0eEc5dU1DenEyR0la?=
 =?utf-8?B?L3A4NUdqc0Q2Y0dydVYxWXBBWFVWOEpsZ0RtUWtnUmdvblpJL2wxeFFmYVdP?=
 =?utf-8?B?ZTMvL055b2NDZTFQbjJadFNUTGZ4S1h6WTE1N3hYcnlPNEdPQktSNUxET2xG?=
 =?utf-8?B?ZlEwaytLeVRJRWJvczFjNTYrWlVMay8rbEZVUTFZT1pDdlczb0h3MzJVc0Rl?=
 =?utf-8?B?UENvN0NLQmZtRXhIYm92SXJSQzYrTFJTZDdaRVl3T01yY2UvVVRDYVZ2eTFj?=
 =?utf-8?B?a0tnRWt3eWJ2NVJRRGl1MHZ1aGwvQ2t2aTdpZnFkTE9GWFVyeVYyRTNJdm8y?=
 =?utf-8?B?MHk4dnNUckdxcHFUdGMwZFFVVEhTeFNvYXN5L1RQK2RHaE1jV21mVVVEVW9x?=
 =?utf-8?B?cE1EQjBnWDRpWnFDZWFBLzZHZUJ6cVVsUjhsbXJVK3RvYmorUjVMVzBLZkEy?=
 =?utf-8?B?SlF1b0RpczRkNlI4enhrRTdOSVJsdWdMTnRTdzFVV1VOcWFuSCtaZ0U4VUE0?=
 =?utf-8?B?LzBZaUZlT1BFZndwaGxVZkNJZEExUUtPYjVKKzJIMVlLak5oZmlKRTZmVE9P?=
 =?utf-8?B?dFA5eVZUc09MNE13QUppZVpGVGEvZmdhV2sreUp1VHNaMlNVR3JmM1UxaFFx?=
 =?utf-8?B?MndkTzQzTVZTdS9OSVE1QURPdDlBMXkyblhVNTIyZmJGSmt0ZXdtL0g2UHJt?=
 =?utf-8?B?cFE5a01wOTlscnY4OHozNFpyTVhnSEh4Wmh2cElrMkl5aExMc1QzaTJCTnE1?=
 =?utf-8?B?RFNqOFVJMUJteFNoMFhlcTNlU3VZd1dTWDBxVHpjU0Y5Z1V0eEVkT09IenIw?=
 =?utf-8?B?cmlrRU1Qd1BiMkhNZDAzazV0SzZlbXJ1bExzWWdKeXZKcUo3YWFkS21HUkVw?=
 =?utf-8?B?ZXFlRkxZeFgwUlFjbDRzRUFtMmxTUEUxNDN6WTdDRG14dUlLQWxJamdScWdG?=
 =?utf-8?B?dHZQNE14bWtZMFFVc2w1VjZQZEp1RW9JZDZFc3RaUEJDQUQrMlVkSEhvSDhT?=
 =?utf-8?B?RnZUd24vaHB5ODM3d3hFTU5Kb2k2WkdkZ3RBMjdiWTdsRmF4enpLRTRTV1I0?=
 =?utf-8?B?ZWFnTkN3UjVWalFhOFFCSlBraVpYaU5VTWZFWVEvQllEZ3k5d3B2OEt5S0k2?=
 =?utf-8?B?QS84UktrU3gwaVZhQngxeE1sYXhzRkF0dFJ6VEcvRk9jbTlNRUloNFN4Z2k3?=
 =?utf-8?B?ZTJQelJHYkUwNVFoUFN5UVRFR0dnbXZSTWxTdXo1QXIvdWlPeVkxUVJ2bTZm?=
 =?utf-8?B?UFp3OXUyZnRBbnpPaGVFUzMvZTJ2djdpUFZQRS9tZkc1VnNscm12YjVjdzF3?=
 =?utf-8?B?VTdKU2pIekFWdmFZOThvaWYvQS9oRzdON2V0RVo3blIwZjB3UDBlVzJPOEhO?=
 =?utf-8?Q?KkTQcX3lrNaZ/DCo4vtNrDuon?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3C1869C3125DA48900FC3F596FAD320@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Htf94hKcFUR9XJPXySwYiyFGubF6T0jWNoWG1QJnYuCbaJ/NshYZdTUlV1nv7bnwO3jP8kEjs4rvcfcWzeg1dVmjtG4z7dBZrtIQ9MNmWHPXpmsWQLNI6zyZBimTgG/2Y6tfJ+Ac8CbwAPK5u9PDNEMpGU5GuJ9R+UJ6A+a2bSq/FMQ1TD4m4GEfVfDR/Bb4CrwT9Fu1gc0Ogiuei6MMWAg4HZ9eAjsdJrfPKSWe+A+gTu0Dy7kS9CCjAmJcy1vpuFEcGG6Yjs2VMAmNqyDsTnVbLAfkfMjd1vlDYSL0sQjLC4dFOo/2yb1QgUY0le+wO3rfZt6I/K0CBB2+W6icOQ2SB9XD6q92J8Gf0Bd/aMe5TKZEoDET8h4uQCb3occWWV+xMRZDpdv9i0kXkMtLDzzFrcVt/R5FKa3MXUrYdfP27F/eLPtj9S1410Di7xq3xfRWdzIa/0P6NuLpoAD13zbcxnJUvOVWeOLTl0sbM8tE8QLkQT/HyECIszsC/6XQo7oOFWBNq7prRgXD2Z0P2KSzfFPAt5k83FV8OFGrARH3Tubs/w8rHllHhy7AyrrIOLPLAYItS7MTQRfRHXLvd1jNHSa0zkhC7+2jYNErSH/RUb0iG8nLydsWyAiPhprfbKMAF/wvDGvrNxEY0aR1FKQnAdZXAqPmYC/jFylwL/SS+FZR+9eiIHI9cKiMrUFZE7YCf9rgB+iqq7zrCmx7Lh5M+jHXohMQ3a2meEVAwuwVjvVOD0N3NmLThYPuLf2JpSR8Q6Z0mnIT9pnP4Jnp/YGmACm/NKwPS9SQgSYUDbn62HtCocZkJBbbv58lrAKX+TYXOXokPEQwvIcraD17BOOnvnlXPeIZDz4qEyT4luLLhxEdija9A70ApOO2AJJn
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51f62b5-468a-40a4-fa89-08daedf62371
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 01:51:03.8600
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fm8PNh5daqtkfhyQuIHMV41ggtJ9UZHJNG5Eaufgk77nRXKaJ6r+63guTrjVo2pT7r1bNP9Pi3bRhLlTro9ONX6hTKNzgqgH0yGPrsReky4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5429

T24gMDQvMDEvMjAyMyAxOjQ4IGFtLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFdl
ZCwgNCBKYW4gMjAyMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4+IE9uIDA0LzAxLzIwMjMgMToz
NiBhbSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIFdlZCwgNCBKYW4gMjAyMywg
QW5kcmV3IENvb3BlciB3cm90ZToNCj4+Pj4gT24gMDQvMDEvMjAyMyAxOjE1IGFtLCBTdGVmYW5v
IFN0YWJlbGxpbmkgd3JvdGU6DQo+Pj4+PiBPbiBGcmksIDMwIERlYyAyMDIyLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+PiBXaGV0aGVyIHRvIGJ1aWxkIG9ubHkgWGVuLCBvciBl
dmVyeXRoaW5nLCBpcyBhIHByb3BlcnR5IG9mIGNvbnRhaW5lciwNCj4+Pj4+PiB0b29sY2hhaW4g
YW5kL29yIHRlc3RjYXNlLiAgSXQgaXMgbm90IGEgcHJvcGVydHkgb2YgWEVOX1RBUkdFVF9BUkNI
Lg0KPj4+Pj4+DQo+Pj4+Pj4gQ2FwaXRhbGlzZSBIWVBFUlZJU09SX09OTFkgYW5kIGhhdmUgaXQg
c2V0IGJ5IHRoZSBkZWJpYW4tdW5zdGFibGUtZ2NjLWFybTMyLSoNCj4+Pj4+PiB0ZXN0Y2FzZXMg
YXQgdGhlIHBvaW50IHRoYXQgYXJtMzIgZ2V0IG1hdGNoZWQgd2l0aCBhIGNvbnRhaW5lciB0aGF0
IGNhbiBvbmx5DQo+Pj4+Pj4gYnVpbGQgWGVuLg0KPj4+Pj4+DQo+Pj4+Pj4gRm9yIHNpbXBsaWNp
dHksIHJldGFpbiB0aGUgUkFORENPTkZJRyAtPiBIWVBFUlZJU09SX09OTFkgaW1wbGljYXRpb24u
DQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+IENDOiBEb3VnIEdvbGRzdGVpbiA8
Y2FyZG9lQGNhcmRvZS5jb20+DQo+Pj4+Pj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz4NCj4+Pj4+PiBDQzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVy
YXJkQGNpdHJpeC5jb20+DQo+Pj4+Pj4gQ0M6IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFt
ZC5jb20+DQo+Pj4+Pj4gQ0M6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWkua3Vyb2Noa29AZ21h
aWwuY29tPg0KPj4+Pj4+IC0tLQ0KPj4+Pj4+ICBhdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55
YW1sIHwgIDIgKysNCj4+Pj4+PiAgYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkICAgICAgICB8IDEx
ICsrKystLS0tLS0tDQo+Pj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQ0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vZ2l0
bGFiLWNpL2J1aWxkLnlhbWwgYi9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sDQo+Pj4+
Pj4gaW5kZXggOTNkOWZmNjlhOWYyLi5lNmE5MzU3ZGUzZWYgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEv
YXV0b21hdGlvbi9naXRsYWItY2kvYnVpbGQueWFtbA0KPj4+Pj4+ICsrKyBiL2F1dG9tYXRpb24v
Z2l0bGFiLWNpL2J1aWxkLnlhbWwNCj4+Pj4+PiBAQCAtNTE2LDExICs1MTYsMTMgQEAgZGViaWFu
LXVuc3RhYmxlLWdjYy1hcm0zMjoNCj4+Pj4+PiAgICBleHRlbmRzOiAuZ2NjLWFybTMyLWNyb3Nz
LWJ1aWxkDQo+Pj4+Pj4gICAgdmFyaWFibGVzOg0KPj4+Pj4+ICAgICAgQ09OVEFJTkVSOiBkZWJp
YW46dW5zdGFibGUtYXJtMzItZ2NjDQo+Pj4+Pj4gKyAgICBIWVBFUlZJU09SX09OTFk6IHkNCj4+
Pj4+PiAgDQo+Pj4+Pj4gIGRlYmlhbi11bnN0YWJsZS1nY2MtYXJtMzItZGVidWc6DQo+Pj4+Pj4g
ICAgZXh0ZW5kczogLmdjYy1hcm0zMi1jcm9zcy1idWlsZC1kZWJ1Zw0KPj4+Pj4+ICAgIHZhcmlh
YmxlczoNCj4+Pj4+PiAgICAgIENPTlRBSU5FUjogZGViaWFuOnVuc3RhYmxlLWFybTMyLWdjYw0K
Pj4+Pj4+ICsgICAgSFlQRVJWSVNPUl9PTkxZOiB5DQo+Pj4+PiBjYW4geW91IG1vdmUgdGhlIHNl
dHRpbmcgb2YgSFlQRVJWSVNPUl9PTkxZIHRvIC5hcm0zMi1jcm9zcy1idWlsZC10bXBsID8NCj4+
Pj4gTm90IHJlYWxseSAtIHRoYXQncyB0aGUgcG9pbnQgSSdtIHRyeWluZyB0byBtYWtlIGluIHRo
ZSBjb21taXQgbWVzc2FnZS4NCj4+Pj4NCj4+Pj4+IEkgdGhpbmsgdGhhdCBtYWtlcyB0aGUgbW9z
dCBzZW5zZSBiZWNhdXNlIC5hcm0zMi1jcm9zcy1idWlsZC10bXBsIGlzIHRoZQ0KPj4+Pj4gb25l
IHNldHRpbmcgWEVOX1RBUkdFVF9BUkNIIGFuZCBhbHNvIHRoZSB4ODZfNjQgdGFnLg0KPj4+PiBJ
dCdzIG5vdCBhYm91dCB4ODZfNjQ7IGl0cyBhYm91dCB0aGUgY29udGFpbmVyLg0KPj4+Pg0KPj4+
PiBXaGV0aGVyIHdlIGNhbiBidWlsZCBqdXN0IFhlbiwgb3IgZXZlcnl0aGluZywgc29sZWx5IGRl
cGVuZHMgb24gdGhlDQo+Pj4+IGNvbnRlbnRzIGluIGRlYmlhbjp1bnN0YWJsZS1hcm0zMi1nY2MN
Cj4+Pj4NCj4+Pj4gSWYgd2Ugd2FudGVkIHRvLCB3ZSBjb3VsZCB1cGRhdGUgdW5zdGFibGUtYXJt
MzItZ2NjJ3MgZG9ja2VyZmlsZSB0bw0KPj4+PiBpbnN0YWxsIHRoZSBhcm0zMiBjcm9zcyB1c2Vy
IGxpYnMsIGFuZCBkcm9wIHRoaXMgSFlQRVJWSVNPUl9PTkxZDQo+Pj4+IHJlc3RyaWN0aW9uLg0K
Pj4+IElmIGl0IGlzIGEgcHJvcGVydHkgb2YgdGhlIGNvbnRhaW5lciwgc2hvdWxkbid0IEhZUEVS
VklTT1JfT05MWSBiZSBzZXQNCj4+PiBldmVyeSB0aW1lIHRoZSBkZWJpYW46dW5zdGFibGUtYXJt
MzItZ2NjIGNvbnRhaW5lciBpcyB1c2VkPyBJbmNsdWRpbmcNCj4+PiBkZWJpYW4tdW5zdGFibGUt
Z2NjLWFybTMyLXJhbmRjb25maWcgYW5kDQo+Pj4gZGViaWFuLXVuc3RhYmxlLWdjYy1hcm0zMi1k
ZWJ1Zy1yYW5kY29uZmlnPw0KPj4+DQo+Pj4gSSByZWFsaXplIHRoYXQgdGhlIG90aGVyIDIgam9i
cyBhcmUgcmFuZGNvbmZpZ3Mgc28gSFlQRVJWSVNPUl9PTkxZIGdldHMNCj4+PiBzZXQgYW55d2F5
LiBCdXQgaWYgSFlQRVJWSVNPUl9PTkxZIGlzIGEgcHJvcGVydHkgb2YgdGhlIHNwZWNpZmljDQo+
Pj4gY29udGFpbmVyLCB0aGVuIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBiZSBjb25zaXN0
ZW50IGFuZCBzZXQNCj4+PiBIWVBFUlZJU09SX09OTFkgZXZlcnl3aGVyZSBkZWJpYW46dW5zdGFi
bGUtYXJtMzItZ2NjIGlzIHVzZWQuDQo+Pj4NCj4+PiBFLmcuIG9uZSBkYXkgd2UgY291bGQganVz
dCByYW5kY29uZmlncyB0byBidWlsZCBhbHNvIHRoZSB0b29scyB3aXRoIGENCj4+PiBzaW1wbGUg
Y2hhbmdlIHRvIHRoZSBidWlsZCBzY3JpcHQgYW5kIG90aGVyd2lzZSB3ZSB3b3VsZCBuZWVkIHRv
DQo+Pj4gcmVtZW1iZXIgdG8gYWxzbyBhZGQgdGhlIEhZUEVSVklTT1JfT05MWSB0YWcgZm9yIHRo
ZSBvdGhlciAyIGpvYnMgdXNpbmcNCj4+PiBkZWJpYW46dW5zdGFibGUtYXJtMzItZ2NjLg0KPj4g
T2ssIHNvIHdlIHdhbnQgNCBIWVBFUlZJU09SX09OTFkncyBpbiB0b3RhbCwgb25lIGZvciBlYWNo
IGluc3RhbmNlIG9mDQo+PiBDT05UQUlORVI6IGRlYmlhbjp1bnN0YWJsZS1hcm0zMi1nY2MgPw0K
PiB5ZWFoDQoNCkNhbiBJIHRha2UgdGhhdCBhcyBhbiBSLWJ5L0EtYnkgdGhlbj8NCg0KfkFuZHJl
dw0K

