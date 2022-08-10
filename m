Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EAF58F0CA
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 18:53:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383737.618921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLoxP-0008MT-Ks; Wed, 10 Aug 2022 16:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383737.618921; Wed, 10 Aug 2022 16:53:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLoxP-0008Iz-H3; Wed, 10 Aug 2022 16:53:23 +0000
Received: by outflank-mailman (input) for mailman id 383737;
 Wed, 10 Aug 2022 16:53:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUq/=YO=citrix.com=prvs=214886735=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oLoxN-0008It-CP
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 16:53:21 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eee438c9-18cc-11ed-bd2e-47488cf2e6aa;
 Wed, 10 Aug 2022 18:53:19 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 12:53:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6107.namprd03.prod.outlook.com (2603:10b6:408:11c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 10 Aug
 2022 16:53:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 16:53:14 +0000
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
X-Inumbo-ID: eee438c9-18cc-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660150399;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dq1QoU9wrBsf+JtYUWnGYv8Pj6/tIY8nw/QTFRhHCk0=;
  b=d/SzCQ8F+zXPAbCF5lbcXcgmxiIRVbmHKSHDL1iEfZ5JW94Q9ovgVsu1
   Z1verSzjyZQjRPS8wSgwke+SLzBM3OxigoPrUDIrWjiWbJy1J0F8qcrpX
   eevDAhZY/bf+tZbN7HAA+1hYVhR0CaXHQOsw7kZ8rsz0hd3XQULBRfv7K
   4=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 78239251
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ek+tNaJHvExxkVUBFE+RyJQlxSXFcZb7ZxGr2PjKsXjdYENS1GNUm
 jZLXziCb/bZYDfyL4t/Yd7g90hUsZbVmIVlHFFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Es11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE7a9LXRAYJYgiwrx4JExM5
 /8xJHMTcUXW7w626OrTpuhEoO0GdZCuFqVP/3ZqwHfeEOosRo3FT+PS/9hE0Twsh8dIW/HDe
 84ebjkpZxPFC/FNEg5PVNRiw6H11j+mLW0wRFG9/MLb50D6ygBr3aerG93SYtGQHu1en1qCp
 3KA9GP8av0fHIPPk2HUqC/17gPJtSDJCKQRM4S1zdFVsV+hllMJGSM9VkTu9JFVjWb7AbqzM
 Xc8+CAjsKwz/0yDVcTmUluzp3vslg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQCy
 Vuhj97vQzt1v9WopWm1876VqXa4P3gTJGpbPCscF1Jbs5/kvZ05iQ/JQpB7Cqmpg9bpGDb2h
 TeXsCw5gLZVhskOv0mmwW36b/uXjsChZmYICs//BwpJMisRiFaZWrGV
IronPort-HdrOrdr: A9a23:JMc5wKOE7xwfjcBcT+n255DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGj9rXlKj+aRpDKw875BKIhTaI7qe/NxSDxB8RXx5G3L9nqA
 H+4k3Ez5Tml8v+5g7X1mfV4ZgTsNz9yuFbDMjJptkJJi7qggOIYp0kf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ/+1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh77D3vXklVavoLhiKr7zPI9
 MeSv00I8wmKG9yWkqp+lWHBubcBkjbUC32GXTq8fblrgS+1EoJs3fwgvZv3kvovahNNaWtrY
 7/Q9tVvaALQckMYa1nAuAdBcOxF2zWWBrJdHmfOFL9Ccg8SjvwQrPMkcIIDduRCeo15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIRGmmRzzixsxX+pA849THNfHWGDzGTEprn9qrov0ZDMGeU/
 GvOIhOC/umKWf1A45G0wD3RpEXI3gDV88evMo9Rju104r2A5yvsvaefOfYJbLrHzphUmTjAm
 EbVDy2P8lE5lDDYA6NvPEQYQKZRqXSx+MBLEGBxZlj9GEkDPw+jiEFzVKk+8qMNTpO9qQrYU
 oWGsKUrp+G
X-IronPort-AV: E=Sophos;i="5.93,227,1654574400"; 
   d="scan'208";a="78239251"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcFrXMilLgceM2B0cWTeCjpYGajE3XBBhT2z9c+veedXRM84ZXqEF3qWpA4cs9Ftcz7F7ZLxI6Y7ltgUaldsRyYS4j0ypMpIIMXF82Rk6A936fnmJpjE0U3bYbxlHZm66PJk4n2UP6X8sXdAgXv64LbX+LhR6Ry92+wAIyCZJ+20FRITrAB6AGgUY81uHrYXjIaet7g9W2a2aY1XeOZWzz+tWZF3fnAyKS3d3OfB/VMf3nHRaRhqx73yRdIBchkhOHu3NbVYE5AXxm8uLU60IF6C5Xly+mZA4EMgIk8r3BOWAmLRqVivmqFhiVrSEzh36GrqmFKebdhAOyp5GdacQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dq1QoU9wrBsf+JtYUWnGYv8Pj6/tIY8nw/QTFRhHCk0=;
 b=fYKo8egxWjahwNNnuqNhOoDA7s8xQaK41p43yDXMeMTvYEA+9qg+GRVUOjqW9AGW5RyU7Kcu3fQhq07Z4t7FCeq6lx+Qh2e2uoNlRKtZQDUkyfAUi86d88qOTr2fCf3r23/NYoue3ukYmBiKu3iNzC14OYGq1QdzoD+Zz94HTRn2P5Wjr9LJlGvz05pZZmdV6iRVWTBHuZf6xqjqMiofSl50UFSF/djLG2ktzv4UTfFqw0EP7LcDOZHOSUAA/MshQi1PqI2B/uz39xysxet1BKb7ZRiXrAPfuZjV/h6VYkZfIq5cj9lQpRZBG2iuUR7/6pXbaL8wOxI1O8UGl9RARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dq1QoU9wrBsf+JtYUWnGYv8Pj6/tIY8nw/QTFRhHCk0=;
 b=Cj/ddLxuMe72ctswAPNIKQO/JA5xH7zENpc1Q3SmTYyLeMQBG1aAlVJUpe6/AovuUxJ1ov8mC2az+Iew98rPkcMQsEF2WQ57sDM2zCEdAx+Dez9DYncSPF7KqaUieVrjNCtHqMC+jQD+T9vOdlp/ejGoVz05cMF3X2Nc2DSauxc=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Subject: Re: [PATCH 01/11] x86/CPUID: AVX512-FP16 definitions
Thread-Topic: [PATCH 01/11] x86/CPUID: AVX512-FP16 definitions
Thread-Index: AQHYgKKW7KRWCIuWMEySYi2Dfp4rP62oshaA
Date: Wed, 10 Aug 2022 16:53:14 +0000
Message-ID: <2882ecf5-f1e7-fb83-5ba8-d7e714e0191f@citrix.com>
References: <9ba3aaa7-56ce-b051-f1c4-874276e493e1@suse.com>
 <5dc84e7b-e3d6-92cf-8ffb-c4bc0a3e6c74@suse.com>
In-Reply-To: <5dc84e7b-e3d6-92cf-8ffb-c4bc0a3e6c74@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28fd11cc-a567-4455-f10f-08da7af0d0f3
x-ms-traffictypediagnostic: BN9PR03MB6107:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 cd2uvwLyFTGexQITp4h0ajUzQVLH9bYOA60Zfu/GnRsm+oJPmIXB6OuIPRq8holUcWw2F24iuhkEoYHNYtVpadzU18lMPdhE8IVTUuJTabk0OYkrBFOzLCdA8glrx3DuHdJZQIVc2rILeFP7tZ9rtyqgaDIfhKelYIgAG9q59LL9JyPmjJej4R7Eue1q+xYllNwbKDPblJBu6DYeABYWGPDf6nGrg+VVRnVxz6Q9N6aDQu6XFEkjCfD5OQLZyqdFc9Pv7VtMSNQmvz48ao3/FuMmGdNGTpUmAUo8phJmlAhOPkXSUY4IuUsV37vTmKdXauredAAvJgp+8WPda+7MWEdBjlDq3C+/ixfWTlYG4gabCZCF+gJZ1zDQ9OpWUaK8IuGIEogCnxEVuMFXOip2l5RoywPqQUGa3IN18U2SOXqRdKb6ndGBaToMaDuX6GoBzLAv6QA9UiWfHLBfSKwz5pnchDio82D2Ng+7qOIuI4kn3X0c7cWewrVNKE5gi1xH4YD1GpFZc9KS0JaflNUlzvBaGgmam+wCxd3gPxE7ACUjNxu3AkZOeNxicTjq2F8XAURGh4IWIC+OByYAQ//1qw4xlMtnEX+3VQnQKInFk7rFcKlh0iRA0LonDX7tNb+TKCxTVpV7a+lc8f6iaF83f0UMEgDJ1SBqBilA/FkztIt0SlFar4JV7lwsKsrfGknnFDnmgv+QpjkH6P3cOvVrPcYlUfCZwwgefZYqiQSNwjQ1i1R+3DMug6KZYG2JpqX569jLbqeFcvVVXbsoXCpmyC3zL68dWiykz3d73rqON4soNf+09EDhkRNnceyxF3yrMLgYeLrYIuBCoEJwChLWPAh1/M/76C9ACMddBA9M9nM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(110136005)(54906003)(316002)(71200400001)(31696002)(91956017)(36756003)(8936002)(478600001)(6486002)(86362001)(38070700005)(5660300002)(82960400001)(2906002)(122000001)(2616005)(6506007)(38100700002)(41300700001)(53546011)(558084003)(66946007)(66476007)(76116006)(64756008)(66446008)(4326008)(8676002)(31686004)(66556008)(107886003)(186003)(6512007)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YXBweHZpbmF3NXVPUGV6MjZsMjF0ZUlVTGY2aW1DaXFGVzcwTnU5L0VRa2Vl?=
 =?utf-8?B?N0Zkdmh6Y0k3Mm5RaGNYQjJZWmdHUDVWcmJ1NjQxSVlyeGM1NTJ6SUI5MVJy?=
 =?utf-8?B?UmRsODZzN3lKWERMVDNGY21tMEtHWlkvM0RwZ2VCTTNsVTgyOHMwQ3JQRmcr?=
 =?utf-8?B?dTVYNUFMVkE5WGhLZ0lzSHpaNDlJRHlHNmQxejBrc2hjWis3N1d1SHhXdC8v?=
 =?utf-8?B?cmV5K3pqS0lHY0ZWV1VPemZ4djBPYXNuWThsWnNMb21KLzZRRmd2Tk90Z3VR?=
 =?utf-8?B?djB6MWR5YlBKOTNHUE1HaGRONG1vcW9xUERzcmdhMlFNRDc2SExpRGpUV0pa?=
 =?utf-8?B?M1F1aXJsRGFPWlIzUCtUZjdqYlR0allTdjN2RkRrNGVVWGp0aU4yVUl1dFBE?=
 =?utf-8?B?NEN1dTNIRVZmdnhpbDBDQ3lVOW00cHFlQU16My9adkJURUFOcWpJYUJPV1BP?=
 =?utf-8?B?dGZZY2VHMGdLOENmeklTR1NlMjBibXlKQXVtTWJpOTVRRjVPcnhaRko3MVJS?=
 =?utf-8?B?WGxXZGxuYjJzMEJHOHZxMkZySlJIcU5Ib2JhV09tdGs4NHlEdHNid05NQVZq?=
 =?utf-8?B?Y2lleWE5aForZm04SElMOHhjNGYzdEhOK2JaeFhwZ29KNmRIekg1aytxMjI1?=
 =?utf-8?B?elFQUERmSkJyZDFzWWhCdWlYenR1N3dyczdZNXFlYTlENHNHZlRwK2pVdGZz?=
 =?utf-8?B?bDhrTVEzbjl4ZjhDb3BycHhZVW14QUQvaXFXT2dha3dCdklLWVBhN2xYUTZS?=
 =?utf-8?B?TjFzdm1kVkttSGlXZ0szN3M2TEw0RnZEclNzQ28zcVZNdzJqZDIvK3V0d2N5?=
 =?utf-8?B?QVZIT0RIb0MzMW9XNmxLdmh4dnJxejE0QUZRQ0UyZHd2bTFRQkNOWkxFdWFo?=
 =?utf-8?B?T2dtRjJTZU5DYW1tbEVsMkR5Nk5GTXc0UWN0bmNSS1hXVW1BalVRNXhwbzNQ?=
 =?utf-8?B?NXdmYk15UjV3Vi95cFhHcDNRZGdWRDhBTDhBR1pOTUJYNWlvTkdNT1hJVmFn?=
 =?utf-8?B?SWR0WkxiRHVLUzVoKzdBbk1BUGdHMVJ0NHZ4eStHbzVhd0tFdzdZM2NBTGFP?=
 =?utf-8?B?dFhIeWJBbzI4bDRvdUEvaTFPU1BQYytJcnNCWHNGT2N4QmdKVzdkZmVnZ0Ur?=
 =?utf-8?B?R0FxZjV1RGFsMmtMZkppcklhb0tmbW1ZM0xDWWpseitiTXhmSUdrOUJnK2FG?=
 =?utf-8?B?S2ZQQzhmb0NrV0hsKy8xNDdzOXhVWllUNzcvb0tXNzkwQ0k1S2UyQmxQdUhH?=
 =?utf-8?B?dmFocGNqb0d3eEFTUktNeVc2YWtSc2NlZktpUjl5Yi9XcmJzZS9pZ1M4VGJT?=
 =?utf-8?B?SU1NLzBKZmpMbEZ2bzRsN2hsSWNRbjA0c3pleXFIU1hNSVNmV2gvTmVrQk5m?=
 =?utf-8?B?TEZJQmdKeDBmNVNnK21nZS82OC83T2lJSWVEekZEL2o1UkJoNklpSStSU3RC?=
 =?utf-8?B?eWNFQUlCaytydjgxWEZLajFiWlhUSi9lUUNOSlVmQVZaY2ZkQ3B1a2VzQzlG?=
 =?utf-8?B?dm1CUlE2c1lVdE1zWTI3YXZEcUNpSXBtSng4aGdqcVhjVmI2d2JXckgzaHpF?=
 =?utf-8?B?WTk3RnIyak1ONVdyNXdXbUUveU44ck1YMStZZXYyd3oyNDdmcHBoVGx0N3Ns?=
 =?utf-8?B?d2FBb0ZsSDg0eXQyMFdFQ0p4aWNReG1DeWszVUR2NDNmbm9VTFZXRERhYW9R?=
 =?utf-8?B?Z3kvMXdQeG9yb0VJVzRFUVJHNEx6cG5oN0JtT0VTbWJDdDhjdCtVTWg5aWRr?=
 =?utf-8?B?Nkh1NzBRLzk3Z0k1SnQ0bFlyR1hJaHNzNDd6TWQ5Z2twYUdkbVJaaWtJcGM0?=
 =?utf-8?B?NFF2Q0p5NC9Mc0wzOVhuVEZMVEJWTUpGcWJHR2tGTUxaZHBqNnhENE8yK0tj?=
 =?utf-8?B?SnpHYTNIQlk4N1IzSnV0S3JneVAycnpPYytEY0R5VTJUWDlDWjdyY2JxWjMr?=
 =?utf-8?B?L083S2VoMXJkbnBsM1JrUWFxWEUzMkZ1aXNpbzhpUm9udVNEY1VoQytTMWIv?=
 =?utf-8?B?Y1Z6eVV2RGtBUms1TzFUTmRvVHJrWXd4R2cvbFB5dDJ2ZzVEanNXQ2h1ZDN5?=
 =?utf-8?B?amt1MTIvQmVjdEpCYTFtV09meDlIRXRvSm5mOTZZZWQzMk5oTzJzaHBsczdD?=
 =?utf-8?Q?6TvpR74FGAxxMc+msZyQjK5RN?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2325E7EDC284F54283E8617981091F7D@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	pao//vhEPRYyV6nXKRDMExFlX/FmeYQc3jYo5or9JFFBkhTnk6i9JiJV0a0JZDRWJAwAWR8P/gMCZhdKEl6EKmyQ5zj2kHjVaw7HG7qoSlncOPaO8AXB9UyXpBykJ2mStc7OcMeYZEzHrVKo3VMFAs3a57Dp/63ccmL1FVuQmSGtVSno4jM5TezzjUo0EXd37fJGmzmiin+zGaSJFMRUUkd5lADFYJT1iAZfqQfzqb0dSUt1bDQb0C15+4366ir+SxFC3mfKIhOuTxHTf7RxzMZIA3sXfLAiFym3Jovmh81o5jrYATm68Znk2MMwRRuQ1SW9+jAx2IYW54kq75CSRFMYLEIyHLTKi7sCDzlRSMmhbFIs4iSkJtkw7sxPWKs5w04NkB7kICOhVvH5J8C3K+zS5WuL8A5Wlidr542uQDyKtB2doL86NMxtSnNG8kb9748dMEDUiOFq7+V2U+lhPtw5pKlMfA2a2bNOQ7BH4ytXiq9oYsjQ8Cs9KwqE+dROzg5axoJNbVXNg3CsGiCjWBAY/a29uu6cvOf+vjQpw3ymKRWg1lcJRbMMu3XrQx6hgOefL8S1+XncVC1jGC7PZZDZXjWAWrRkzPH2P+DFflLgUgLi0uUiYg0vTua0R572pgHIQIVv+oa9q1pS/N/zXfQZGh0M+GnyNDPsZAGHM3awTTvJIgbN1vQudpOyC1Vv4heptDMzjQ1xAQXWvPSr8KiRGgdgcJZXj1XWnbKT6VHo6nuJRy9W2c4bBLduxzJGRPlwc44yH8VBcBGg95CnfnsPrZ/mQBuJdbn9c06v3CyHZMQwwAK8RcEgW0YB4Teh
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28fd11cc-a567-4455-f10f-08da7af0d0f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2022 16:53:14.2577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jpTtWLNFZurKIPjA+WVLX5pGa72j/MTaZOJ1cAxzBniEMnaByTw6zw2F2QoStjcZc78XraKKeJRe6+VG+YOTwbJaM839RlTN3in0sAVNaHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6107

T24gMTUvMDYvMjAyMiAxMToyNywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo=

