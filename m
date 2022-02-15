Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC44B7921
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 21:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273555.468789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4uO-00071R-0X; Tue, 15 Feb 2022 20:58:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273555.468789; Tue, 15 Feb 2022 20:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK4uN-0006zB-To; Tue, 15 Feb 2022 20:58:47 +0000
Received: by outflank-mailman (input) for mailman id 273555;
 Tue, 15 Feb 2022 20:58:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zJqs=S6=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nK4uM-0006z4-CX
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 20:58:46 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ee1650f-8ea2-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 21:58:45 +0100 (CET)
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
X-Inumbo-ID: 0ee1650f-8ea2-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644958724;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JPLHhX/RZu03sGePa0Ovma9LHYxY/o3Uv7lyFhJwVGQ=;
  b=JKrKCEZGJD2LxJpK3nRH2AdaIXq/T4MjBI5XVtkYA6Qb5HkZGVqp4Dpb
   ggZBJa5Ur7et/cyl7uSoC6B7J7WHfFV5YEYa5TX7jug3I1Qh+dzOVWQKX
   kLlvrUhCiW5Cx2PtPoE+wzG2mGiAdOnwJtON0peQNpOfouBphi2sQZjl/
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /E+DLJP+dXdSXnT/XFxJJlg//GILZamp2G6f6L3LqSV/+x3BRKeF+3wESIy/DK5aPs+5n+21Hr
 o6RJntDgGiVJSgpTOctBl6AkxivQ0QYqslGiPGNJ1N1wURBu6YbQWX0gTeYMtbtD1HQYITfsvp
 WtX4FU/pCV4oQiOr+Wz3khbxSAjtdahrtI3Rz4Hz7poXDAkSkSxufNG6rl+NxgGONGJcTjuy/l
 DifcRFXKsrsHEH3dmritHKUKuNHoE2WXabTE7HXOtjcUvzVD4DQZYHsqgS45gdsEmgXRwovPA6
 2v1nbqAtvlVPGlnUS15AAWfD
X-SBRS: 5.1
X-MesageID: 63729172
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BOpC1KjeeUIdbUp5AxbNWfnDX161thcKZh0ujC45NGQN5FlHY01je
 htvWTiGM6zcajbzKI1wYYq0/B8CusXcytZqHVc5rX1mH3sb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tQx3IDia++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1K7NuuaRcofZHsp8QAWFpmDxpaMbFvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiFO
 JBIMGU1BPjGSx9iB2gsK7EGoL+tm2LYXGUGom+z+aVitgA/yyQuieOwYbI5YOeiVchT20qVu
 G/C12D4GQ0BcsySzyKf9XChjfOJmjn0MKoNEJWo+/gsh0ecrkQRAhALUVqwodGil1WzHdlYL
 iQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4FLR99iGdy+nowzm5G2NHcCJ6TNA6nZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoCtQVnNL
 ya2QD/Sbln5peoCzO2F8F/OmFpATbCZH1dutm07so9Ihz6VhbJJhaT1szA3Dt4ade51q2VtW
 1BexaCjABgmV83lqcB0aLxl8EuVz/iEKibAplVkAoMs8T+gk1b6I9wMv2EueRoxa51eEdMMX
 KM0kVkPjKK/wVPwNfMnC25PI5hCIVfc+STNCamPM4smjmlZfw6b5iB+DXN8LEi2+HXAZZoXY
 M/BGe71VC5yIf0+kFKeGrdMuZd2l3tW7T6CGvjGI+GPjOP2iIi9EuxebjNjr4kRscu5neki2
 48EaZXTk0wFCLKWj+u+2dd7EG3m5EMTXPjeg8dWavSCMkxhHmQgAOXW2rQvZ8pumKE9qwsC1
 ijlMqOB4Fag13DBNyuQbXVvNOHmUZpl9CppNi0wJ1e4nXMkZN/3vqsYcpI2e5gh9fBikqEoH
 6VUJZ3YD6QdUCnD9hQccYL58N5oeiO0iF/cJCGiejU+IcJtHlSb5t/+cwLz3yASFS7r59Amq
 rit21qDE5oOTghvFujMb/erww/jtHQRgrsqDUDJPsNSaAPn940zc379ifo+IsctLxTfx2TFi
 1bKUElA/eSU+t076tjEg6yAvryFKeomExoIBXTf4Ja3KTLeojipz7hfXbvaZjvaTm71pvmvP
 L0H0/HmPfQbt19WqI4gQa1zxKcz6taz9b9XygNoQCfCY1ixU+4yJ3CH2Y9Et7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZymvI8PA4AETm/ysmrrOIXHJbMwSIlCEAfqB+N5kow
 Lt5tcMbg+BlZsHG7jpSYvhoylmx
IronPort-HdrOrdr: A9a23:ZBXCrq6MDv7a0BGkzQPXwWyBI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhJU3Jmbi7Scy9qeu1z+863WBjB8bfYOCAghroEGgC1/qs/9SEIUPDH4FmpN
 5dmsRFeb7N5B1B/LzHCWqDYpYdKbu8gdiVbI7lph8HJ2ALV0gj1XYDNu/yKDwteOAsP+tcKH
 Po3Lsgm9PWQwVxUi3UPAhmY8Hz4/nw0L72ax8PABAqrCOUiymz1bL8Gx+Emj8DTjJm294ZgC
 v4uj28wp/mn+Cwyxfa2WOWxY9RgsHdxtxKA9HJotQJKw/rlh2jaO1aKv+/VXEO0aSSAWQR4Z
 7xSiQbToJOArTqDziISC7Wqk3dOfAVmiffIBGj8CDeSIfCNU0H4oJ69Pxkm13imhcdVZhHod
 J2NyjyjesnMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZIZc6I5l/1UwKp5KuZJIMvB0vFtLA
 CuNrCp2N9GNVeBK3zJtGhmx9KhGnw1AxedW0AH/siYySJfknx1x1YRgJV3pAZNyLstD51fo+
 jUOKVhk79DCscQcKJmHe8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR52Mi6PJgTiJcikp
 XIV11V8WY0ZkL1EMWLmIZG9xjcKV/NFAgFCvsukaSRloeMNoYDABfzP2zGyfHQ0Mn3KverLs
 qOBA==
X-IronPort-AV: E=Sophos;i="5.88,371,1635220800"; 
   d="scan'208";a="63729172"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI3qaPGI+kg0O5aUVK6wMkqxIpXtqpX01O/hM3ev03hBbu2lrwtYIKlmPvX/VQlSKFTxfeTUVjPei5yBPgilszm3aQvjq7fLEFoc7xRnY88psutwj2MZPAcbM0wV3G7FUM/7vTZ4l4yRk7OvUg26xxXgQXVpdXAjavyQJ9u3fEtYqS4SmYwpfbcnQPhaQiAHdDnDNimQosL+UCrlPBofoJtiDHqfJ5aaBZe5rMLS8Kk9zBh9RqrI/q0uha4GIJaFn1EH/Hrb4LJo0Yr+nhyKqRQeU5FMIzhQNnUqU5p0eUmbsIeKFStAGKb/Ag79JaHpd2LClOwJoJLRzbmvVAx52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPLHhX/RZu03sGePa0Ovma9LHYxY/o3Uv7lyFhJwVGQ=;
 b=M3vb5RCB3cyBxsB6boWBF+d1xD+raAav2InOiYC8Bg+MySj/oriNWzSdu9H6UW8qaPzONUIfCkqnfE+Ec9LXDqoQ88RAwdTtvEOTJvbauSE4Qln22KtxgRoxq5j39far/V6ZX4VVh36sByxGAU1f2RU5UiWFGGRLwy+ZDFa1O/Gkq3TZn1IwFIqnqpTsgNbrmgoI9uP2+Fa+1GxWLoPlm8QxpZoO09IJw9GeEmUTEW31xpeVV7Nr0Hh65Kz1XbfBxH/FOE858g9xgarh6x7DGCgS1AoAxe5hMs79al7/vyskd9vJtBBNO2r5JdSL1ug2SKuFFN/JlR6gU++H+nk12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPLHhX/RZu03sGePa0Ovma9LHYxY/o3Uv7lyFhJwVGQ=;
 b=J7/QoL4GUEnkvmaD6v2GXsqojb9Tu+EOFJI6Q0Tx1HzXkymk+kC4C8gViXIXZg7y3MQaStPiuQ621LvpAUyiS/CN4WNjmZhBvN5NoEZ4+u91yRA3HlRU8t4hHTFAggWLMLyPGeSIFItboiXqMeNmsaaftZPEygkJerVb1IcPWno=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Xen-devel
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 68/70] x86/setup: Rework MSR_S_CET handling for CET-IBT
Thread-Topic: [PATCH v2 68/70] x86/setup: Rework MSR_S_CET handling for
 CET-IBT
Thread-Index: AQHYIaOTUcnCkY5v50erixQZ+OuCLKyU0+kAgABGY4A=
Date: Tue, 15 Feb 2022 20:58:31 +0000
Message-ID: <029ee818-6cdd-6027-59f9-6ddf07ed01d0@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
 <20220214125127.17985-69-andrew.cooper3@citrix.com>
 <79617697-307e-b19b-71a9-7c8554aec481@suse.com>
In-Reply-To: <79617697-307e-b19b-71a9-7c8554aec481@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 782851fb-3f43-45f3-c656-08d9f0c5ec9b
x-ms-traffictypediagnostic: BN6PR03MB2513:EE_
x-microsoft-antispam-prvs: <BN6PR03MB25135AB1F8FA21F2774F359EBA349@BN6PR03MB2513.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u0zdZZOdO0LC+zl/BbDF0lMr4d9+B0uYIOnOh3E7dTTM/GDiUuzXIs3kIsySbgZU2JSrN2sOIEahVsuw0zWzv/KQmQ0+GHeflb1f28mz6RvfvojdYjKOO9mGTvr6fKMsrQS0/hzHQ0zSJtYRvX1IfGJHMVoWbb/dTthhqauNIU5UYn4aWT3iKCXmXWsTmlbkS2+5zDzaWgR51eNoEgaySqPzaoHwTydgvamywK7dfOiR9aOgIMcL/cIwpbhLgAHZU+LYs1DejzYZLgqrUURZ9m3dR32kEU1j2o6w/BISUvxabQuA10hq4NvthrbWf+8svftPi3IuB4Gi3UfIdIsxG2UFUfTy/7HnRoJyrX4dbZx0Hh/bYS5e35ZAv9WgYk0Mir8RNKQB70gXJERhQ7wq+q3+CrA1/bSOpdElPnjGXjjIes7c8BlIf5pIJMqlXiuoTMGm++UW9A30CdNSP4xYzcaePszEDlco+2lBz9hIcMgoXtIsiCCF8JmMBS8Mp2GhZV+89z2sTMhms2m0vhq3aW7F5yHkDuUPt+fF2PCS1AZqaBeeZ/EnvFwGa++ROS15J1WmpL09rZV+7SQNEWBxwzI2wBvuvGHlGksxtrGfEL/qOfyb4K5n17Tg/0ni9WiS8i3iiYwAc2Aw1CYugLTI/XJ28Bhv89x+A7exQ4AzKs8YTWZkenjpVSFWYuHWjKBzhsK1ejr9GBjqkFgNRJxOahir9KWkwgQwRdmh8r3l0q0pDjhPVnsYrPKouFjxxkB/m0FTAOtqsE5C8srXwe4P8g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(31686004)(508600001)(8676002)(31696002)(6486002)(76116006)(86362001)(91956017)(66476007)(66446008)(64756008)(36756003)(4326008)(66946007)(66556008)(8936002)(82960400001)(316002)(186003)(26005)(6916009)(38100700002)(122000001)(54906003)(2906002)(2616005)(71200400001)(53546011)(6512007)(38070700005)(5660300002)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1lNWjFtS29aQ29UOGcxaE9vNVhWY3ZmLzRCaGQ2bWEyblc5R2tHSGVFNnFE?=
 =?utf-8?B?V0kyVUR2ejcvSUJRSHlPRkViRW1jdlo1cm96ZTBxWXVyOTBPc2VlVWM4ZUZK?=
 =?utf-8?B?K29CUWpZNmt6d3N5V0ZzaUlKdHlsUEVRRkFVWlZYSmdQMDFXbnRqSFVSR0N1?=
 =?utf-8?B?Q1dnWWRtdnI4eGFCcDRHVXhrbHRBOFN6eExySUh6N0JEOVU1TDdmN0h6aG0w?=
 =?utf-8?B?NkRTRHEvS081cGxnYUVmaXJUcERUME1va1RCbHJod3Z1aDF2d25BdVRrTWJv?=
 =?utf-8?B?cExKYUxIV0N2dXcydkJaM254Q1hFbWVTSm9PZUNoR2pjQ1pOWUxhaFdrZTV0?=
 =?utf-8?B?SkU0K1lZVy8wRVBKQkJuR2JPMU9ORXZDaXc3bk0yalRFUVdRU3NtMHdPRTlz?=
 =?utf-8?B?M2oxcDNKSGZNdjR2bllsYjVJNWN6UHFSQk1aUU5GMHJDeTY0SGgrQVIwempz?=
 =?utf-8?B?eGtTNzAyMEhJMHBlZU1wajNkQ29FUjh4SnA5VkFlaURwdU5iRHJiY1lvazFJ?=
 =?utf-8?B?c0RGTFBkZmh2VWVDT0FPdFFJajE5ZWhuaHBMMU9HR2pxYnhSMDN3cytUNkdL?=
 =?utf-8?B?YU5xTExVOHFpVmxpT05NZ3ZoYU9rQjQyYitUSjdSaEk1RGV2VHBtVDhoam5Y?=
 =?utf-8?B?cHZ0bkYzOVhDb1VBYnF5YUNjNG5yV3ZmOUE4Y0RndXN3TS9rdENyanZQcDBL?=
 =?utf-8?B?Y0hFRTViNG85UkYrZWNVdzN3ZXFycDFPTktIV2YwVGhlQzA0eUJGZTRhS2ZE?=
 =?utf-8?B?eGN1Nk1IU3dFSHI3NTBnRUkxVGMzTlFRaEhwWE1ZaXhORnhodzhwRkFoMHcx?=
 =?utf-8?B?eGdhcmk0R2ZCUDRUSXgrUk11eU5Lem5ObFF5Z3BvbUQ1Ulh1L2JxV1EvUytl?=
 =?utf-8?B?U0l5Yzl1UWtPRWdRMXFqZkhRbG1CclVOY0hDS3BmNFRuNTFyVzZSZVBpdnFL?=
 =?utf-8?B?YUpkQXpaaVB1K0pOYmVHNEhnZjc5S3U2Q3BGWWxjZ25oaHQ1eVp6RW8wWjhS?=
 =?utf-8?B?MzNaditoUFV4ZEhTL3pNUDNNZHpxOU5wR1FObHN2YU5SN3Q1bHFhejdMRFYx?=
 =?utf-8?B?a09JUnQ3OGJXU1ZMMXpqTFpOb3FRVzJLb29NdlU1eEdKWFBqSFQvalkrN1BF?=
 =?utf-8?B?RkJLMkZZSzNEb2g1L1g4dG9UWmpGS0hTWHUzY2luODFpVlBkMmJ5VzVoL0xJ?=
 =?utf-8?B?OEJERjFPZnVLNS9GUlBBWEtSWUxCalgwQlpJYmd6Q1luT3hvZFFSY3VISXhm?=
 =?utf-8?B?ckpwSUozNHlJaUs1QWxlb2pHakxiblZQYTdZWWYrM2dQUHM1d1VnT1QzS0xY?=
 =?utf-8?B?alRkN3VCVDlMVWxUQWtUbzMvNDFkMmI2TGp1Q2RTQVpuM29jRFNOc21MeW81?=
 =?utf-8?B?ZjBzbUpUejBxbWJTNURIYkFsK0U1d1dNYjBxazUvYTVMTVBFWmJLK3kvZG0z?=
 =?utf-8?B?YWNZY0ZXMVZnaEoycFFkTkZDWCt2RXJVTDNyN1RwUVpVMjByNERjOVNnM2E2?=
 =?utf-8?B?VldQOWZwSzEwL2pmNVJzUDJsOWZCeHFGb01CWmRtTWhPYUJxTFRRSS9oTU9B?=
 =?utf-8?B?L010ZDYxejRDQURDUkdzczhXSEtHZnVGKzNydWZkellVek5SZHlNOGN1NFdG?=
 =?utf-8?B?MnRpakV6L2dmcnV6REhTZnFOREd6MFMyczAxR1hGVi80c3lvSWJDbW80c3RT?=
 =?utf-8?B?Mmd4UW1VbXZsaVd0d3p5RjN1K28zczQ2c0tuNTl4d1VuZG5GeUQ4aXYveDg2?=
 =?utf-8?B?Qk1PR3BGdGVhV2IxWStVcVRqMGlCazhYbVhQMk90eE5yREJ6T05yTzVhSjZS?=
 =?utf-8?B?N2hOVWZ6QTNkM3hqOUhkeFRmQnA3S0dJV1pSVmRWajZ5MndJaHlDTnpTWjdq?=
 =?utf-8?B?NHlKMllsd1V5eHFsREMyVW5YTU9lY2dpZ2VNcmRTc2dXWE94R1pzZEhCOEhm?=
 =?utf-8?B?cDQwc25xd1hobVYxMU5KbUJtaDUxMDVuTTg1TGwrU0hSTUlKRXJYU3lKRHdj?=
 =?utf-8?B?aE5HdFA1REVhNGRYWXArK1BGaDU0VUkrTS9sMnFHdTBDK25LdFBJMTUyaGtO?=
 =?utf-8?B?c2k4YzZLODgvZUxBdHpvM2RENTUxRldYMEpGY3YzZzNSc3hQVFViWjVpeWpD?=
 =?utf-8?B?TlJOeXFrZjc2QVpEWGlmS3JtS3BCZlpkeDFody9iMUFGbTVkZGpGK0ZJZ045?=
 =?utf-8?B?NWd6N3F2SWhPcnRIR1VLdVprdVVWQldxaS9lMngxMTZRbmZyT2hPT2I3Tkl5?=
 =?utf-8?B?WnI2MTAyaUd4UTlUNlVhWkpIcnBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <916DB9069B4FC84BB1CF2A79A31005D9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782851fb-3f43-45f3-c656-08d9f0c5ec9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 20:58:31.7710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PAWaI+JBGEIL2ZLHzKsKHVvFsgwsl1xYkkr91JdyuofOsnv8SPm9ZZu6YjEI4Zg1xsVoEN/EKHchBi2dTEdqO/vcYSk3lf9Yl9HCexNdrvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2513
X-OriginatorOrg: citrix.com

T24gMTUvMDIvMjAyMiAxNjo0NiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDE0LjAyLjIwMjIg
MTM6NTEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+PiBDRVQtU1MgYW5kIENFVC1JQlQgY2FuIGJl
IGluZGVwZW5kZW50bHkgY29udHJvbGxlZCwgc28gdGhlIGNvbmZpZ3VyYXRpb24gb2YNCj4+IE1T
Ul9TX0NFVCBjYW4ndCBiZSBjb25zdGFudCBhbnkgbW9yZS4NCj4+DQo+PiBJbnRyb2R1Y2UgeGVu
X21zcl9zX2NldF92YWx1ZSgpLCBtb3N0bHkgYmVjYXVzZSBJIGRvbid0IGZhbmN5DQo+PiB3cml0
aW5nL21haW50YWluaW5nIHRoYXQgbG9naWMgaW4gYXNzZW1ibHkuICBVc2UgdGhpcyBpbiB0aGUg
MyBwYXRocyB3aGljaA0KPj4gYWx0ZXIgTVNSX1NfQ0VUIHdoZW4gYm90aCBmZWF0dXJlcyBhcmUg
cG90ZW50aWFsbHkgYWN0aXZlLg0KPj4NCj4+IFRvIGFjdGl2ZSBDRVQtSUJULCB3ZSBvbmx5IG5l
ZWQgQ1I0LkNFVCBhbmQgTVNSX1NfQ0VULkVOREJSX0VOLiAgVGhpcyBpcw0KPj4gY29tbW9uIHdp
dGggdGhlIENFVC1TUyBzZXR1cCwgc28gcmVvcmRlciB0aGUgb3BlcmF0aW9ucyB0byBzZXQgdXAg
Q1I0IGFuZA0KPj4gTVNSX1NfQ0VUIGZvciBhbnkgbm9uemVybyByZXN1bHQgZnJvbSB4ZW5fbXNy
X3NfY2V0X3ZhbHVlKCksIGFuZCBzZXQgdXANCj4+IE1TUl9QTDBfU1NQIGFuZCBTU1AgaWYgU0hT
VEtfRU4gd2FzIGFsc28gc2V0Lg0KPj4NCj4+IEFkanVzdCB0aGUgY3Jhc2ggcGF0aCB0byBkaXNh
YmxlIENFVC1JQlQgdG9vLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcywNCg0KPiBhbGJlaXQgd2l0aCBhIG5pdCBhbmQgYSBy
ZW1hcms6DQo+DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TDQo+PiAr
KysgYi94ZW4vYXJjaC94ODYvYWNwaS93YWtldXBfcHJvdC5TDQo+PiBAQCAtNjMsNyArNjMsMjYg
QEAgRU5UUlkoczNfcmVzdW1lKQ0KPj4gICAgICAgICAgcHVzaHEgICAlcmF4DQo+PiAgICAgICAg
ICBscmV0cQ0KPj4gIDE6DQo+PiAtI2lmZGVmIENPTkZJR19YRU5fU0hTVEsNCj4+ICsjaWYgZGVm
aW5lZChDT05GSUdfWEVOX1NIU1RLKSB8fCBkZWZpbmVkKENPTkZJR19YRU5fSUJUKQ0KPj4gKyAg
ICAgICAgY2FsbCAgICB4ZW5fbXNyX3NfY2V0X3ZhbHVlDQo+PiArICAgICAgICB0ZXN0ICAgICVl
YXgsICVlYXgNCj4+ICsgICAgICAgIGp6ICAgICAgLkxfY2V0X2RvbmUNCj4+ICsNCj4+ICsgICAg
ICAgIC8qIFNldCB1cCBNU1JfU19DRVQuICovDQo+PiArICAgICAgICBtb3YgICAgICRNU1JfU19D
RVQsICVlY3gNCj4+ICsgICAgICAgIHhvciAgICAgJWVkeCwgJWVkeA0KPj4gKyAgICAgICAgd3Jt
c3INCj4+ICsNCj4+ICsgICAgICAgIC8qIEVuYWJsZSBDUjQuQ0VULiAqLw0KPj4gKyAgICAgICAg
bW92ICAgICAkWEVOX01JTklNQUxfQ1I0IHwgWDg2X0NSNF9DRVQsICVlY3gNCj4+ICsgICAgICAg
IG1vdiAgICAgJXJjeCwgJWNyNA0KPj4gKw0KPj4gKyAgICAgICAgLyogV0FSTklORyEgY2FsbC9y
ZXQgbm93IGZhdGFsIChpZmYgU0hTVEspIHVudGlsIFNFVFNTQlNZIGxvYWRzIFNTUCAqLw0KPj4g
Kw0KPj4gKyNpZiBkZWZpbmVkKENPTkZJR19YRU5fU0hTVEspDQo+IEp1c3QgI2lmZGVmLCBhcyBp
dCB3YXMgYmVmb3JlPw0KDQpJIGNhbiBpZiB5b3UgaW5zaXN0LCBidXQgdGhhdCdzIGJyZWFraW5n
IGNvbnNpc3RlbmN5IHdpdGggdGhlIG90aGVyDQppZmRlZmFyeS4NCg0KPg0KPj4gQEAgLTkwLDEw
ICsxMDEsNiBAQCBFTlRSWShzM19yZXN1bWUpDQo+PiAgICAgICAgICBtb3YgICAgICVlZGksICVl
YXgNCj4+ICAgICAgICAgIHdybXNyDQo+PiAgDQo+PiAtICAgICAgICAvKiBFbmFibGUgQ0VULiAg
TVNSX0lOVEVSUlVQVF9TU1BfVEFCTEUgaXMgc2V0IHVwIGxhdGVyIGluIGxvYWRfc3lzdGVtX3Rh
YmxlcygpLiAqLw0KPj4gLSAgICAgICAgbW92ICAgICAkWEVOX01JTklNQUxfQ1I0IHwgWDg2X0NS
NF9DRVQsICVlYngNCj4+IC0gICAgICAgIG1vdiAgICAgJXJieCwgJWNyNA0KPiBUaGUgbGF0dGVy
IHBhcnQgb2YgdGhpcyBjb21tZW50IGNvdWxkIGRvIHdpdGggcmV0YWluaW5nLg0KDQpTbyBJIHRy
aWVkIHRoYXQgaW4gdjEsIGFuZCBjb25jbHVkZWQgbm90IGZvciB2Mi4NCg0KVGhlcmUgaXMgbm93
aGVyZSBhcHByb3ByaWF0ZSBmb3IgaXQgdG8gbGl2ZSwgYW55d2hlcmUgaW4gdGhpcyBibG9jay7C
oA0KQW5kIGl0IGlzIGFuIGFydGVmYWN0IG9mIG1lIGJvb3RzdHJhcHBpbmcgU0hTVEsgdG8gc3Rh
cnQgd2l0aC4NCg0KVGhlIHRydXRoIGlzIHRoYXQgbm90aGluZyBhYm91dCBNU1JfSVNTVF9UQUJM
RSBtYXR0ZXJzIHVudGlsDQpsb2FkX3N5c3RlbV90YWJsZSBzZXRzIHVwIGJvdGggdGhpcyBhbmQg
dGhlIFRTUyBJU1QgZmllbGRzIHRvZ2V0aGVyLsKgDQpJU1QgZXhjZXB0aW9ucyBhcmUgYWxyZWFk
eSBmYXRhbCBhdCB0aGlzIHBvaW50IGZvciBub24tU0hTVEsgcmVhc29ucy4NCg0KfkFuZHJldw0K

