Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E027771DB6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:02:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577961.905115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx3X-00079c-56; Mon, 07 Aug 2023 10:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577961.905115; Mon, 07 Aug 2023 10:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx3X-000777-0U; Mon, 07 Aug 2023 10:01:43 +0000
Received: by outflank-mailman (input) for mailman id 577961;
 Mon, 07 Aug 2023 10:01:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qSx3U-0006w0-W9
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:01:41 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 660a27c2-3509-11ee-b27d-6b7b168915f2;
 Mon, 07 Aug 2023 12:01:39 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 06:01:31 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5373.namprd03.prod.outlook.com (2603:10b6:208:19f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 10:01:29 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 10:01:28 +0000
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
X-Inumbo-ID: 660a27c2-3509-11ee-b27d-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691402499;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WOuAeoJ6YIbTezNJulDubATjKQvv0w33xCWZEUkTM4A=;
  b=Ejm8aJXqbEdMMNGZw/+CFyVDfC9rcmuinaq7AdQW2kkfuoeskuVegOxH
   pDiQOacpWKy7PXkqWs/79m7WjVoOE/U07ku8jjWK5Ja5KuHAFAXqNwQbD
   cCgnTTibGiY6ArVFw+iuiGo6Yk+aB0Xei4kA1FVoqA1C32rnjJf+b0nKm
   Y=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 121351095
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:A0yNSKvl2qYJNIYX2cWYKTMSRefnVLRfMUV32f8akzHdYApBsoF/q
 tZmKWyGMv/cNmv3edx/Ydizp0sCsZDcy4BlHgc6rn0xFnhD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+GySFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwcmk0Piim1vOKwKOWbq53t956IczFI9ZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60b4G9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOTir6U32QXCmwT/DjUcSXyG/9qlk3eBBeNHL
 2tK3HFyl689oRnDot7VGkfQTGS/lgUdXt1WO+w89gCWy6DQ7hqZB24LVTpIYpots8pebSwn0
 BqFks3kARRrsaaJUjSN+7GMtzSwNCMJa2gYakcsTwEI/t3iq4EblQ/UQ5BoF6vdpsLxMSH9x
 XaNtidWr7Aal8sCzai41VHBnTO3p5LNQxI15wPYRWas5EVyY4vNWmCzwV3S7PIFIIPHSFCE5
 SEAg5LHs7tICoyRniuQRulLBKuu+/uOLDzbhxhoAoUl8DOuvXWkeOi8/Q1DGaugCe5cEReBX
 aMZkVo5CEN7VJdyUZJKXg==
IronPort-HdrOrdr: A9a23:V8tKraCDoGFJ42XlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-Talos-CUID: 9a23:4wMrY26IhrMXYtt1mNssrhctSvgAI2zhzGb9BwijOHwwRbi7VgrF
X-Talos-MUID: 9a23:bhAykAtoYNjaZeoZyM2nji1FCZlL/72XNx48iZEh5e/faRZ3NGLI
X-IronPort-AV: E=Sophos;i="6.01,261,1684814400"; 
   d="scan'208";a="121351095"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3DWacrXDcdaygw0eRBcQurR0Ar6xaOP0V5KiQpSW6TM6/qMU8lAwcZGgX2STUSvvP2O0azHjCHDOB35ZKKMpo06yc91E0jzPnmXoa0TbhcXPGXVRFBsEnEmH+mF7UurFT+kmCTSQITJ3UHls4hUQDWx9G5NbM7CvEOyDBsBMARwHinJfIqoSq2K+nYr87f3RS603Q8mhxyDonpl6VL4CkA9ppjZkZcbTuggNG7hR+OxI630aPFcvXDUujMHaQXeHsPvAvQKxbCIcq5OHwgrv4XWtkS1i0glxCxE9FXD/rmabZ0eiJ8wfKZLBIIJgyN915m7mjF1FXvE2nPDtOP5+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e10eSy39/Azale1Jz+5xNO8QXko76iTOBQhrrYFt31I=;
 b=iF4bFeKyfwrDpjLJdei8Kz7zCz633Fs5+cZOKyq48bjeLoy3aQSpjQlNmOgFHX7PrxgQnzDgOx71DYpfxxGdJ0R8KLWZ6M8riDkiCNLX7mTYkjYttfI0zkfdbEIJIv2+S8dwpJW5Qqw2F5i920zAUjmgRTdbCV7ON3DXzveeKrt8YbQp/LnDi8zvryBTYMVej83E3m+bl8X+cXxFXQKbUKFfYmORyTLi1lsnP9rcx6BCFvht9NIcRRslc+zeQOqsFrMZGLoiWFlztYRwA+jCWtnUQ3hcZsSlURht93s7J4XioIZ+7z+kWWkaWNBmKpU/t5uhZVhN1XOVo8LVc6ymXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e10eSy39/Azale1Jz+5xNO8QXko76iTOBQhrrYFt31I=;
 b=X2CivVSHjRF4sdmFCkgVkzxXvAvfNweQ+JwmRnvOCqMfIvQ5XW+kdLnjyt1q45WC+U1f5mrdsKpkYIGYgzvy6AQq02GRj8Tn0/dUciiU6Kw9hmMOheeK5zJiKrQt5ziUmJ+7EHXu9xxkv03xBHB1wpDiqYVxSln8yc6SdcW6Ol8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
Date: Mon, 7 Aug 2023 11:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-GB
To: Simon Gaiser <simon@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
In-Reply-To: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0340.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5373:EE_
X-MS-Office365-Filtering-Correlation-Id: 870f6993-478c-4ab3-a0f5-08db972d4497
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r1G4+Qq939jNS6KjN1n4IRTRGosd6/2b0upfArBjCwzA9swREgKeRN44Iu13r4rhR8D0yZBOveSi5MzS+qcJbN0eMF/aHtw1wqO4m1N+eD9hpc1jPwsTbLOAfb+OfFsMiA78fBr/JTbdOUo7kspERhtSL+tDIyEBisT4OSVHupv/w07XxcEao+c3X2URnS6R1dJIKsvIcKTTjKwM1Ttqbs2HL81IvEspoZ9SfRTAPGiOph8RV0IBAAskcOloWmIsyv7txtb97lWYjFG37+H/gASKI4MpiWJm+q2C+FdYhWgmDU95bTuLSEXNhIEVfI1blXoTpSrAcF3NTMsOjmwF8xbWsMqZ2R9+FTCg2Z8s9XSTYUYTTkR6v8+Q/IesIbtg6xJbF690eiF4x9EM+0ekkavV7zpUlcoXQ03sAuWIzmT+FVPvBI7T/a8ovdCUt4SrmGrvNxsOSTp7RAtbVbsuxzUrir+mJnrz4+V3y1vVL7KHXQCj1o6/+7BQ7zKaTnWtFfbbDo1hAgxH2sDG9qeOBleN7VpqxCeEKARgfCAUWeDccqgDywAmbN0MNFc+mzEPzyYyCOU27pyOVNJywdhijCE2ht3ij0E/g3Axmooo+wkj9+jzHsFweOInW2FRrcgFOgMQdUQWs458DaJlptRP2w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199021)(186006)(1800799003)(2616005)(36756003)(966005)(6512007)(4326008)(316002)(86362001)(478600001)(54906003)(38100700002)(6666004)(66946007)(6486002)(66556008)(66476007)(31696002)(53546011)(6506007)(82960400001)(41300700001)(26005)(8676002)(8936002)(2906002)(83380400001)(5660300002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGZSUzJTZzE3U1JHR2FTRlJZVmVlNWcxeTRUL2k4d25PcEUrOEpiWVliVnE0?=
 =?utf-8?B?bjd6WWlRRUJSZjVScGF3MVdGSnJ4elZ4K2NtT2RReHhSaGtaYlRFZThPRjQ5?=
 =?utf-8?B?WVMxRlZna1pSbGhwRnpXbFV1S1N4eXNjMDNYRzJwblhCbkVtbUpzM0sxM2VC?=
 =?utf-8?B?TzNBMlpsaG9CQTdXMkNnem1ncFdKWkZQb0EvVkN2SXBXRTloWDhKSUZlZUli?=
 =?utf-8?B?T2o3TVcwOHQ3eWcra2xXQ0poYk5TWE1nNEhwVTZvKytFNUFDRmY4bkhDT2hR?=
 =?utf-8?B?Yk1aWEdLdzRCODFUaTB3N0FWWER0Z082QmxEWXZIOCtIUHJzTDNGVFVMdmgz?=
 =?utf-8?B?MFp1L0dEU290UkdwYUY1YUVtZWtQaVdLd0NFZFp4czFObFF5QzgyVlpoOWU2?=
 =?utf-8?B?SGUvVTY1ek9CMmN3ekI5eXZuVW9tV1p1R1JEeWFKSGtUaFA0dUhpRm41bnJO?=
 =?utf-8?B?WHNvTjQrOGtpN1V6VXR0QkVZdTVGSUx3cXlvNFpUUTVjcEIxd0RUVGg3UWQ5?=
 =?utf-8?B?SEFTWEhUdHc3Z1lTeXc2M2ZwOVdmRStQMlFLVGlscHE4WGZnZUJDblZRaXZG?=
 =?utf-8?B?a21rZXVZdU9Tb1dOQTFYRmd3UlhWdDdYZkpmd0wzbS82STloYjQ1aW9lTEZr?=
 =?utf-8?B?QUx5eUNnTnhWalI1bWtqNzNWVmFuQ0U3TTVBRUFhR1l2UjNWdDZNbWFRVC9t?=
 =?utf-8?B?MGNibG8yelJHUXFBOWpqR0s3MWpvTGRNdnNXOHJndDBWdjJqT1BlUkdlWGdD?=
 =?utf-8?B?bkI3S0g3bUFtSC9lcWpVc2tUYkVqM0ZrTlZuSjE0dmpIQW1KVFduYnRVTkZM?=
 =?utf-8?B?UW9yMjRISW8yZXJOSFBFRUpuOENnYmFscWY3emZaaW1lM1Y2T2ZDZ1BMb0RO?=
 =?utf-8?B?L2duWmxObDJXLzNtUStIVDNQMkpUZk1xVWszdUhVM0dEdUovaE9NcjBHNmU4?=
 =?utf-8?B?b2dmRzRqajJ4ZzBLdmZWaXptci90OTdqZVJtZkJxek9iUm14ZnVEdGJ1am1J?=
 =?utf-8?B?YTdyVjU3akFveGFXSVFCTE92WFc1VUN3MTNleUw1WmFwYXhwVjQ3bGJZbW1S?=
 =?utf-8?B?WmlUKy8zUkZTRHN0TndGMkJEMm56WDZuQkdYUkZyZ2FueXFWR3Q0azB2UzBz?=
 =?utf-8?B?RDlxU0dLZjRVazl3UlVyK1dyVEtPbEtmTlhiK1lERVlXdnY3OUNlYjBlcmZT?=
 =?utf-8?B?ZDRaSXdlZmpOeFFuZmplQkpJOUVhTEN1ZFo3S1UxL0dhM1cyY0VTbFVnMGZ1?=
 =?utf-8?B?ejBzMVAvdDJ4SndqNGpVZnB3TEhCN3E5eWxscSs0VVMxVkpOUUNXMWRFNGVl?=
 =?utf-8?B?VzREa2hZQlluczBZSXdNTXNFVFlZZy9lc1RwSS9Ja2lIQjh4UXRyblROSko4?=
 =?utf-8?B?Kzd5M0x4S096ZlZoeGhDcHFHMFhXQm1OQzF2L3RyODB3VlAyYVgwdmdjbU9k?=
 =?utf-8?B?OWdlaVVHS0QvamU4VGovYzJmYS9uOU1aRVBwTlFXL3Q3QmRzOEhkN0tJVHR0?=
 =?utf-8?B?d3BEelNzLzVzS3pBU2lGaElQUytrK0NUUlo4ZWhIV0VyV0dlcTdJOWtseEJv?=
 =?utf-8?B?VFYwNDI2dHhEclVrUmRwcmdDWG42dktEV0piUGpzbjZjR0R2QUFRTnp2dDl0?=
 =?utf-8?B?dWJNSVR2MlFpbkU5Sk93QWdYTGh5ZmxRVnlYajY0aVFncnhoekRweUZqdzQv?=
 =?utf-8?B?dWRYMEV0RCtDa3hYNWRwRXR2YzJwMHRxclNXbkhPZ2NwL3lZNmR3bnAvSFhF?=
 =?utf-8?B?YUVlR1M1elJKcHNwQ2hXYmZ1ZmVJZDczYmtmTEUvc1R1WmkrSXF3ZWFRM1Vq?=
 =?utf-8?B?VEwvN3VMNHg0ZzRkajJsSDArdjRVVkh6dG1SNi82b0RzWk1SWk9YSUdNTVVP?=
 =?utf-8?B?cTkwN2ZidzFxQWNMUVNNdkQ1cEM5Q2Z3Y05mWXQ5YWNXR29Ob1FiaGdEcmtD?=
 =?utf-8?B?SjhHZVB0cFZRMXE3d0MyQmFBVjErTFdXb1E3RER2dTZodzgwaGhmVnNXTU5i?=
 =?utf-8?B?bGo3dFJyS3podzVsRmhpbzV1VGd5UzIzR29MUUdJNWViMUJWdEJvVkRsQkxD?=
 =?utf-8?B?QkNoaVl0Q0lROWU3enQ3SFdtcEFVZHoxcmFzZHYyVzNVSmI0aUNlbnFCU2lP?=
 =?utf-8?B?RUhOMk1tYmw0RGdtYWFDZ010dDF2Nk5QVXEwajNSTFFGVjhnOE5WTGZiMHZz?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oQdFGtUGJGBZ1XD9iW7IK2zL0ugW6Mh7fw9tiLjtw/BtGCxKLSH2x+zKO9PsBDlKEqesRxZNFEEzy72X5iOnor+SOyUZlAUgjnq2Zyj1FIy3gtCwILrHQ2ONB3pf3NxxPfRaxzs0QDVuK+pmLVWAe+N8Gv3jF8UIXq7tycVHsOlGmMS5t3eR39H3OnEDkY1wCBModV/oaC3I7y2pktH43E/zAJpae72r9FvGlPb3pFM43DVH0wn5WhqMsO0Su+th8U6XFpOGAr/kI8uG0/+tUJmLepovIAFOrnLkqQZ8idDU6+OnnZqiwc+1Db+ReGE8ttrtEQNOe2RFsAdcRC+VIJ4kTobD3EhaVoImOEbB66/E52mJr6Jkd6Dbb8U7qHjJ99zvdmNHOZ7o/u0QkZJ7p9EmTxvjQ+rTROmZYxcvH2fGlHyKCZT+UGYDyY4auXXKYs8QIaeM8mxfokSioy2xevVRGnbqUobIQA2MNRq82udFi5GGQiYN/F0xbYrL2gy4pZQIHUe8bP4bGtR+AmHR9L1TlUYRAl/Uag7Cr8OmzXp+pChRseTb1I8HHAUcRH8ME2/HqDPx02fuSk5oVl291BSrfKlsHgZpEnq+AqQnHb6aePNF6+rJw6JLa0+ruG+7uqcgWsszrDJLd6hrI2d4vqvX870EDG80IUsD7zG2KQcAzYIK9YWPJ9Se3beKgs7RJuSvLh7WB2fuLtjldUbXE586+gXkWslmzclRiEfxMy7Z6NSnH8AhPe03kVntsbidcbQWbNBZQh8mJTv+XkCnunPGup+LqstMYAu3r/GRrLnAOGqovtnHjIxw0DRLIFfwlZ3BskdgoUcXRE8kmI5NuSNbTBfKQEFf8DjhVf6Y9D8Tw4XqtBrR/cYvBU+gs8cu
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 870f6993-478c-4ab3-a0f5-08db972d4497
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 10:01:28.6689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZBO8osWYzpZvbrRdPtcGqubqoOI56cWouFFbpUBKxrX//8L/RLiO5Pex2YP5dGRfg5x+2V9DS8pTX0Tva1v1ykZRIB0NuY+MaOFmFn6xFug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5373

On 07/08/2023 10:38 am, Simon Gaiser wrote:
> It seems some firmwares put dummy entries in the ACPI MADT table for non
> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
> 0xff. Linux already has code to handle those cases both in
> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
> same check to Xen.
>
> Note that on some older (2nd gen Core i) laptop of mine I also saw dummy
> entries with a valid APIC ID. Linux would still ignore those because
> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen
> this check is only active for madt_revision >= 5. But since this version
> check seems to be intentionally I leave that alone.

I recall there being a discussion over this, ultimately with the version
check being removed.  IIRC it was a defacto standard used for a long
time prior to actually getting written into the ACPI spec, so does exist
in practice in older MADTs.

Otherwise LGTM.  I'd suggest dropping this paragraph as it's not related
to the change.  It will also help if we do decide to follow up and drop
the MADT version check.

>
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]

https://git.kernel.org/torvalds/c/$SHA

Somewhat less verbose. https://korg.docs.kernel.org/git-url-shorteners.html

> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
> ---
>  xen/arch/x86/acpi/boot.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
> index 54b72d716b..4a62822fa9 100644
> --- a/xen/arch/x86/acpi/boot.c
> +++ b/xen/arch/x86/acpi/boot.c
> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
>  	if (BAD_MADT_ENTRY(processor, end))
>  		return -EINVAL;
>  
> +	/* Ignore entries with invalid apicid */

x2apic ID.

~Andrew

