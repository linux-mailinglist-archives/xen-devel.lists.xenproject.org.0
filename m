Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE534D14F0
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 11:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286719.486343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXFo-0007BI-I9; Tue, 08 Mar 2022 10:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286719.486343; Tue, 08 Mar 2022 10:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRXFo-00079I-DU; Tue, 08 Mar 2022 10:39:44 +0000
Received: by outflank-mailman (input) for mailman id 286719;
 Tue, 08 Mar 2022 10:39:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRXFn-00079C-73
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 10:39:43 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0e8ec03f-9ecc-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 11:39:41 +0100 (CET)
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
X-Inumbo-ID: 0e8ec03f-9ecc-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646735980;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7FNqC9YgdHBJSL47zKSLDnG/rEX0sORicm1feb5usp0=;
  b=UljzKr7W8MfVbdJGWf3RdG9BzDMNZcm3ujVJH/4EpJxCzxOfqQB3EbIp
   dhSX9lANobzOjFDTqAzIbJYEbWTX67dz0BaMi1LjKyqYTi4WcyNMFXLBT
   /aftb+uPe5ILYnTZ4m1SRvcv8fu3T9h6bsIe/QlbcRR/tzh65NDu7aWIG
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65689087
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:V40ChqIb2tfHMl2lFE+RZJUlxSXFcZb7ZxGr2PjKsXjdYENShmFTz
 TMaCzqGM/fZNmDzetlwYN+y9EkDv5PSzdcyHgFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh2dY42YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MlAj7aeeSAMAoPjkfxMekBJK2ZMA7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glt2JAfRaaBD
 yYfQSVOXA2fcxcTAFc0DJskvc6aqj7gUiIN/Tp5ooJoujOOnWSdyoPFDt3RfdCbQNRPqWyRr
 GnG4mfRDwkTMZqUzj/t2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IBcbT0ehqP+1zEu3QctCK
 lc88zAr66M18SSDTdTjXhv+vH+NuDYdXcZdF6sx7wTl4qjJ5UCfD2sNTD9EYfQnstM7QXoh0
 Vrht8ztLSxitvuSU3313qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8adjNLvHirr6
 yuXtyV4jLIW5eYJyqG68Fbvkz+q4J/TQWYd5A/aQ2ak5QNRf5O+asqj7l2z0BpbBN/HFB/b5
 iFCwpXAqrBVZX2QqMCTaPkAJpuH19GgDBPziEY+NsAwz3OfxWH2KOi8/wpCDEtuN88Ffxrgb
 0nSpR5d6fdvAZe6UUNkS9nvUpp3lMAMAfygD6mJNYQWPvCdYSfapHkGWKKG44z6fKHAe4kbM
 IzTT8ujBG1y5U9PnGvvHLd1PVPGK0kDKYLvqXLTkkzPPVm2Pif9pVI53L2mNLhRAESs+lm9z
 jqnH5HWoyizqcWnCsUtzaYdLEoRMV8wDo3spspce4are1Q6Rj9+W6KKmON8IOSJepi5cM+Sp
 RlRvWcClDLCaYDvc13WOhiPlpu1NXqAkZ7LFXN1Zgv5s5TSSY2u8L0eZ/MKkUoPr4ReIQpPZ
 6BdIa2oW60XIhyeomh1RcSt/eRKKUXw7SrTbnXNXdTKV8M5L+A/0oS/JVWHGehnJnffiPbSV
 JX8jlOLG8RSHV8+ZCsUAdr2p26MUbEmsLsad2PDI8VJeVWq945vKifrieQwLd1KIhLGrgZ2H
 S7PafvEjYEhe7MIzeQ=
IronPort-HdrOrdr: A9a23:z1auAquHiBP5bXCcZBTU1HLM7skC74Mji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJhBo7G90KnpewK6yXdQ2/hqAV7EZniahILIFvAY0WKG+VPd8kLFh4xgPM
 tbAs1D4ZjLfCRHZKXBkXiF+rQbsaC6GcmT7I+0pRcdLj2CKZsQlzuRYjzrbHGeLzM2Y6bReq
 Dsgvau8FGbCAsqh4mAdzI4t6+pnay/qLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD39jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU411rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAx875xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwttrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGXgoBW+q3tYp0PJGbEfqBb0fblkQS+3UoJg3fw/fZv30vpr/kGOtx5D+
 etCNUeqFgBdL5TUUtHPpZzfSKGMB28ffvyChPhHb3GLtBPB5ufke++3F0KjNvaDKDgiqFC36
 j8bA==
X-IronPort-AV: E=Sophos;i="5.90,164,1643691600"; 
   d="scan'208";a="65689087"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiR4YKSYdBlN2lSKEbhojvOZe9N1zkt8SiAGbNhmPH0XkzepGl3dR3v7ptZugeha5LqbESb2e65kWzucpklhUy1lQTP9lg809VWVnFYbXTO4AHGz4MHIj0w+hJAs5+2G5PrSk3wpQTPNYxWUvAz17wMnwqVNC+3wM4SzUf8NCppmk2FhRU+WTuKvuSkvMMw40JiOhNttoryCw/tQ7B78hYzPA2lQszjKCQiAS9OZcZ4IJkaLtDREo1l8go/6Yma9CS4DT4xF9T9HBfWmyWDUSgPC+/D6R9cnd+9Dkz8zK0LJoH4e6DXQxGfuNbm0OP5Ww92qb/2VQoWOLy74CwGF6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+u/LQalv17r8oTRQP/N+TtOdRRNANO2jTiov4VmaSg=;
 b=FTWFBV49UwuBkzTQKIjD1SSxJPggEOAWZX7t97MzG82NlcR+2HiNizuQp3jBiEVCYbYhTtInrw9th8LNM4IEg7DxF0iovMW8Ac55c2No115GJoLmqJAF2PFiO6EQoFbYJNeufviUbUs7pGc5wstVTbRUz1SzjJUo6QMyGEqbazdRrBmXBw5FUgvGROFNcf/BBDtnD3Y3DfAOKcrhxqUrScByTV5ozYRLCVPYjkUeSTaKETS2lCt8sXaloW5p0TQ4dI309SxygwIg31Nqu2FxUzSnQ6aaRVzWRPvs8n4+0BllF3hceFQYmnhtFaJahHlnxo1EBHYqBsrm9wfGjWg7PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+u/LQalv17r8oTRQP/N+TtOdRRNANO2jTiov4VmaSg=;
 b=MPKxei4KqZJ+aKTTyhIkMrYCwlKkCS2loshijX5WiB2Iz46cp1aaf/3S89gfPloJVwVTVQThVi8jHFIr/u9Ql0MLLy6pYr4I+ZCzR8vDv7lxdUWECXNIzhJQBAj7WmcIxYNzw1F0m74No8GSfzGSSs123TO9NslfMJSzQ4wsj1M=
Date: Tue, 8 Mar 2022 11:39:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <jane.malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: Re: [PATCH v5 1/2] xen+tools: Report Interrupt Controller
 Virtualization capabilities on x86
Message-ID: <YicyXwIYIUdAI8ID@Air-de-Roger>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-2-jane.malalane@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220307150609.10662-2-jane.malalane@citrix.com>
X-ClientProxiedBy: LO4P123CA0013.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c327e4d8-9a44-42a5-77dc-08da00efee9a
X-MS-TrafficTypeDiagnostic: CY4PR03MB2837:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <CY4PR03MB2837C474384CACD9ED7321E88F099@CY4PR03MB2837.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J30v1G4alQDHN5K9ggQZ74HOEA5U+6uGa4Jc4P5dcAnaBB3pOHPMgu7tCyoRppqDiKAhqRNopb9+ZRzXwnjSt/zSSykYAfATHXdjFpw7IKM1V845QinlcAxf563HxAA7UfgvDqhAmm1APO71BEzRoC5AZOY5V7z02qXmdA3FTWaHhBLW7Vdh3X9hkYH92stxWrTzq0aA005FV9uOGBYFFxLR/9LUrWASvkGIgxoBxnIF7FZCJbamvl4j0G3EVyw0sxtAMSolnF1UxI7rfCQ0h3+lDa9aQlAuRV9X6vxQNCJhuKKXdv6CCHfZhKHdTiaR+7Yzgymw+z8m2gIR2He77pa5cX+d8aHOi97r3OmH/x7PpH70qJccQqaucIdBOjJj6gfGRdKP+Co1fFxdMUippJWohDKrqZ8NcVyeoXZRSxenUePrxzF0K1G/qJYwWA6aTCDTGlakAMslQ5saGZPWBtuB6VIN7yehkyGFObnvxHHgAQsEi7YvK38QNsPBenlijt0mhTSyfz4sj1pWIxjyq1hPPe1IlxrI1BOYvzYRiSQljMbrJwCDYbBURo78Ew73CJ6l8KValusvHuWfw14s3hEfxAVIf6/LM7WWlzYxAE194rAHvjgltTm0sZOILfxPpXTZ6V4E1D466PWymnRGSglo6F39YWqj5U/2C3knR+3RGihq6FeLFE+MQKPOIdeG67J9IErufEST72tjUg5ISA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(5660300002)(6862004)(8676002)(66476007)(66556008)(66946007)(2906002)(4326008)(30864003)(85182001)(8936002)(6636002)(316002)(7416002)(54906003)(38100700002)(186003)(86362001)(508600001)(6486002)(33716001)(82960400001)(6512007)(6666004)(9686003)(6506007)(26005)(83380400001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NEpDSWo5YkZLVGx4c080cGhpTmNjbXNvcGUwZGxyMHA1UDJ1bmhFZDJaSk1W?=
 =?utf-8?B?TndSalZlYmlvQmNIbUluaFpRc3Z4cTZnbHV0R1NUTFU4VmJySm9pUGoxZ1BE?=
 =?utf-8?B?UjU4alBXb2RXQkJuRGQ3ZXMrTUpjWnRHN2NUSjZWVEd6N0R6ZXJqdWg0amE5?=
 =?utf-8?B?cWFlcjJWYWN6bDZWbmVkQmtzaWhlODRBN2UyeVN0SXU3cDR5NVRNc1JheDZi?=
 =?utf-8?B?RUZCUzgwclJmWG9uRWNSdVVXOXFhYnloSjB1QnZTM2hxSGliZW5QeVVhbHZX?=
 =?utf-8?B?azlJWm9nWkxXRzFpaTBybStjYmFUMFI1aEZTQTd0RldlcElIVDY5elQrQzYw?=
 =?utf-8?B?YTVzck5EbEc5VEpSNW5SdDlzQyttM2prbFI0ZGF6T0Z6THBwL25oUnZETVpa?=
 =?utf-8?B?ZHZGWUFWeGhLRU9NZit5VTZYTUV3SGZaa0tTdXh0OVg4NWZQNEUrT1hoenQ2?=
 =?utf-8?B?bG82SFU0L2hsVmNDT0srUDhrM2dlS0tHNHdqL0RpbXNKRFNaZ1VRQzVDU0xQ?=
 =?utf-8?B?QlVNUkREYzNtaU9UWXcrSVM5MWxEWDRKQ2NxZCt6UkwwYTJqL2tPS0FFdm9N?=
 =?utf-8?B?by9TU01OOW5iVENmdVdzbkIxajlXMUMzK2FtU2VEaWpMd05ZVk0xanprUHB4?=
 =?utf-8?B?cFp4VFh3OWdwMGk4SFkweFdBeFNMcGo2Rm5QREF6WWJMYzhPbDlydVJsaExv?=
 =?utf-8?B?QXVkRTNHcFFxL2lVYjFqMkdGNGtGQnlXUVpPemxDOGR4alh3MzJNTFZ5Rm5w?=
 =?utf-8?B?L3dQelFJMllyTmxlTTlOWGlLRW9HZmtRV2pkTzBXR1FIQWd3QXdKNi9jbzRD?=
 =?utf-8?B?NFQ3dDA0WVFJYmxMNjc0RjA1WTBSV2NXQUxIZWQ3OWt1dlNwSWw0M0c3UE1R?=
 =?utf-8?B?WnhwTUZGc3JNUklXQjk2S3dEY2YxRWgyRzlNbFBYVlQ4ajlRNXd6dHY1KzRD?=
 =?utf-8?B?bE03cEhIR291bW05dTkxRi9rUmcrQlpvMlp5a1RLY2dEMEJMRTZQSHYxdFUv?=
 =?utf-8?B?NDFWR2NZOHNNSm9uZUhiYmorbWJ6UzFSR1VGV1Zsa0diYld4c0ZvYS91dTlV?=
 =?utf-8?B?L0J3QnN5Uk45WlloZHF3YzUxZ0ljKzY0TS9LTThnOUVyMDRNRnZTY05oZlVW?=
 =?utf-8?B?bllnSzJOZFJPTjZLZ2VkdDlOUWFMMnRDdEFsSnl4b1NrQmJxME5FaWgwaTNS?=
 =?utf-8?B?WGZGUjM2TGZRMEVuVmU0eEQ3V1dEYmsxcFVHdDhmQTFmNXdCUXR5bXpLbHZE?=
 =?utf-8?B?WjlEckR6dm9OUmYxNE51TkhaUWFLM01oYmVLSWVPMU1kN2ROOEZBSlk1c0pR?=
 =?utf-8?B?akRTamVLQUtKSzgra3gzcnJUN1VoeDVVemNPMmZIZlozdnBQU05CdVRaMGlF?=
 =?utf-8?B?dlNib3FYckJDdVd4L1hVS1JORTZwUlUrRnhEZm5YYXY5cVdFTkE4N1Jua0oz?=
 =?utf-8?B?cVo0Y1dqbnJpM21OdFVqOFM2WTgwdGVrZkh5SUhsQyt2NWNaYmp2alUydFBj?=
 =?utf-8?B?cHF1cXBHdXBHdHpEOEdmQkdjYmRmeDVCY2V1cG1DMGVlZksranVkNXFuTCt4?=
 =?utf-8?B?UWt2MWJ3a01uUUEwM3BlL1BJT0JuK3g4cmV5b0NOS0J2aVIzMnlBTDc0ODY1?=
 =?utf-8?B?dVdlOUlWWlh2dG56Q0NyMXBBeHN2dkFiR2V3YlRFdXd6ZlZoNWJKY1JhR3Vp?=
 =?utf-8?B?ejRmTW1zRi9TSEdtNXoxdkxXUUoyRlR5aVdGLzdCNmEyODRPWmR2bHdwS0Zk?=
 =?utf-8?B?Y0RyUE5pS2FMQjdKM293V0NYN3NLRUJ4bGRrTndKZzU4UU8rU2ZMSWRISTM3?=
 =?utf-8?B?S2NTZ3R4ZTVnMmhselIvWkpQaWpMem1MdU4wQzJNd2FBMjNKSnF6R1NzcTFh?=
 =?utf-8?B?TzB4RG9UTzMveXRqZU9hNUVkQ3dSYlMvdllUYzVwT3RjazhnUkU2K0ZxSjU5?=
 =?utf-8?B?Vlhvd09EcTdVSTBXcTZtSTdZOXErNTB4cCtQd1pEN3JsTExIaEY4SUNEeWFY?=
 =?utf-8?B?RnltU05SSS84RnA1R2hYVjd3SWxYWjRFRW9ENDR6Z05JRU96QjUxQmp2bEdi?=
 =?utf-8?B?c2lJdWVkRUZhMWdWcnlTWmNleDhJY1h2Y0NvdURRRkNWdFVDOFhNUjkwVGs2?=
 =?utf-8?B?TlJ6N1NxbzQ0WGhkMnMwNHU2VGl0dEZreEg4NjhrNXFyVVRsMTZoelRsQzIx?=
 =?utf-8?Q?lhe1HSjZqINWqc1lAPs3ncY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c327e4d8-9a44-42a5-77dc-08da00efee9a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 10:39:32.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gOqbN0dULcA3OCOM99tIF+YFvlNbtFyrOmvilL84I397+4wNUNm9WZ3om/qFCQ5RbBIGw2QwWUKGfcC19gx4ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB2837
X-OriginatorOrg: citrix.com

On Mon, Mar 07, 2022 at 03:06:08PM +0000, Jane Malalane wrote:
> Add XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_xapic and
> XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_x2apic to report accelerated xapic
> and x2apic, on x86 hardware.

I think the commit message has gone out of sync with the code, those
should now be XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X{2,}APIC

> No such features are currently implemented on AMD hardware.
> 
> HW assisted xAPIC virtualization will be reported if HW, at the
> minimum, supports virtualize_apic_accesses as this feature alone means
> that an access to the APIC page will cause an APIC-access VM exit. An
> APIC-access VM exit provides a VMM with information about the access
> causing the VM exit, unlike a regular EPT fault, thus simplifying some
> internal handling.
> 
> HW assisted x2APIC virtualization will be reported if HW supports
> virtualize_x2apic_mode and, at least, either apic_reg_virt or
> virtual_intr_delivery. This is due to apic_reg_virt and
> virtual_intr_delivery preventing a VM exit from occuring or at least
> replacing a regular EPT fault VM-exit with an APIC-access VM-exit on

For x2APIC there's no EPT fault, because x2APIC accesses are in the
MSR space. I think you can omit this whole sentence and just mention
that this now follows the conditionals in vmx_vlapic_msr_changed.

> read and write APIC accesses, respectively. This also means that
> sysctl follows the conditionals in vmx_vlapic_msr_changed().
> 
> For that purpose, also add an arch-specific "capabilities" parameter
> to struct xen_sysctl_physinfo.
> 
> Note that this interface is intended to be compatible with AMD so that
> AVIC support can be introduced in a future patch. Unlike Intel that
> has multiple controls for APIC Virtualization, AMD has one global
> 'AVIC Enable' control bit, so fine-graining of APIC virtualization
> control cannot be done on a common interface.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Jun Nakajima <jun.nakajima@intel.com>
> CC: Kevin Tian <kevin.tian@intel.com>
> CC: "Roger Pau Monné" <roger.pau@citrix.com>
> 
> v5:
> * Have assisted_xapic_available solely depend on
>   cpu_has_vmx_virtualize_apic_accesses and assisted_x2apic_available
>   depend on cpu_has_vmx_virtualize_x2apic_mode and
>   cpu_has_vmx_apic_reg_virt OR cpu_has_vmx_virtual_intr_delivery.
> 
> v4:
>  * Fallback to the original v2/v1 conditions for setting
>    assisted_xapic_available and assisted_x2apic_available so that in
>    the future APIC virtualization can be exposed on AMD hardware
>    since fine-graining of "AVIC" is not supported, i.e., AMD solely
>    uses "AVIC Enable". This also means that sysctl mimics what's
>    exposed in CPUID.
> 
> v3:
>  * Define XEN_SYSCTL_PHYSCAP_ARCH_MAX for ABI checking and actually
>    set "arch_capbilities", via a call to c_bitmap_to_ocaml_list()
>  * Have assisted_x2apic_available only depend on
>    cpu_has_vmx_virtualize_x2apic_mode
> 
> v2:
>  * Use one macro LIBXL_HAVE_PHYSINFO_ASSISTED_APIC instead of two
>  * Pass xcpyshinfo as a pointer in libxl__arch_get_physinfo
>  * Set assisted_x{2}apic_available to be conditional upon "bsp" and
>    annotate it with __ro_after_init
>  * Change XEN_SYSCTL_PHYSCAP_ARCH_ASSISTED_X{2}APIC to
>    _X86_ASSISTED_X{2}APIC
>  * Keep XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X{2}APIC contained within
>    sysctl.h
>  * Fix padding introduced in struct xen_sysctl_physinfo and bump
>    XEN_SYSCTL_INTERFACE_VERSION
> ---
>  tools/golang/xenlight/helpers.gen.go |  4 ++++
>  tools/golang/xenlight/types.gen.go   |  2 ++
>  tools/include/libxl.h                |  7 +++++++
>  tools/libs/light/libxl.c             |  3 +++
>  tools/libs/light/libxl_arch.h        |  4 ++++
>  tools/libs/light/libxl_arm.c         |  5 +++++
>  tools/libs/light/libxl_types.idl     |  2 ++
>  tools/libs/light/libxl_x86.c         | 11 +++++++++++
>  tools/ocaml/libs/xc/xenctrl.ml       |  5 +++++
>  tools/ocaml/libs/xc/xenctrl.mli      |  5 +++++
>  tools/ocaml/libs/xc/xenctrl_stubs.c  | 14 +++++++++++---
>  tools/xl/xl_info.c                   |  6 ++++--
>  xen/arch/x86/hvm/vmx/vmcs.c          |  9 +++++++++
>  xen/arch/x86/include/asm/domain.h    |  3 +++
>  xen/arch/x86/sysctl.c                |  7 +++++++
>  xen/include/public/sysctl.h          | 11 ++++++++++-
>  16 files changed, 92 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/golang/xenlight/helpers.gen.go b/tools/golang/xenlight/helpers.gen.go
> index b746ff1081..dd4e6c9f14 100644
> --- a/tools/golang/xenlight/helpers.gen.go
> +++ b/tools/golang/xenlight/helpers.gen.go
> @@ -3373,6 +3373,8 @@ x.CapVmtrace = bool(xc.cap_vmtrace)
>  x.CapVpmu = bool(xc.cap_vpmu)
>  x.CapGnttabV1 = bool(xc.cap_gnttab_v1)
>  x.CapGnttabV2 = bool(xc.cap_gnttab_v2)
> +x.CapAssistedXapic = bool(xc.cap_assisted_xapic)
> +x.CapAssistedX2Apic = bool(xc.cap_assisted_x2apic)
>  
>   return nil}
>  
> @@ -3407,6 +3409,8 @@ xc.cap_vmtrace = C.bool(x.CapVmtrace)
>  xc.cap_vpmu = C.bool(x.CapVpmu)
>  xc.cap_gnttab_v1 = C.bool(x.CapGnttabV1)
>  xc.cap_gnttab_v2 = C.bool(x.CapGnttabV2)
> +xc.cap_assisted_xapic = C.bool(x.CapAssistedXapic)
> +xc.cap_assisted_x2apic = C.bool(x.CapAssistedX2Apic)
>  
>   return nil
>   }
> diff --git a/tools/golang/xenlight/types.gen.go b/tools/golang/xenlight/types.gen.go
> index b1e84d5258..87be46c745 100644
> --- a/tools/golang/xenlight/types.gen.go
> +++ b/tools/golang/xenlight/types.gen.go
> @@ -1014,6 +1014,8 @@ CapVmtrace bool
>  CapVpmu bool
>  CapGnttabV1 bool
>  CapGnttabV2 bool
> +CapAssistedXapic bool
> +CapAssistedX2Apic bool
>  }
>  
>  type Connectorinfo struct {
> diff --git a/tools/include/libxl.h b/tools/include/libxl.h
> index 51a9b6cfac..94e6355822 100644
> --- a/tools/include/libxl.h
> +++ b/tools/include/libxl.h
> @@ -528,6 +528,13 @@
>  #define LIBXL_HAVE_MAX_GRANT_VERSION 1
>  
>  /*
> + * LIBXL_HAVE_PHYSINFO_ASSISTED_APIC indicates that libxl_physinfo has
> + * cap_assisted_xapic and cap_assisted_x2apic fields, which indicates
> + * the availability of x{2}APIC hardware assisted virtualization.
> + */
> +#define LIBXL_HAVE_PHYSINFO_ASSISTED_APIC 1
> +
> +/*
>   * libxl ABI compatibility
>   *
>   * The only guarantee which libxl makes regarding ABI compatibility
> diff --git a/tools/libs/light/libxl.c b/tools/libs/light/libxl.c
> index a0bf7d186f..6d699951e2 100644
> --- a/tools/libs/light/libxl.c
> +++ b/tools/libs/light/libxl.c
> @@ -15,6 +15,7 @@
>  #include "libxl_osdeps.h"
>  
>  #include "libxl_internal.h"
> +#include "libxl_arch.h"
>  
>  int libxl_ctx_alloc(libxl_ctx **pctx, int version,
>                      unsigned flags, xentoollog_logger * lg)
> @@ -410,6 +411,8 @@ int libxl_get_physinfo(libxl_ctx *ctx, libxl_physinfo *physinfo)
>      physinfo->cap_gnttab_v2 =
>          !!(xcphysinfo.capabilities & XEN_SYSCTL_PHYSCAP_gnttab_v2);
>  
> +    libxl__arch_get_physinfo(physinfo, &xcphysinfo);
> +
>      GC_FREE;
>      return 0;
>  }
> diff --git a/tools/libs/light/libxl_arch.h b/tools/libs/light/libxl_arch.h
> index 1522ecb97f..207ceac6a1 100644
> --- a/tools/libs/light/libxl_arch.h
> +++ b/tools/libs/light/libxl_arch.h
> @@ -86,6 +86,10 @@ int libxl__arch_extra_memory(libxl__gc *gc,
>                               uint64_t *out);
>  
>  _hidden
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              const xc_physinfo_t *xcphysinfo);
> +
> +_hidden
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src);
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de0939..39fdca1b49 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1431,6 +1431,11 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              const xc_physinfo_t *xcphysinfo)
> +{
> +}
> +
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src)
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
> index 2a42da2f7d..42ac6c357b 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -1068,6 +1068,8 @@ libxl_physinfo = Struct("physinfo", [
>      ("cap_vpmu", bool),
>      ("cap_gnttab_v1", bool),
>      ("cap_gnttab_v2", bool),
> +    ("cap_assisted_xapic", bool),
> +    ("cap_assisted_x2apic", bool),
>      ], dir=DIR_OUT)
>  
>  libxl_connectorinfo = Struct("connectorinfo", [
> diff --git a/tools/libs/light/libxl_x86.c b/tools/libs/light/libxl_x86.c
> index 1feadebb18..e0a06ecfe3 100644
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -866,6 +866,17 @@ int libxl__arch_passthrough_mode_setdefault(libxl__gc *gc,
>      return rc;
>  }
>  
> +void libxl__arch_get_physinfo(libxl_physinfo *physinfo,
> +                              const xc_physinfo_t *xcphysinfo)
> +{
> +    physinfo->cap_assisted_xapic =
> +        !!(xcphysinfo->arch_capabilities &
> +           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_XAPIC);
> +    physinfo->cap_assisted_x2apic =
> +        !!(xcphysinfo->arch_capabilities &
> +           XEN_SYSCTL_PHYSCAP_X86_ASSISTED_X2APIC);
> +}
> +
>  void libxl__arch_update_domain_config(libxl__gc *gc,
>                                        libxl_domain_config *dst,
>                                        const libxl_domain_config *src)
> diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
> index 7503031d8f..21783d3622 100644
> --- a/tools/ocaml/libs/xc/xenctrl.ml
> +++ b/tools/ocaml/libs/xc/xenctrl.ml
> @@ -127,6 +127,10 @@ type physinfo_cap_flag =
>  	| CAP_Gnttab_v1
>  	| CAP_Gnttab_v2
>  
> +type physinfo_arch_cap_flag =
> +	| CAP_X86_ASSISTED_XAPIC
> +	| CAP_X86_ASSISTED_X2APIC
> +
>  type physinfo =
>  {
>  	threads_per_core : int;
> @@ -139,6 +143,7 @@ type physinfo =
>  	scrub_pages      : nativeint;
>  	(* XXX hw_cap *)
>  	capabilities     : physinfo_cap_flag list;
> +	arch_capabilities : physinfo_arch_cap_flag list;
>  	max_nr_cpus      : int;
>  }
>  
> diff --git a/tools/ocaml/libs/xc/xenctrl.mli b/tools/ocaml/libs/xc/xenctrl.mli
> index d1d9c9247a..af6ba3d1a0 100644
> --- a/tools/ocaml/libs/xc/xenctrl.mli
> +++ b/tools/ocaml/libs/xc/xenctrl.mli
> @@ -112,6 +112,10 @@ type physinfo_cap_flag =
>    | CAP_Gnttab_v1
>    | CAP_Gnttab_v2
>  
> +type physinfo_arch_cap_flag =
> +  | CAP_X86_ASSISTED_XAPIC
> +  | CAP_X86_ASSISTED_X2APIC
> +
>  type physinfo = {
>    threads_per_core : int;
>    cores_per_socket : int;
> @@ -122,6 +126,7 @@ type physinfo = {
>    free_pages       : nativeint;
>    scrub_pages      : nativeint;
>    capabilities     : physinfo_cap_flag list;
> +  arch_capabilities : physinfo_arch_cap_flag list;
>    max_nr_cpus      : int; (** compile-time max possible number of nr_cpus *)
>  }
>  type version = { major : int; minor : int; extra : string; }
> diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
> index 5b4fe72c8d..e0d49b18d2 100644
> --- a/tools/ocaml/libs/xc/xenctrl_stubs.c
> +++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
> @@ -712,7 +712,7 @@ CAMLprim value stub_xc_send_debug_keys(value xch, value keys)
>  CAMLprim value stub_xc_physinfo(value xch)
>  {
>  	CAMLparam1(xch);
> -	CAMLlocal2(physinfo, cap_list);
> +	CAMLlocal3(physinfo, cap_list, arch_cap_list);
>  	xc_physinfo_t c_physinfo;
>  	int r;
>  
> @@ -730,8 +730,15 @@ CAMLprim value stub_xc_physinfo(value xch)
>  		/* ! physinfo_cap_flag CAP_ lc */
>  		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_MAX max */
>  		(c_physinfo.capabilities);
> +	/*
> +	 * arch_capabilities: physinfo_arch_cap_flag list;
> +	 */
> +	arch_cap_list = c_bitmap_to_ocaml_list
> +		/* ! physinfo_arch_cap_flag CAP_ none */
> +		/* ! XEN_SYSCTL_PHYSCAP_ XEN_SYSCTL_PHYSCAP_X86_MAX max */
> +		(c_physinfo.arch_capabilities);

Note the above is likely to need adjusting if Arm (or other arches)
start using arch_capabilities. Could we make this conditional to
CONFIG_X86 being enabled?

>  
> -	physinfo = caml_alloc_tuple(10);
> +	physinfo = caml_alloc_tuple(11);
>  	Store_field(physinfo, 0, Val_int(c_physinfo.threads_per_core));
>  	Store_field(physinfo, 1, Val_int(c_physinfo.cores_per_socket));
>  	Store_field(physinfo, 2, Val_int(c_physinfo.nr_cpus));
> @@ -741,7 +748,8 @@ CAMLprim value stub_xc_physinfo(value xch)
>  	Store_field(physinfo, 6, caml_copy_nativeint(c_physinfo.free_pages));
>  	Store_field(physinfo, 7, caml_copy_nativeint(c_physinfo.scrub_pages));
>  	Store_field(physinfo, 8, cap_list);
> -	Store_field(physinfo, 9, Val_int(c_physinfo.max_cpu_id + 1));
> +	Store_field(physinfo, 9, arch_cap_list);
> +	Store_field(physinfo, 10, Val_int(c_physinfo.max_cpu_id + 1));
>  
>  	CAMLreturn(physinfo);
>  }
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index 712b7638b0..3205270754 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -210,7 +210,7 @@ static void output_physinfo(void)
>           info.hw_cap[4], info.hw_cap[5], info.hw_cap[6], info.hw_cap[7]
>          );
>  
> -    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s\n",
> +    maybe_printf("virt_caps              :%s%s%s%s%s%s%s%s%s%s%s%s%s\n",
>           info.cap_pv ? " pv" : "",
>           info.cap_hvm ? " hvm" : "",
>           info.cap_hvm && info.cap_hvm_directio ? " hvm_directio" : "",
> @@ -221,7 +221,9 @@ static void output_physinfo(void)
>           info.cap_vmtrace ? " vmtrace" : "",
>           info.cap_vpmu ? " vpmu" : "",
>           info.cap_gnttab_v1 ? " gnttab-v1" : "",
> -         info.cap_gnttab_v2 ? " gnttab-v2" : ""
> +         info.cap_gnttab_v2 ? " gnttab-v2" : "",
> +         info.cap_assisted_xapic ? " assisted_xapic" : "",
> +         info.cap_assisted_x2apic ? " assisted_x2apic" : ""
>          );
>  
>      vinfo = libxl_get_version_info(ctx);
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index e1e1fa14e6..06831099ed 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -343,6 +343,15 @@ static int vmx_init_vmcs_config(bool bsp)
>              MSR_IA32_VMX_PROCBASED_CTLS2, &mismatch);
>      }
>  
> +    /* Check whether hardware supports accelerated xapic and x2apic. */
> +    if ( bsp )
> +    {
> +        assisted_xapic_available = cpu_has_vmx_virtualize_apic_accesses;
> +        assisted_x2apic_available = (cpu_has_vmx_virtualize_x2apic_mode &&
> +                                     (cpu_has_vmx_apic_reg_virt ||
> +                                      cpu_has_vmx_virtual_intr_delivery));

There's no need for the outer parentheses.

Thanks, Roger.

