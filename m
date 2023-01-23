Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62C677967
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 11:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482732.748404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuIy-00027y-CO; Mon, 23 Jan 2023 10:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482732.748404; Mon, 23 Jan 2023 10:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJuIy-00025a-8e; Mon, 23 Jan 2023 10:44:00 +0000
Received: by outflank-mailman (input) for mailman id 482732;
 Mon, 23 Jan 2023 10:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HTo8=5U=citrix.com=prvs=380e0b34c=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pJuIw-0001hY-Ni
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 10:43:59 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5ed916f-9b0a-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 11:43:57 +0100 (CET)
Received: from mail-dm6nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2023 05:43:55 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5676.namprd03.prod.outlook.com (2603:10b6:806:116::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 10:43:50 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 10:43:50 +0000
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
X-Inumbo-ID: d5ed916f-9b0a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1674470637;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=91VWZdwQoisjKS1gHEo+DOPoUz9Y4vKhU2F7no2seCA=;
  b=FioI0Ng/dGY46HJxTHbAExBG27Cnvlg2dBJMg6VFXKxPyQ4MaSCF2Bd3
   4ouiORNo4n9F8FQF5ExM3lv9XwO3ES5C8ybS01PRMnIMaqIiwZq/QtUra
   Jc7bW5fDr2gHEBNpVOXEEQwVjFtwrhwJOVCRPc1eN1kCNe5oVweYuo0UB
   o=;
X-IronPort-RemoteIP: 104.47.57.170
X-IronPort-MID: 93239769
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LzQCjqkHVOShhKe+j1G4ZB/o5gywJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOUTqEPvaKMDT8etp1YIzg/RgC65PTytQ1GlBu/y42QSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgS5gSGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ecAIyETST2Hu8b1x+jja8lrlPwnLPC+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iee1WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDT+fjp6E00TV/wEQyUiRKWF+5j8Cmg02yQ8hZN
 FE2pXoH+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqTTMFSCMV7t+lp5s85i8jVf5mGa+xy9HwRzf5x
 mnTqDBk3upLy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:5Ws0zq5LufYSgVDfmAPXwMzXdLJyesId70hD6qkmc20wTiX4ra
 CTdZsgviMc5Ax6ZJhCo7G90cu7Lk80rqQFhLX5VI3KNDUO3lHEEGgI1+XfKlPbdxEXWYRmpM
 BdmwQVMqySMbDa5/yKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.97,239,1669093200"; 
   d="scan'208";a="93239769"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=la01BiyxY/6+sl0I+xmlKtrwbtSVWBj00n6nD4a6XJzL6sfJBiZGcjhmcgh1uJTU93IOXJEGoQtzxq8Ewa9kFkeDq+TafasSX9J7MmYEPp7rOSwtfquJrcHY7xibNOHdDv+mO/ucnnNfvovSNopSCqa0TXuLj5wKCxWiBYVmnO110vQRqArE2xq1B1fuWm66KNDLPXy1rvYOjJGOHUys3CV+c51K/FZTHKDz6cjnkkbFbqDlFR9lrczVxeAdIXVbpGcVVJBv2NQk3xYvVRXKkyoqAmRlsTeY3cKualnzFQ/Ho4qK8oGZHyiVoErBDVzO+fDfAt/59/rrphDCyqgBEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91VWZdwQoisjKS1gHEo+DOPoUz9Y4vKhU2F7no2seCA=;
 b=mXtZ4STtMR6oxF2YUH6cucRcMyQVuNBMjRbTKtZS+1i5+2oxcRjPCMzzBeZM54Po7319PuYdzoEiatCkABvzCBgJq5oVh0vsQq8UfhMVKh4COqyJ9OAbq7JJ4yVXGiPjQ2OdGh3a07r6akLZjBeDl/uVe79sZAWvKjeZg3kpVpQeXYicVXMmpt3Fy3wSMhJYwjOR4/wlinmD1Quk8mvU1POVgiscFWTfjHltfsAJY1heJwAwSMp34r/c6f+0Y/IIjm7yaH8eYey0EzYwl/SDZd8sfVwOlRJzhmeWu3WDNNBu22uM6qjhjm/MYxvpvyfyJuI4KbzUV6erAk1scWXh8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=91VWZdwQoisjKS1gHEo+DOPoUz9Y4vKhU2F7no2seCA=;
 b=bM3xofjWFOvOeB3cs/jArfP8o43qx4DP9wqL+pdK4845wdeluIn1MbPJNRU8e2pdDVHIRk0sLX0s3d8ju2O8h55traDGbHWL79rYd43eOpxMg56AOyQOnQU/kBcG8OOX7Cux6GrHB4kCMVuEqlFGeS005nGhSjGPPEIXGWmUMcE=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, "Tim
 (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Thread-Topic: [PATCH] x86/shadow: sh_type_to_size[] needs L2H entry when
 HVM+PV32
Thread-Index: AQHZLwKEbZ+pvxq41k6VhQDqg2rUMq6r0SKA
Date: Mon, 23 Jan 2023 10:43:50 +0000
Message-ID: <79420a4f-358a-f404-7965-e5f215234ba9@citrix.com>
References: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
In-Reply-To: <942e1164-5ed0-bdda-424f-90134b0e22c5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|SA2PR03MB5676:EE_
x-ms-office365-filtering-correlation-id: 61e6db6e-1458-40fc-4c2d-08dafd2eb6b4
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 ERAgiLK+JTt85Yv+nUg27teR3A8IFVkAn+/mhA9DfagoN3T3vIIFhGmgCBaaUEWyIZNB6lpvfxC0SmwYVQmDfHqX0Fwek2zhdmXIuknjrbYHjZD9j4ewNgjw63o8HpWAmNCjpwbxBqcxsIBm37hzAdfx4DG4YZ9D5O8AkQYwJnV6b65WMC0K9OyAPbOGlQjaI37XqtBuYJmy/+wavPVA+18B2OQQOILeDnWmZsCLi4t1j5EiHTFRqIlE6U8p0RjdHro1UQ1q6tYDVGzSdhYzCTeRsJ+l43n1HPsD4SzW2KK+bjPsGSSLNlo3LvX5t9ncTmRJGlLE3NB+AWsqAI5nT/WUimIjazYuVVu8XxxTOGsu9T+FL2Bd6JDl/HdEZsMcFb9qYZsEVyM2O9f4vTqmmZIGLLX9FQsWf+xU2DcHE5xf//Aw0eRH44Nx3bEH04Q8g0cE+f1xBFwjLjMasCPiW3mYgHQdHLpRtXRQ+1yrWu2fQ2M4tn/TwJ71NQIGZN4bpl+aAAtA68ywHJunW65mihcDNxvGX4gSixE46uLNXQOUcTl8tysfqfuMpt2gdQaPVwbpQSdFHM+mZ1lpPDeU/qwU6JcvvROCXg6pGlBXUN5WDlR9IY9aA6WiqHiwboZ/Ua25eP9mF30HQWnLNbOcjgRpdoh5NhHaEShEU/adF0YwJ+HG3s2pVfsAWuREe8K7rtJQvPTNKSrZCfsEVpy/kCzFCef+m+fc0BGgHcQA67MOSOpWEYNskw9cW9VHKTFVcGEtkBeRsP7Z3zk7NDMIbg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199015)(122000001)(31696002)(82960400001)(38100700002)(38070700005)(2906002)(4744005)(41300700001)(5660300002)(8936002)(4326008)(66446008)(6506007)(8676002)(26005)(186003)(6512007)(53546011)(107886003)(66556008)(64756008)(54906003)(2616005)(66946007)(76116006)(316002)(6486002)(91956017)(110136005)(478600001)(66476007)(71200400001)(86362001)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TUthYUgwM2JlZFcxNFhUSjFPcUI1Y1R5Mzc5TEZadW5ydlZHaDBTSnIwKzRh?=
 =?utf-8?B?RU4ycVd4VHlTZzZkL3B4eGVKeGE4UThzYVk5SlRYbjdVR3kyQ09TVDROYTl6?=
 =?utf-8?B?bE5XLzZLZTd6Uzg1ZVg2QW1jS2Y3UUxPdmJQaWFCVkpvcEpQS0xmdThtVUFC?=
 =?utf-8?B?RWl5NXFnMExQa1ErdWVSamdNd1lDQWJRNUFDNHhhYVJIbTFhSXdOV094WkRL?=
 =?utf-8?B?R0VNL282akpxMTNGbjJFdzB0alJWVFVGM0pQb0N0aHVZTTVWUFR0YWcwZFRa?=
 =?utf-8?B?Ym0wYmpKd0ZSZWdWZHc2elMxUFJlTUdJZUxPR1lqMWNlT1lNY2N5R3REMm5B?=
 =?utf-8?B?ZUt3ZmxYemw1b0ZIU0UyOGliZ1dIc245Ry9qVDI0K1hSUDlld0luTHFVektS?=
 =?utf-8?B?SFozdnp2ZWl6RDEvR2FOaVc5d1liWFlXd2kraHJ0K1J4YVMxaFlaVUk5RkJH?=
 =?utf-8?B?OVdJc1RNOFFOeEdwbGZ5SEdoejVZQW1ZKytlQzM0ZGVWcmpjT0hwTFFGWTRJ?=
 =?utf-8?B?UHFqS0pCckhaMDlVdmJLd0I2Z2JUWWRlLzB4ZVJ3UVViMmhyRGhqQWF5Vitn?=
 =?utf-8?B?anJ3K3BVSUpkUndDTGVBZ2tXcU1xeFpGUzgyUlI5dWx1VGc2d0NzZTZYVEcr?=
 =?utf-8?B?TXlzM04rUkx1eDlscGIwR2F5S3FncjhyNzRtbjI0cmR0NENtTTJKalNtd2RJ?=
 =?utf-8?B?a3pweDJ2SmtaUHlRU0gvQSt0UEJyZmh4UiswV05jRGx0YTRBdnlGMzNTelZz?=
 =?utf-8?B?VnpVb1dPYmcxaWpNZm55WDE3cnlmZndSVnF3cGQvVVV4MjF2ZGdPQXNVM1Z1?=
 =?utf-8?B?VUFLa0o3ZzBJek41ckc4ejFhanpHVVowaENnYlpsb205NVkyUEc5MFliNVFU?=
 =?utf-8?B?Qjd6U1dSS0ExeHRWRXRJM21HQjY2MmtkV1QzNXlSZzNQUFNsMHJWSi81UzN4?=
 =?utf-8?B?UFBaRzZEMjRaUWpqWVlNL3VkTCtRQ0dwcE5PMTJIM0w2cWZsSmcyaHh1WEpR?=
 =?utf-8?B?WUE3Ump2UGYrYlowdk00UFBrQUlISzlsWkJzRm5pSmZQSjR2c3FlVDFuTktz?=
 =?utf-8?B?czVjWnJoN2Y2UG1xUnIvZmF3Z2prUEo3YmNnQTN0NHNPdXRrRXQwbWI1UTBi?=
 =?utf-8?B?dlJpTFZjR2VDWVNJQ3pqaHVHRUMyZWU5ZnlNMXU1Q0Q1L2liYUFEMUNrN2F3?=
 =?utf-8?B?THBVUlV6emVLTWpFcWo4ZkRTK3c0M294UlFaMXYyREg5VTRtcVk4T0w4Vk4r?=
 =?utf-8?B?bmNIeFgva014U2I3anpXd0pMZUdkaGRRV042NExtYWJJT0R2VVlvelhiTGpL?=
 =?utf-8?B?K25TbjEyZ2QvKzh4YlkxbEtFdmFWU0ZYRzNPY2dBSTgwMDlQb0cwRXptdk1P?=
 =?utf-8?B?VXlTL2RHcGlGdjN1WVhKaHQ5VkZReWZqSUxHVEozVDE0U2R3bFRkcjJjQm5r?=
 =?utf-8?B?Z0EvcUQzUmhmclpNUHlidzgvNGlnVXRMc0FzNk1tanRTSkg1a1d6OFNnd1Fq?=
 =?utf-8?B?YUJRZnUvVFE4NWdNMGtodG5ObVNaZHBwbzR5am95MlBaTWRCUUVtdGJHZ2Vz?=
 =?utf-8?B?RTk0ZDNtZ3h1b3UyWDMyN1VlZnN2QVB2cUhQdUdmRFBLdXlxZVZLM3ZnWERD?=
 =?utf-8?B?TnduK0V3anNYSTJvTGF3TXNob0g2VDN3Ym1GcjZqaTBCS0NidEF4NzV2TFBy?=
 =?utf-8?B?S211M3ZMRU90R0kvZC8wRlFPczJCRUJvRFNsYm5Mc2x6YU93V0VrcjVZKzZ1?=
 =?utf-8?B?aXJiV2l3SXoyZlFUUFBrbC9jd0x0MERFRkJLK0dOejQvTUxRMkJ6OG5oK243?=
 =?utf-8?B?YW1mVjVTSUZ5enloSDcxUlgyUjZpVTcreEVIY0JlTFkydHNFL3BqTTFValNO?=
 =?utf-8?B?NGRnR3VmOHFYR2FpT0VBcy91NktRaE5HaVRoVVRRUmY5TzB3ZGc3c3hPanVr?=
 =?utf-8?B?T3VsdWdUTUVpUjVxbVhNbzlZNDZ5Z25rVngvSEMwVnJoTzF1SnpYM0xnSnAw?=
 =?utf-8?B?NFN2WnZBNzVnOHZWNHpyOXIrNDBFT3BROXRjS1Z3RUdsK2FJeGdnVmUrWHNQ?=
 =?utf-8?B?T0lrdC8rYkwzTG8vbXhXTGFQUUFWaHVidmY3TlB3YXBTUTNPUU85bnkwTGR3?=
 =?utf-8?Q?FZ3FnJ8pv1KtdCnud7ZZv0rcs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2DDA3452430574999ABD8376C4882AB@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	RUs5zhMoj+RIwnzyHc4CzSnEq27NjQpXYPrJR4cZ90+cGPWLef6SFDw88GuE53SRSGIkjhYF43qp04sBwSTY9ozqRCH3Dx3TaA0X56bFDytM8Yz9Zp817GNpLt6//4qvO9MsQ/l2RiB9Mh4sKFN6rsaBr0S0bqLrCUidshkOw+J7mJVB45toaSTgsTj9yC1NqZp7tsgCXZk4dpb8GROGsOcdr5k9lLXgwaFMYl164F/DqlMk0v9hgCIQuACJ1LynRKAmKnBmrSTQHAy4GeihJIH6raojIipjKiIbnRmzfs3f0BZPesX6Tl/OQ3FVdYW3Mzlh7C7/QArh7H3sfdWFFmwerlzfWSRyWzJe0+3KqitKvMrDbCR3Mp7IwQmQdKvVDNOdOHDM0sLZbab2XVAlS7ykrmkJTAxX06OPEzRZQiDz4brnvzL9il9jjDiukWZkZ6NdEQPTf7OeXJsjX5qZxQemywqxy633MZ4u551do6hRp1wrhfPKh0zwMBwmc4YqaMrSGwDmqX4T0j+ZzIODKO8jHw/b6Sv3N+oXvg9YhSn4JDg/rKw3arF1R9kenzvr/5zW1Vpvx9ZGL6KPE90+llNlvS83IwTp75EEq3GS0bb71WS0nGXDo/MToIhJY+D2jUk5/L4vKJkLtlADaT8RHA6bHUoBMGQz/dNnJZoZ3obx+JCo1oueFYNPby2L80rrgLb0nJzlenUQfnwKxphOCr6qdq73EK1DrFSNqf86hCZFbQWOPWC/Dn8iX89v6VDNvpmT3tgff/5z97rTYn8TXjkVzZS88uJGgju8W+wFoeGGSFQz2UFy3xW9YPNgaAmBhyRZXKRVpL1Rivbq2pwF3w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e6db6e-1458-40fc-4c2d-08dafd2eb6b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2023 10:43:50.1782
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h8vr9857neVobJwYfp3Lq0S8/RoywzSy4FqZozAAglr4QkcSLpm3e2SBM2ZM6Ze9Q8pfN6l6JejvDFCcWvdx551EzcSO6/GMzUixfHa7Na8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5676

T24gMjMvMDEvMjAyMyA4OjEyIGFtLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gV2hpbGUgdGhlIHRh
YmxlIGlzIHVzZWQgb25seSB3aGVuIEhWTT15LCB0aGUgdGFibGUgZW50cnkgb2YgY291cnNlIG5l
ZWRzDQo+IHRvIGJlIHByb3Blcmx5IHBvcHVsYXRlZCB3aGVuIGFsc28gUFYzMj15LiBGdWxseSBy
ZW1vdmluZyB0aGUgdGFibGUNCj4gZW50cnkgd2UgdGhlcmVmb3JlIHdyb25nLg0KPg0KPiBGaXhl
czogMTg5NDA0OWZhMjgzICgieDg2L3NoYWRvdzogTDJIIHNoYWRvdyB0eXBlIGlzIFBWMzItb25s
eSIpDQo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0K
RXJtLCB3aHk/DQoNClRoZSBzYWZldHkganVzdGlmaWNhdGlvbiBmb3IgdGhlIG9yaWdpbmFsIHBh
dGNoIHdhcyB0aGF0IHRoaXMgaXMgSFZNDQpvbmx5IGNvZGUuwqAgQW5kIGl0IHJlYWxseSBpcyBI
Vk0gb25seSBjb2RlIC0gaXQncyBnZW51aW5lbHkgY29tcGlsZWQgb3V0DQpmb3IgIUhWTSBidWls
ZHMuDQoNClNvIGlmIHB1dHRpbmcgdGhpcyBlbnRyeSBiYWNrIGluIGZpeGVzIHRoZSByZWdyZXNz
aW9uIE9TU1Rlc3QNCmlkZW50aWZpZWQsIHRoZW4gZWl0aGVyIFNIX3R5cGVfbDJoXzY0X3NoYWRv
dyBpc24ndCBQVjMyLW9ubHksIG9yIHdlDQpoYXZlIFBWIGd1ZXN0cyBlbnRlcmluZyBIVk0tb25s
eSBsb2dpYy7CoCBFaXRoZXIgd2F5LCB0aGUgcHJlY29uZGl0aW9uDQpmb3IgY29ycmVjdG5lc3Mg
b2YgdGhlIG9yaWdpbmFsIHBhdGNoIGlzIHZpb2xhdGVkLCBhbmQgaXQgbmVlZHMNCnJldmVydGlu
ZyBvbiB0aG9zZSBncm91bmRzIGFsb25lLg0KDQp+QW5kcmV3DQo=

