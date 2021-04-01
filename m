Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E32351160
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104200.199012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtCK-0000Kp-OB; Thu, 01 Apr 2021 09:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104200.199012; Thu, 01 Apr 2021 09:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRtCK-0000KQ-Ks; Thu, 01 Apr 2021 09:01:04 +0000
Received: by outflank-mailman (input) for mailman id 104200;
 Thu, 01 Apr 2021 09:01:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRtCJ-0000KL-WD
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:01:04 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 585d9682-affb-4431-863e-9da158275984;
 Thu, 01 Apr 2021 09:01:01 +0000 (UTC)
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
X-Inumbo-ID: 585d9682-affb-4431-863e-9da158275984
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617267661;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=HlDFjEgLUu+h8qOLdpW3m//3hH3Zngbb3AnmDpjWIG0=;
  b=LMJwGS2D2qfKP7H7qEC3HVTJn2mWwbFRaFYb2v5h2tkR/aqJpbJFYbVC
   oJy7P39hm/jatGugTve/PQLvj1C2waEQCh2cTO9Mm3l5ShoKQQTvGv24O
   Ed3XTUB20mgAUHFMIHCIYTNRcW9X5GD5h/Fvq2PNseO0ZTyEFpePi24KL
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WunBr5vtlhzG6tTeZRB7xEZxbL5R2UzpuFrkMdE4jq0Qf6eGfEAYbMAEqqouDnPKGLeCiVe025
 KGUgPg6U+FBFJZ1JIHzpX2DW35XHI9BfqaVAnV6HEl+uulq4I9W1swA1HYUtMnctR4sFJCeojw
 VNHXA8LqKO80XUK538ZV+QmHWTPVYuwEevKRvXGx2uVveKVOM3spyP/075+Rc83E0KJuJ2yxIZ
 11Ay2DMKB4/YYFlhBdqhHmJ63nIDjtZTFLXI89lYJemfPArsHOE5xAVlM/uYQi9U7/XD2aO0Fz
 l14=
X-SBRS: 5.2
X-MesageID: 40531267
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:U1sb5axfQz+ruIVTxDlfKrPxnO4kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnmqJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheTysd07o
 0lSaR3DbTLYGRSpdrm4QW+DtYryMSG9qftvuvF03JxV2hRCp1IxS0RMHf9LmRdQg5aCZ0lUL
 ed/NNAvTq8eXIRB/7LfEUtde7FutHNidbaehYAHREq802jijmv5b78HXGjr2ojehlIxqov9n
 WArhzh6syYwoqG4zL/90uW1ZRZn9P91sBObfbjtuE5Iijh4zzYBrhJdKaFuFkO0YSSwXYs1O
 LBuhIxe/l0gkmhAl2dhTvI903e3C0163nkoGXo8UfLhcDiXjo1B45gqOtiA2LkwnEttt19z6
 5Htljx3/E8bWKi7VbAzuPFWB1wmk2/rWBKq59qs1VlXZYDc7gUlIQD/SpuYeY9NRjn44MqGv
 QGNrC72N9qdzqhHhTkl1gq6tmtUnMvJwyBU0gPt+eEugIm4kxR/g82wtcSkWwH8494Y55Y5/
 7cOqAtr71WSNQKBJgNSNspcI+SMCjgUBjMOGWdLRDOE7wGAWvEr9rS7K8u7O+nVZQUxPIJ6d
 v8eWIdkVR3V1PlCMWI0pEO2AvKWn+BUTPkzdwbz4Rlu5XnLYCbcRGreRQLqY+Nsv8fCsrUV7
 KYI5RNGcLuKmPoBMJgwxD+YZ9PMnMTOfdl++oTaharmIbmO4fqvuvUfLL4P7z2CwspXWv5Hz
 8tRz72CMJc7l26e3PxjRTLMkmdOHDXzNZVKuz37uITwI8COslnqQ4Ok2m04cmNNHljv8UNDQ
 5DCYKitpn+iXi9/G7O4WksEAFaFFxp7LLpVG4PgQcLNkjzYIsSotn3QxEX4FK3YjtEC+/GGg
 9WoFp6vYitKYaL+CwkA9W7dkWXkmUUv3DPa5sHgKWM6YPEd/oDf9gbcZ00MT+OOw1+mA5spm
 sGQhQDXFXjGjTnjrjgqocVCuHZf9xVmxyqPsZQlHLauSyn1IISb0peewTrfd+cgA4oSTYRrE
 Z26bUjjL2JnivqFXEym90iMFpHaH2eBZVPCAjtXvQSppnbPCVLCUuajz2TjB8+Pk7n7V8biG
 DaISqIQv3TGVZGtndE0qHlzUNsegymDjFNQ0E/lbc4OXXNu3513+POXKa13meLQnYpw+0WMl
 j+EHAvCzIr4+ry+A+emT6EG3lj+44nOfbFCq8/N5vJ3Gm2FYGOnaYaPvNd8Zp/LuryuusTXe
 /3QX7SEBrIT8cSnyCFrHcsPyd57EQ+mfTzwRv/8SyW2mU8Dfe6GiURe5grZ/Wnq07qSPaD3M
 8n0ZYbve6sPn7wbdDD46fNdDJHIg7Sp2nzb+xAk+EhgYsC8J9IW7/cWn/08VsC+jMUBsL9jl
 kfT6R2+6qpAP4mQ+UiPwZiumM0n9GOJnYxugP4AuUCbUgg5kWrSu+h0v7tk/4TGUWPqwv7BE
 mH/wBc9/nDWTGf1bRyMdNGHU1mLGw94m9l5uWMasn5DxirbfhK+DOBQzWAWY4YbKiOArMLqB
 lmp/mOgu+MbiL9nCTdpyFyLK4L02GpR6qJcU+xMN8N19yxIlKXhKS2pOa1kTfsUDO+L30iur
 ctTz1YUu1zzh84jIM21SCuSqv45mId+mEung1PpxrKwYip4GDSAEdcFxbW668mBAVuDg==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40531267"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y9WRa342OOHmO8WJh0qcthcu29jAAm7Tu1UMPyAMy9Tfz43lRp9Q/uqgZI28pbQgHrylJRnqawtAsUBpyOYvQ5EpYgRJHrycrxEAykbDojBGqhMxhIaB1Us83GQ2tEyf8E9zGHMwWBzEUG7PbxldHki8mkfMdLQ1gHUqwLQW7z7fZP3joErKD6mx+ef40vkhTnaHuOFyIPmvKkyGgJlO6T05JqyjYwoya28KQqOTpDe5qQ1FgbbL5GPXYCi7fulVPKlyX/L1fBS+V0XScjb6mDV4ISutkYFuMctDm1cv3sF132Fa+ffDh+iCwR+urkPNoeqo1yTiU58kroSnBdrNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEoRPbqbDx09jsw9MPEd1Mx3j080F815Z6eTMvjOSQY=;
 b=GWjjqmateYPbqJBjXZAcvSwofWXudVVqh/p/a/jP1j6fOofDzIbO5b29+DDMwpcM5Z9FS0nujkDbX6JRzOt3gNkCOayPbAZPxRGsOGrY9O72qhKE8migtMPSJZcNUgbxt1cjX8S9KWFBfIuGytacUuDJlCnbirPrg7WDZyy2TCqk1U9eCjBljJWjZsAyE6gLPKVjw7GbL6BFU5f/2h1W6IVEZ4DZYHQWRZ3lahgkSWDMvR9Zx+yHQKP+4VCAnyVAShsk4OErNQuHwYMcAviB9HIg4uk3G1SoPGwtcF/ZNBBRou+a3VhyYrbtiqGAvv2p16kgDC69JeodKz4prpR52A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEoRPbqbDx09jsw9MPEd1Mx3j080F815Z6eTMvjOSQY=;
 b=TdJuzfE7pG48OdXd/WkY2ViiAcVq0gFZNCzaX/KO4yTCet86Urj/YPWeiUhq034GJ20CVND4ZhKFhyjQil7uzJLaqJKRyMwmit9bnJcF0DEewcFx6nRF3qq2enEchVwoldKzaozSnjZA4xricGBBMvEn31ocrB5S38GEjEI6ef0=
Date: Thu, 1 Apr 2021 11:00:53 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
Subject: Revert NR_CPUS=1 fix from 4.15 (was: Re: [PATCH] fix for_each_cpu()
 again for NR_CPUS=1)
Message-ID: <YGWLxey5nZeafUbB@Air-de-Roger>
References: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d993e67-2bdf-9ac3-f78e-daf279642de1@suse.com>
X-ClientProxiedBy: MR2P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1f64f75-558e-43fa-ff53-08d8f4ecaad4
X-MS-TrafficTypeDiagnostic: DM6PR03MB4538:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB4538FE1E52DF1B40AAAEE4048F7B9@DM6PR03MB4538.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xAZhdw78ToqYaOWGPihY51+AJ6h4QRs5UKrqP2S/0awhnLwergxEYz0uSI0hg2IXARXZG91KDPWqUGSdPqN4/08PATKrmfffc1oVbCkAGTnZT7kMh5nEx31e45rmw71yk/aJF+sz1GXWsae/Btlcq+n7zonp08lg1spUxc8JNtSLvAvrJdP1q9P5t8RvJzSk0j8NcH/RFMbLEDVm7WR8N91iQP79TmyawCVgproBdmhNtMGdMGzz8/emkhrdHZHIX3D1J4ajafi7OguMOGl2U13mpePxCaWwPSd99ezfPtEENRtBPypaxtCP+q+wUnmkZzqmKbI9NeL0hllia+Tg0oHvQ5hGAxQ7AEQ4WKg0BjVDVSnyxiiH7Km+Q12selPYeRMGmjnkZqghLIQsSBak4tf5V5WpHxeJu6WZkPh2wO6yYKSuH3yXfXztoPGjiQqu2x+II4xB9iNo6uKplHCVwTrxvCf+FVJOzRE9Gg1OstWKByHgmn3v8ttuugcwpSBFq8bxSAgIeWdAGbeQVJiEycICXJSI6i7XXLW7hYgDBtBde/RDJmdDTv/xQcjJywX8VLQ9LhCVJDQqBJpIOVPZt6zb9svMD4Ad4MZxwc/3EPgqFzpXISI7oHCCp5ToNeraHvfXF0xUXdjzBRpy06fEK3XCgILUpwlp9o/ed4mO+hY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(346002)(39850400004)(136003)(376002)(396003)(38100700001)(33716001)(6666004)(316002)(85182001)(86362001)(9686003)(6496006)(478600001)(66946007)(83380400001)(5660300002)(8676002)(110136005)(66556008)(66476007)(6486002)(2906002)(4326008)(26005)(8936002)(16526019)(54906003)(186003)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0g1dGhpTVRxa2dCSDN0VktkRG16a1Byd3lWR2VSRE5NSzlDMXdrMStqWmk1?=
 =?utf-8?B?OVplaVRCc2k1bXdFS1ZKQUZablNaQ0lXQXQycURWYUU0VlRRcU14KyttTnhC?=
 =?utf-8?B?YlhPSUVhOVJPZVdFdENPY1duZVAxSUQ5bmhPTy9ZTVhvbkZBME41eCtiSmJE?=
 =?utf-8?B?QS9lMGFPS2FPZitHV2VWMEw2YTBOcS9OTkFHUnZ4bDdMT2hWSzhnZVFibDRI?=
 =?utf-8?B?S21kd0VrYjVvR2tIZStJelovMTd1MFptUjJhRk40VTRxVG5naFBiM3BUME5n?=
 =?utf-8?B?VWZIcW9weDJUU2NzMXU3ci8zZ2dDN1kzRmNIcTFsZTJjOGtQMnl6L0ZXYnlh?=
 =?utf-8?B?a2hLOG1iSXBhMklnTzNiK3c2YXJ0U3VGc1RuSmFGNGNtVkc3c1d5TkpuT3Vs?=
 =?utf-8?B?ci9sWG9JblZnZUFkSndvdERGUXAzeGpRWVFHbFJ2eGQxaEVrRHR2bFpBYzlS?=
 =?utf-8?B?VzBNaHYyVGdoUlpQam5Ram5uRWxkbzJwdGIvMFAvbm9RcGpTOWUyMEdydUpj?=
 =?utf-8?B?ejFSZGdjWElORG1MaWZOeFRockw4YnBKRjNiZTg4N3kxNHZlUkV1cklzN2pa?=
 =?utf-8?B?MmpnclFEaWo0Rk42ajFkZ0YrMnI3dHl1dkVLem5FVTJmTDhSVmJQS3hOQXF5?=
 =?utf-8?B?SUJkcG1KN0d5M1EwdURGYzl6ck9tQlBmOTBicEl1U3Z0enJGQXNINTVUb0xh?=
 =?utf-8?B?MS9YeXNodDdBN3VETTEyN3JEOUhKeE1MMEdGcW4xY1RLdG5SYUI3SVBvSVRD?=
 =?utf-8?B?c1JHSGpoR1plTndkUVlZU3doNXJQV3h4anR6ajRXV0pWWnlCY2FsQlJYZUtY?=
 =?utf-8?B?aGZwdWJMbk9UWHNBUG9jcStWUzEvcDNVY3ZHd0tnU0VySHZ0UEdZd2V5N1dt?=
 =?utf-8?B?MHVhbVFLSUIyblZzQzBYUHhBOThkTzd4TXJyTWR4VUQvRE9YelBzNW1CTzBW?=
 =?utf-8?B?TEl4c1ZNSXlxQ1RMMVlZY1Job1Vnai96Z1hsQVFqeUQzQlhZZW5tbXJYZU9Y?=
 =?utf-8?B?eVJnRHhFMWcwUnEvS2l6bWRhTktpSGgyZWtVTTRFUk4rWmlvMCtSMDBiMTA4?=
 =?utf-8?B?ZmVwQzdmSkJrRW9RZ0w5SElQZUdzeFRubytOQlBHZzR2a0dIUFJPY2ZUTnJz?=
 =?utf-8?B?dDMvdjFjT0VRWWJPVm5yN2UxM0dIbW42b3dyejNxelJHd21ZQ2dLZmpXVmlX?=
 =?utf-8?B?SnA3WUhZZ0gvZUQvbFVmT245NFpTa1ZyekNyWkFPSTdiV2ZhRDNZTzg2NGZH?=
 =?utf-8?B?T0JXWlB1YzRZNmtCaUc3WXJGNUpaNXAyVk5WZlpoS1F6aXlJdCtqMmpDOU9x?=
 =?utf-8?B?d3hDd01aOVhVVGZMODdTK3F4V3JoMUtacWtWWUZmdGFtWlN3MENMdi9yMmZN?=
 =?utf-8?B?eW45K25ESEF1Vkt3VldUUVp2dWY2KzZsMXN0WEZiM1NuM3VjZ3Z2UUVack1G?=
 =?utf-8?B?T3c0alZMZDl0eXMvckZtVU56OG5xQ1F2d2NnN1NWZ1gxalY3UVROWGl1R2xT?=
 =?utf-8?B?U1BySlV3Q1g4MUV1cUkxeHd1V3ZWc0pZaXBzNGJqeURIVzl4SUhqOU0rYysx?=
 =?utf-8?B?RDlLejZpVVUzeVNXQnlLb3JjbTkzcFE3WFg5WHpjQ0RHYm91Q1BYejNuRGpR?=
 =?utf-8?B?ajVtTjFFYzF1WTA4QW9TdXhVbUNlVm93Nk9pWUswdzNUK2s1ZDZoZi9QRDBn?=
 =?utf-8?B?WUVsdmloUXA0T0ExMnc2YktkcHhFOUNseW1RMGxCQmpMNkdxZUZpMkEwQU9Q?=
 =?utf-8?B?Z0VGY05id0haZlBhSGYwMnV0clhtSlloK3RhanQzeXlPUWFQelp0UlI3c1hP?=
 =?utf-8?B?aVdYb3JQWFhia2ZnQ0hZZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1f64f75-558e-43fa-ff53-08d8f4ecaad4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 09:00:59.0381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irR5BWMV1MAGTGMAjC4dBq2L/iwzkzt7dOxaWrcodD4xVTADuFkxbmwiXiLaZxXoOgJ3M85smjdz3QGGzPAXHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4538
X-OriginatorOrg: citrix.com

On Wed, Mar 31, 2021 at 04:52:47PM +0200, Jan Beulich wrote:
> Unfortunately aa50f45332f1 ("xen: fix for_each_cpu when NR_CPUS=1") has
> caused quite a bit of fallout with gcc10, e.g. (there are at least two
> more similar ones, and I didn't bother trying to find them all):
> 
> In file included from .../xen/include/xen/config.h:13,
>                  from <command-line>:
> core_parking.c: In function ‘core_parking_power’:
> .../xen/include/asm/percpu.h:12:51: error: array subscript 1 is above array bounds of ‘long unsigned int[1]’ [-Werror=array-bounds]
>    12 |     (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
> .../xen/include/xen/compiler.h:141:29: note: in definition of macro ‘RELOC_HIDE’
>   141 |     (typeof(ptr)) (__ptr + (off)); })
>       |                             ^~~
> core_parking.c:133:39: note: in expansion of macro ‘per_cpu’
>   133 |             core_tmp = cpumask_weight(per_cpu(cpu_core_mask, cpu));
>       |                                       ^~~~~~~
> In file included from .../xen/include/xen/percpu.h:4,
>                  from .../xen/include/asm/msr.h:7,
>                  from .../xen/include/asm/time.h:5,
>                  from .../xen/include/xen/time.h:76,
>                  from .../xen/include/xen/spinlock.h:4,
>                  from .../xen/include/xen/cpu.h:5,
>                  from core_parking.c:19:
> .../xen/include/asm/percpu.h:6:22: note: while referencing ‘__per_cpu_offset’
>     6 | extern unsigned long __per_cpu_offset[NR_CPUS];
>       |                      ^~~~~~~~~~~~~~~~

At this point, should be consider reverting the original fix from the
4.15 branch, so that we don't release something that's build broken
with gcc 10?

Roger.

