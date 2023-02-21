Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F4569E055
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 13:27:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498857.769784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pURj5-0001Zy-31; Tue, 21 Feb 2023 12:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498857.769784; Tue, 21 Feb 2023 12:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pURj5-0001Wb-09; Tue, 21 Feb 2023 12:26:31 +0000
Received: by outflank-mailman (input) for mailman id 498857;
 Tue, 21 Feb 2023 12:26:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aMCI=6R=citrix.com=prvs=409bf5b25=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pURj4-0001WV-0M
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 12:26:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f509d21d-b1e2-11ed-93b6-47a8fe42b414;
 Tue, 21 Feb 2023 13:26:26 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Feb 2023 07:26:23 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6925.namprd03.prod.outlook.com (2603:10b6:a03:41a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 12:26:21 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Tue, 21 Feb 2023
 12:26:21 +0000
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
X-Inumbo-ID: f509d21d-b1e2-11ed-93b6-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676982386;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G/bBfFYyrF8TBbcszQE4xLDWFGX64Lpw36EATLVpxI8=;
  b=VIJSLOSCQCyarHmBWvpajISGm/KYFueIVW63W26KLvhuynsA70U+v6Xl
   LXHjuEPxGzKTgesq7BqB/NdrV4hrU0ml5Vk3CCLR5C+iR7BBwFULDPdXR
   3Nc8Dvwehs8AEvGpJmsf3vi2Y3CcWOITa59HnyTQSIrwD/crCNVnhAlgI
   Q=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 97894208
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FJG1L6of+/SbhCLaAxs2PFlkUDFeBmI6ZBIvgKrLsJaIsI4StFCzt
 garIBnQOPaJa2Hxft1ybYuyphhTusXVyNIxTgBsryExQXwR8ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzSBNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAAgPcxnfvbro+6OEVtZWguMJJcXPJKpK7xmMzRmBZRonabbqZvyToPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeiraYSEEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpqa473AfLlgT/DjVMXmWZsaO2lXKPXv17I
 A9PwxMWg5U9oRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LRQ62
 1nMk973CDhHtLyOVWnb5rqStSm1OyUeMSkFfyBscOcey9zqoYV2hBSfSN9mSfexloesR2C2x
 C2Wpi8jgblVldQMy6iw4VHAhXSru4TNSQk2oA7QWwpJ8z9EWWJsXKTwgXCz0BqKBNzxooWp1
 JTcp/Wj0Q==
IronPort-HdrOrdr: A9a23:JU6y46p3DkoktWGm/etpP4saV5qieYIsimQD101hICG9E/b1qy
 nKpp8mPHDP6Ar5NEtApTnEAtj4fZr3z+8T3WBzB9iftXfdyQ2VxehZhOOJrgEIWReOjtK1s5
 0QCJSWY+efMbEVt7eH3CCIV/om3dmb4OSJqI7lvghQpNhRGttdBtFCe3umO3wzfgVAGIEoUL
 +b6MRKvFObCBYqR/X+PHUDQvPS4/jMmpzreloiCwEq7WC1/FaVwY+/KRSewwwPFwpVx7Qv+3
 WtqX2b2oyT98u2zQLGxyvp441SiJ/dzLJ4daixtvQ=
X-IronPort-AV: E=Sophos;i="5.97,315,1669093200"; 
   d="scan'208";a="97894208"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmA0Uq0dkl8NgeJy1CKreoHnPdaZ4Yemo68ooHmXIVVtRMHMPfUL03TyhGBfZMwXF7/Nv8+veOyURBreE2Wy7L5cV6e9jwNtYa+UTSyjmj1mH+3OgoncaVZD8J4pnStgSNYVKSE0NGdklsrO34yvFViAb42F8S56XTMeo+QOB5JwUOPIGv4zqpLcDgDZaSXYeBql0e5ZovRWxtaqaOuuwhC9nfEvjfMUyka0CCOKqrggHEqQQ591ToCaH/j8uXUc/iNfSdp0o5UzT3LgEx6Mdag9NEXmaNg+b2t45OpE6J9Wb2cExRihqM7uLUYaZgN48U32xzIzqwKtbuYlMaUTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f191Wq+xydGKOKbZYTnvxXioQfHnK7gPpW1v6/rvmjY=;
 b=R38Jpr33giJ4b/d/1qmizaZ2Wl1S73j/ueCzZxrr7ts3tPMTCNOF7SPMAmAiFLykQ/rLfkhqv8lIsO/ezQfm0QWZ9E/2gXAd1DXzIJioj2hUMCCueU0QdT76r28QaASfTuWpROEotsS/ny5mNPbnav6zWzP4CwS4DIh+t0ghlBTunQXOC54RL1i/zppAJ9jXPp2WI3ZjKNf+f417Vq8+TNY/47G0Ihv14Z4ZHUaW9edzyw77ZOOVxjeBFL8X9RX48JEtpv66vvIxNPf+ehXqw1Vfa/8kPvy49+1M2ejf6T+Ks+H0LEl0insEHQefUZA/rGAX6Trr8hUwXymOK/jWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f191Wq+xydGKOKbZYTnvxXioQfHnK7gPpW1v6/rvmjY=;
 b=nmUWiU5yHMOwLwKBi2yzXalNXrffg6wBGiAIv6LqOnlIPJMtRhp21Gwe7M8t1zF0rWKyGdfLlcwXrVzSZu0AfAM/Y/IfDqsdHHmdeInfkNraoXqmBml/pO8yTdgEBRPC+Z6z8blYUvTnMra2IvOtCaQ2UJcYTc0vhSYYaDE34zg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e2fdff6c-d21d-d3f1-3e46-36f7a88e5507@citrix.com>
Date: Tue, 21 Feb 2023 12:26:15 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v1] xen: Work around Clang-IAS macro expansion bug
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217001914.762929-1-andrew.cooper3@citrix.com>
 <20230217122203.790737-1-andrew.cooper3@citrix.com>
 <04891259-ffde-a6ff-32a1-e3a84a7278ca@suse.com>
In-Reply-To: <04891259-ffde-a6ff-32a1-e3a84a7278ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ba98fd-1970-4565-c9e8-08db1406d694
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8czAoa0PmiurEjIgF9e9lXA++E9in+NXeZ95RwMwzWJOWCbvZnAcpWQ6H+Ja+IRdYPcIhhJetqwoBy8qg4sMuV9opRJZnY+x4u+UJ+lRxiA6QGe/8L+Oewgbi1kMtOBWueNPopvqiIlfye+lDzaPHHqf3M0XkCKERDaJJS3w+/dxeEAyGa2TKFASrDYXexh5fUtOzQNaPxI/mJR14OBnRfCsHl+3CjZDnKnNwMFwLmuSko57CYIuPL28QZa5g6TjC5J/JZqM1g3KrHVjtWD+viuEMpwq71kCdFmacNZsqGICKvkq3kOEkAwH3q7AKYcTRbnsEXNhCI0etFf3dMNZFKdyhv0Vg8nQWMXbWENNX0Ro0voNBgL6Wz+MjpPjeqkUFe96ce/f8sVXUYy8KrrdyMp4mv8jDlUYmbIxhKbgD14UuwC8072GgvXsYmlZW0/ueduE4FIL8wXq66+Ku0ZA3KZk6crQo0wsxLeW9DWzEaAcqUun9OR/+XCUC/maCmys+afexxra6Qjhu+DHtfMRbQwJe2H8eGeGTonZKq+QzWtYRH3noTeHAb1sPEl7CXa7Ppdf9qoY6CcI4/5npOW5cv4B5OvHzkc/k+uojc8jHWIBicoaFHcJx7uyOeudCHBUIjg4Xd/pN8l247/L5N1cfeWaq+KaGvyEZHRzppwvC6gWzZfr2rt/FOR6JDscedPebHEgJJAK9JZ/4bZE4UTVduvl7lSL+QC8yKOIaXPEe9k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199018)(31686004)(83380400001)(316002)(54906003)(36756003)(38100700002)(6916009)(82960400001)(66946007)(66476007)(66556008)(8676002)(53546011)(6506007)(2616005)(41300700001)(6512007)(186003)(26005)(6666004)(478600001)(6486002)(966005)(4326008)(31696002)(5660300002)(8936002)(2906002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWN3bHdaMk9wSDlxTmpRSUw1Zzd2NU56dEc2UnZmb2VyZGVQdHVlWGFla0VU?=
 =?utf-8?B?U1I4bHAxOUNvcHJZek5HMlgvZW83UVljdWFHQmZtYmNPemc3d0RtbUMzblp1?=
 =?utf-8?B?blJiQllReFV4cDlMTndYVmNuSnB4a3AzQ1Z5SnJvMmNOQ1JrQ2E3N2J5aWhp?=
 =?utf-8?B?K1YxMHNkcDJTeC9hZzFVckNsME1qcjZpQi9HUDhadWZKVFlKbFFoOTVVMzl2?=
 =?utf-8?B?L3hIbUcrRnVSeU5DVjI1Z2RrcklzeE9sMTI0VlBnODR1dS8rUlZnai9oUHE4?=
 =?utf-8?B?NzRLcHhjSFhmSEUwQlJ6MWhmajQ1SjBvMzRqYTR6UlRNd2krY2s2QzRDc0Fo?=
 =?utf-8?B?WCtqbms4SVRnMHBabG1XZ2w5SGJUY0VZeUUzcER1RTN0Z0RRWnhCRVpQdXpm?=
 =?utf-8?B?UklXeUVWQmFNTTVLZ3liQzdXczBLYkF1TlBJcklLa2ZGaUVkZnRNZmFUc0hq?=
 =?utf-8?B?aVM2NzQvM25sOTJ2U01hN2grNFUzRStGRTNOanlQaWh4dzdQVGlIUlFOOGFV?=
 =?utf-8?B?UXd5emJPT1Rac2Q2SkpQL2JsSnY5YWZpK1NUc3JjTDQydjFWV293UGlSdURi?=
 =?utf-8?B?T2ROaDcwOUYzL05QM0NWWGJGVEVOY2NFMG4xL3pGbzFTaW9SME9OQWh6Nm45?=
 =?utf-8?B?amk5UTlKYTVncmZDV2hkUHcvZSt2TnlQNHRudERTRlpwTzlSS244akkxM2gz?=
 =?utf-8?B?YnZJUjJISk5vU1BkblFIQVVyTG96M2JXUVVXYzNvR3NFSGxVV3I5d1RoOFcw?=
 =?utf-8?B?Tnc5RUVBV04vdU5sRzZtd2pNZkFmU0ZnMzZ5Y2IzZUh6bWJGY2twcnVwUUJB?=
 =?utf-8?B?aVhKL3dGOS94SzgyK040Y3hXNkJ5aXlZL2RYVTI3czFMdWpIOXRzSzQ0U0di?=
 =?utf-8?B?Q1ZKVld1MXU2SWtJa0MvZUdpR2xPSHV0SUxxYVVaZVEzSTVUYWs0TXBZeXpM?=
 =?utf-8?B?cUpYMExyTUVORnJNNGpQU3lHU3JqQzRHblhTWHRRL0UwM0Z1ekdNcUlVVUxo?=
 =?utf-8?B?aVArV0VqeGJSRVB0MWdJVlVXMHVsdkFqM0VjS3prZ01RN0RaYXR5SmN5NGdh?=
 =?utf-8?B?NnVlejd2dkpDaGFzTEQyTE9oUTNhQ3NXWkZWN1dHWXhHVWJ0N0NxNUJUZC9v?=
 =?utf-8?B?ZzN5bTN3THdScFQ1dXN5elBpTXNFMDRvK013bWM1VytqWk96WXdRdHB5dkdK?=
 =?utf-8?B?dTc3Y3FvMGZxWEFzUUFzSGpzbTBiYVJBTy9WMUpPSi9yZ1RhNWFhN3hRdnJT?=
 =?utf-8?B?NFNyMUtwd1dLWWNMVmRXRHAvdDE5d0JnWHc0U2ZEVjFqZWlHczBWelUzZ3BV?=
 =?utf-8?B?cjBnU0pyTE9JN0lqbFVsYjZYbFFwQ1BnZitHWlNhMkNtaDhXRXhQQVdRRm9h?=
 =?utf-8?B?d0NRSVAwWVNvanlPUXhLZlM0czIrRlMyT3ZXUjdUaEdIMWluc0hDRVRiSCtF?=
 =?utf-8?B?bWovTUd6VFRlemZ2bGpJTzlPNVUrcVdXb2J3WHdNZlFYRUNuNXI1MUhQd3Bi?=
 =?utf-8?B?NlluS0thMnhIQ042dWNucEdTVC8vY3plamZBZUN5MUdsM3d3UTNBV0hiZHMw?=
 =?utf-8?B?YmhBeGIxeGZXZGZwblhONWhlc1JVN2V1Tm5uVmpyMjFhQVVoNTdVZndTUmoy?=
 =?utf-8?B?aXk0ai82dG1QMWM3V200TmQ5czIzRWw2MnlSeVorQTh5dmt4dDFtOEdZM3pa?=
 =?utf-8?B?UWFYMkxlMGlMdUVaS1B0QnMyTTc4bVVuQ3kzOEpEaUtmMFE2dFl6b1g1TWd1?=
 =?utf-8?B?NHNuR2RGQkg2b0FIdWxnb0l0WjZmZGNqR0dHSm91a0FWSGZGWUE4RHRQT0NJ?=
 =?utf-8?B?RUE2b3V3SlJMMWEzQisrV3NFRE13SkRiVzhKSXRLaXVrS1hLdlhkZTRJUFRu?=
 =?utf-8?B?S25DMGo2Rjd3RVZISk52N1hrOXZueVVodTVSZkw4bS90WjF4VGhKanFLWG5I?=
 =?utf-8?B?NlplQ29sM0Y4c2wya29wNXpob2RTNmJSalJ2dFBsUUpESW5VTnRBNEJZcGxH?=
 =?utf-8?B?MDRVWkNCZ0ZrSWNpT3lZcUtFUE5MdzltL20rNk1FRkhXaVZ1aFdieGVyK3E3?=
 =?utf-8?B?eWtPZWxuMXE5TENZSlUvY2psSGZPeDhmR3FzMEhBZ3RUZ0pWOW5taUhNOXha?=
 =?utf-8?B?UXROU2hzaThUVXkwN2hBT2tMZDBacDZnTENiNXc3VjRmYTdFSXhKU3M2Umkx?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C7asOmUWlDs/C9BcTEwEk21JAk+TT4ayPDmwdwlfg5coWZtZ9MQgAFQTjhC7qBtvVmOptTusDDar5+PB1XALlu0auPy+EvuMjk2gG9vnqPUaUpOssIdbUHDOdMVgRGhC2shg9qZnrkzKEaY/9i3gr2roIZjG10xCXEq3E2xa5SvnK6nbvzA3kHz7y3tZdbbhcvGg3f+D3448ayTiSNziG3DK5KY7o5z6arEC1nTt23yDNNbOfZNXz46XtUeYqaOz0CTJJtJLvEAwqzyC+nYiiOW5wFQvX8rtVKqzAAv9by2TPS4ClRPVAF0CZBqCJY8zoojaJHl5pXIL4u2q06bbvbCP8YAuNz+kbJEqcGzpI5U5HgevFk5qOdXZcy23r3oERkoG8NNmrMf/ejnVmjgerlUgZNqlaiijk0OAsUjlbHyQzULGhlU4oG87PIu9TJe2T/4+SiFGySrBdhF05S5Z5dxz1TKvpaibPoiyMcsPaCa16tSlgNBGMWCh0RqzGp1RqYaV9Jy6bJKYK6RqDddZyJyOUrm/p4SesV3O/iriNkNrjjDOsn0zajf0CPMcHoACnXfEtHDWTP8K1vJgpUrwigujjQPMSwn69ijIPlw6gklQED53ednWVBqWIRiMYQpnKtPAMBrx1cY3ThDgZEgCfxodgyptNuemKHuHs+AwdDna81s7wZFonDfD2HbRBsqcn2t7dNgYVpPgYaHz0XMaJsxVCD1+QOCjrV2QQpq5yfQaVhoyKSjv9f+QelRI5kxQ7Y7Ih1OXeu2Xpifq7KevPpMVQXfM610eNkaKZCQv/dxwx4ylofQLBQsJr1q9pzC3qIVMtrgn5zXerxfp8qugbQ==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ba98fd-1970-4565-c9e8-08db1406d694
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 12:26:20.9397
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C87vumzcfTHOVNGuZuYEJYiR829DgOSb/zElV7JxZ3svw1UEKhITecwRpMEwZDCYBv/s5wbY5SkQ5InEDi0qF/YziIJLrowyXWs9vM3uZ2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6925

On 21/02/2023 10:31 am, Jan Beulich wrote:
> On 17.02.2023 13:22, Andrew Cooper wrote:
>> https://github.com/llvm/llvm-project/issues/60792
>>
>> It turns out that Clang-IAS does not expand \@ uniquely in a translaition
>> unit, and the XSA-426 change tickles this bug:
>>
>>   <instantiation>:4:1: error: invalid symbol redefinition
>>   .L1_fill_rsb_loop:
>>   ^
>>   make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1
>>
>> Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mux %= in
>> too, which Clang does seem to expand properly.
>>
>> Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> v1 (vs RFC):
>>  * Rename \foo to \x, reorder WRT \@ to avoid needing \() too.

Sadly, this is not quite correct.  There needs to be a non-numeric
character separating \@ and \x or the concatenation of the two can end
up non-unique.  So I think we need the \().

>> I originally tried a parameter named uniq but this found a different Clang-IAS
>> bug:
>>
>>   In file included from arch/x86/asm-macros.c:3:
>>   ./arch/x86/include/asm/spec_ctrl_asm.h:139:5: error: \u used with no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>>   .L\@\uniq\()fill_rsb_loop:
>>       ^
>>
>> It appears that Clang is looking for unicode escapes before completing
>> parameter substitution.  But the macro didn't originate from a context where a
>> unicode escape was even applicable to begin with.
>>
>> The consequence is that you can't use macro prameters beginning with a u.
> How nice. If really needed, I guess we could use -Wno-unicode on the
> assumption that we don't use anything that could legitimately trigger that
> warning.

It's proving very stubborn to narrow down.

I really can't reproduce it outside of this specific occurrence in the
Xen build system, but my gut feeling is that it's something to do with
the asm level .include.

>> --- a/xen/arch/x86/include/asm/spec_ctrl.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
>> @@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
>>      wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
>>  
>>      /* (ab)use alternative_input() to specify clobbers. */
>> -    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
>> +    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_BUG_IBPB_NO_RET,
>>                        : "rax", "rcx");
>>  }
>>  
>> @@ -172,7 +172,7 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
>>       *
>>       * (ab)use alternative_input() to specify clobbers.
>>       */
>> -    alternative_input("", "DO_OVERWRITE_RSB", X86_FEATURE_SC_RSB_IDLE,
>> +    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_FEATURE_SC_RSB_IDLE,
>>                        : "rax", "rcx");
>>  }
> Since inside the macro you retain the uses of \@, I'd find it desirable
> to keep gcc-generated code tidy by omitting the extra argument there.

As I said in the RFC, I tried to have x=\@ but gas really didn't like that.

But given the concatenation observation, we also cannot simply replace
\@ with %= (given the option, which I couldn't figure out), because they
can overlap.

> This could be done by introducing another C macro along the lines of:
>
> #ifdef __clang__
> #define CLANG_UNIQUE(name) " " #name "=%="
> #else
> #define CLANG_UNIQUE(name)
> #endif
>
> Besides the less confusing label names this would also have the benefit
> of providing a link at the use sites to what the issue is that is being
> worked around. Plus, once (if ever) fixed in Clang, we could then adjust
> the condition to just the affected versions.

It's only Clang IAS, but there's no suitable define to figure this out.

And while I appreciate the effort to be more descriptive, this name is
literally longer than the thing it wraps and ...

>> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
>> @@ -117,11 +117,15 @@
>>  .L\@_done:
>>  .endm
>>  
>> -.macro DO_OVERWRITE_RSB tmp=rax
>> +.macro DO_OVERWRITE_RSB tmp=rax x=
> The "=" in "x=" isn't needed, is it? It looks a little confusing to me,
> raising the question "Why is this there?"

Because I started out with u=\@

>>  /*
>>   * Requires nothing
>>   * Clobbers \tmp (%rax by default), %rcx
>>   *
>> + * x= is an optional parameter to work around
>> + * https://github.com/llvm/llvm-project/issues/60792 where Clang-IAS doesn't
>> + * expand \@ uniquely, and is intended for muxing %= in too.
> With the above suggestion I'd see this comment move to next to that
> helper macro, with a link to there left here.

... there's no getting rid of this comment, at least in some form.  The
parameter is odd, and needs explaining.

Passing %= unconditionally doesn't matter for GCC/Binuitls, and in this
case, attempts to "declutter" the niche usecase of inspecting the
assembled file comes with a substantial complexity at the C level.  
It's really not worth the extra complexity.

~Andrew

