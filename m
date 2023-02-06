Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 667C368C55A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Feb 2023 19:04:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490679.759491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP5pe-00042U-Ir; Mon, 06 Feb 2023 18:03:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490679.759491; Mon, 06 Feb 2023 18:03:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pP5pe-0003z7-EZ; Mon, 06 Feb 2023 18:03:10 +0000
Received: by outflank-mailman (input) for mailman id 490679;
 Mon, 06 Feb 2023 18:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N+3J=6C=citrix.com=prvs=394ad1b64=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pP5pc-0003z1-JL
 for xen-devel@lists.xenproject.org; Mon, 06 Feb 2023 18:03:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8048cc66-a648-11ed-933c-83870f6b2ba8;
 Mon, 06 Feb 2023 19:03:06 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Feb 2023 13:03:02 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6478.namprd03.prod.outlook.com (2603:10b6:510:b3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 18:02:59 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 18:02:59 +0000
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
X-Inumbo-ID: 8048cc66-a648-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675706586;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=YJzG4NLn5eg6+L2HkO8F9YzYlDOI3tCiics21dQOJsY=;
  b=J6r6gVxn/L2Kuvpiw03cLH84zD2Mch05Nj3EmyGgV4J+B4xYHcEbu5GV
   FtmQJbnqLe/x02cHkrKcX3R9bjd5UoxX3vfZ0rf9vabtsoH4K+el1Y0+Q
   wXBuW9/Dx614d15+VKQJVNZMPiUhA41Nbv7N9YeFcyKKUGimdkTNnqrGc
   4=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 95807338
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qoRGcqkuRpkSS02JVL6YtE7o5gyhJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMXm/SPKyIZmD2fNx1PIrlpE8Pv5GHxtFrTVNupCs2FyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5AGGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 cVHeB0GcBGvvPyn5+yEE9Z3luc8Ica+aevzulk4pd3YJdAPZMmaBonvu5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVM3iea8WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapDSe3gqaUx0DV/wEQ6T0QqXgOQmsK7j0XmAvVtN
 3AY2jMh+P1aGEuDC4OVsweDiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceWjgCx
 lKP2dTzClRHsrKPTmmG3qyJtj70Mi8QRVLufgcBRAoBptXm/oc6i0uWSs45SfDkyNroBTv33
 jaG6jAkgKkehtIK0KP9+k3bhzWrpd7CSQtdChjrY19JJzhRPOaND7FEI3CHhRqcBO51lmW8g
 UU=
IronPort-HdrOrdr: A9a23:yHYhZqo3gHdCC71iu9C61TAaV5oAeYIsimQD101hICG9E/bo8v
 xG+c5wuCMc5wx8ZJhNo7+90dC7MArhHP1OkOss1NWZPDUO0VHARL2Ki7GN/9SKIVycygcy78
 Zdmp9FebnN5AhB5voSODPIaOrIGuP3lpxAWN2uqEuFkTsaE52IMT0JcDqmLg==
X-IronPort-AV: E=Sophos;i="5.97,276,1669093200"; 
   d="scan'208";a="95807338"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gxm6Gi46Zk+PKO26PvqdAqfkrfnr4JtaZrE87ClFOrOStDjCIv81QnX1JfLS02P41ISYqSSbQ/wz6ukTGuRC46hcDV4xtw3LbwAKnAESY+sbsTb5nR7yBKky5iXw4EAy1hyRNIuVifM1CKhHE6fB6PYBuGDThEQU9Uf3kUH52wZyOyi0KvRqIpIusWyI1zpZ8UGwOaldtacaQ4AYXJNr47s/CjwhQzv7e1DksTLAXi9/yAtDqJpR6y7jy7gwj3EHUKfEoOTFf2MUrCzNIuwfQIn6J8i1HF2K5KSs8M/ua4dfPzetomyeyz61dkF1m3BJkw1z1M5xfuAxqlN3PnFUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rHXcx2/qL3mNCXpB8gDZ0ooVc6uJLo6FWH+iGcAtI0=;
 b=FUC4YNzNaX9IYPB53TkS4o9SyXDnynvwtjz4ubaZ2qbIrVNbRfecReuxAmy19oAJi5BQfWRvZzqRWf3W8Jx3JniqZSduIP9AfsREYpWb1hWI4i0agme/hwla8Y1Hfn6BFOllDREVVh4pSO28nrjs20pUKra827+tcSCzz64fX585LdhnZV2C6ElSvmPFXz6UaPSl4eouyBX3/cBCzic8PxswEvGU8DxRoYzv1YCsO0K1ldp7ZuYKfHqEP7qi8z8u3c6T8+NMwlKy1ZRZr/gLVigDXfHKErCXjV4enXsD0Z7dG0PZBcba/5DamOejbMEitY4idnzndfUVZZbx/jhXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rHXcx2/qL3mNCXpB8gDZ0ooVc6uJLo6FWH+iGcAtI0=;
 b=fJpVZOFvwBPd9pUs7RUTVCikeOdWLbfRIqjUnBYNSq+gM3R8X8melcdZ5mT6z+U9biwTo/toAMWibLOgOQmfuYFk99yMXgjcxVUuXsep0BCTZiYKKmUT66fy+V/vQR8yy8CNLfKYjiG0C0JJor4dPoU0XnUklRVI2UlTbNG1bDg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <fff0eb32-cc4d-a3b5-c637-58f643cb644a@citrix.com>
Date: Mon, 6 Feb 2023 18:02:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [XEN PATCH for-4.17 v6 2/5] libs/light: Rework targets
 prerequisites
Content-Language: en-GB
To: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20230120194431.55922-1-anthony.perard@citrix.com>
 <20230120194431.55922-3-anthony.perard@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230120194431.55922-3-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LNXP123CA0014.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::26) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fb6e008-abb0-462d-9b1f-08db086c6181
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZtZ+/Rx1o0ov4jIo9WK4irNzf174xsmx3lsagp1r9zCtQyuFHw7O6z7hjesWO46FLPmUksUz0647ItSc1UEKcaNiaY1uUthTh/ddTYZ0oRyUK7LBRl0nZvuAjN/8M+wcYHeEOtggnEh5zDEW6z0KtRTz+c4MlwWOpY4xaMeEm8B4PT1UA9vtMxEDXWWdH0PnnUInkuACMKlADs9Fpn7nZuN8Zr+HL/ZmAHQKrPtEitxnhKLphLd1LSs5YWOm1jIDXKPkvAVbjRe6n0qxgf1lC0oRVMBDUiGqWfvWEy5zOhUp1nPXZ94vE/IKmfMc6JFjez8U+/D7PXeCKHSvmKzhafL+JjSC/+yy9FWSr7S27ex04MzDnW8MkWYAlDFF2jJ1Rn8i6FUP8yOtNw5WQSoC1Umg5RlO5fyz/VZfCLbYNwbrWPeZ6tRS1lDPWucjPrvJjVk07Tsv7tND5//PD+6pGv2avFS9VAZ6i4eDswbzO44P5CynP6M2FdlFpJCs9a/TJAz1Nv6eFUCmmKDI1HS2qwkm0o3MoseG8GG9E25RqlgrG2gQNwp8p8EmurS+bBcYQtG8y5+6ASmwfa0BB9SVFKLhLyoN3XGpoWyqcw3Iufu1RU5qeKIxO4D6c9SSw6110HsNaqvO7JZBj0daWV5sTssBN+SJ2PY2CguKrdsJGQkwFNlc/LNe8IbMX1y0isA6MYKk0DqUKsJ+hoOz4hAvtDrg7k1uq0YUrfxCHLqHzTg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199018)(86362001)(2906002)(66556008)(31696002)(36756003)(82960400001)(83380400001)(53546011)(478600001)(6666004)(186003)(26005)(6512007)(6506007)(2616005)(8936002)(5660300002)(6486002)(41300700001)(38100700002)(54906003)(8676002)(66946007)(4326008)(66476007)(316002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eHREeU9QYm1ja3JoRStUSTFUQitmSi9DU2x5Zks4d0VIMWdKcU1YK1F3aHEr?=
 =?utf-8?B?UHRPRzB1ZEI1QnRjVGhaNGpsT2FGLzBkc2owK0RVOGFJMW5mZGJEQ3BZUm1i?=
 =?utf-8?B?YlJKQzhqUGdieUhsR1FLY3krQjBGOGpPNEFyOGxrRHFBNUJJTU02RXFyRkZ5?=
 =?utf-8?B?SkhNWXFoK0MxNVBRQ0JRaUNIMFJKKzU0VEhJbjBtR2Z0eStscDdZd0xPV0Yw?=
 =?utf-8?B?L041RDBuc0docGxNc0tjWWlDdFhqQTlMNGJhQ0FMYWo1blFaTGNvOUhYclR3?=
 =?utf-8?B?bkR3dGtTSmYwbVpJSTBPTldOazJhbytEVXlVYnZWS3g3OVRHMUEvTlhsdUth?=
 =?utf-8?B?c3RkV3FEakFkK0RBWGhXQmIzajdvN0hIU3VQSEhNRmJjWHkySWRSblRrcmRJ?=
 =?utf-8?B?TzZUaU4vVzBzOTNHcEFTN2d5SXV2ckNjYlB5eGFjTlhUQkFmSzVjK3BKUTF3?=
 =?utf-8?B?ZDUySlF2bEZSTDdoV0JMaW9QVngxakNVSE1VSGQ4R25GNmhNakMxd0pmVk03?=
 =?utf-8?B?OXE4RExIa0Y0Z1lYTG81bDdtdzI0Q05pMlhaRklvejVOazZlNzBrVWxTSWVq?=
 =?utf-8?B?cjB0VytaaFRtbkFGaFREM0F3b1owWlV5Q0pDRkVFaGxPUm9XaXRJRGx3b2RV?=
 =?utf-8?B?TXU4SzdMelpTRStLcFYzT0Nqcm1sMjFpZXp1OHBiaFJ1ZUF5b0UwMGJSME54?=
 =?utf-8?B?T3NMZkZjS3JZUkpnZG40Q2pmd284MlZyK3NUdnVlWnJOeEdZb1RxSEk1TTQ5?=
 =?utf-8?B?OEpFVlM0RWNVLzlMcWNLYmk4dGFVS201V1NuSWllcENSTmdQU0dxcWFCTksz?=
 =?utf-8?B?WC81U0VFQnpaZG9MVDRyQlVVTkVGa0YzYlc4K1BuTG1UR0dmU0RkU2dKZkpX?=
 =?utf-8?B?YU8rOFI1eGxXVmxNYWx2Z1FUYjFFb3RTUWFYeFhpalVIelcyYlJxbUNFdFRD?=
 =?utf-8?B?end1RDdnUjhjdUF3K2JLaVd1Qk43eGVmdEdKdlBobjUvOFlJVHRTTFBPYUM5?=
 =?utf-8?B?a0VDak4yQXhaMmJxTy91SWlvVHZiZ2c1cVFIeFQ5N0pwNGF4UWgzbzc0QXEr?=
 =?utf-8?B?M3JpVFpTYXVlMkY2NTRlTTV2a2M5Uk96NjRGUlFNSGVSa3lubkkyc3B1MlhI?=
 =?utf-8?B?SllXWDlnUmxPVm5yM1FaUDFvOUdMUWdBMFdaelRWZ256RjdJcWYydktyeHRu?=
 =?utf-8?B?TzZkYkVRTEtrRmtSNFc2SVJuM2RoTHZjcVM5eHBGS3ZHYTVoR1FXRjdhZlhH?=
 =?utf-8?B?MzBjSGZwUjNhZVN1c0E3eC9Wc0wreDR0OWtLQ3VaZXNMQldLbnFZZWVFY0d6?=
 =?utf-8?B?R3RFaVNGdzl6cFF6Rk5KWVhxSTRZQUtRRG1hb0tXSTRnUzR5UzNIa1pjbG9H?=
 =?utf-8?B?VkhmK3dFazdRQ1ZSMzdraktPa0pwQ1NGQWJtUzZKVElaOFNzK2ZsWklKcWNV?=
 =?utf-8?B?ZWtnaFNNLzhRUS9WdGRIL1J1bEhSUnVzVkZHTnZxelRaZTJkdWpNblFHUmlB?=
 =?utf-8?B?VFBNN1NKZG9BeVZhZjBBYmpnSUZBTFE4OUdRMk9pc3NlWHpEUkJYNkZ4T09I?=
 =?utf-8?B?Wk1EdWRmc3RHVmg0bDdZMTBYUzJyTGJBYzRzUXNGZUExbkpPcm96dFFjdTBJ?=
 =?utf-8?B?ZVVZY2tJaWFHc2YyQzh4VjBsWWp2RGtvN1U0RytsUUxVNkNqMWcwOEwxMWF2?=
 =?utf-8?B?Umw5bDM0ekVWMFNlQ3pQM0pKZit5YVZzRDQ2ZE5iQ1BRWUhmMmdYSm41YkRM?=
 =?utf-8?B?dlBBcWxVZENGUEtGMkpWTjRlclkxMFlFTkx3bkNVdnJCc05xSkplZEdldEpy?=
 =?utf-8?B?alZ5WVppYk9QN3M2ZjRlZWg2Sm1sN0VsY1BaRUtJU2tXM2RQbXphdU9SaXR0?=
 =?utf-8?B?SWRXUy83MW41Q01obU1nUmFhSjcwMWMydVZLT09kZVNDNUtaR045Q2xSR0Zq?=
 =?utf-8?B?TzB5K2NzcWl6VWt3UFlpWnU3U2RDZU9vK3pnMkw1Sithc3JIa1RWV2NLbm9F?=
 =?utf-8?B?aDlCS3NnSVQ1NVhGd1BnUTRVQ25Pb1luUzFRUk1XRG9kd3Y4UWpMRnJzZFVv?=
 =?utf-8?B?SnJFVjBnR0VsbUNva1Z6TWlIYzNhQUZOcC8yZWVtakp5OXBrQWp1dFpkRk1Q?=
 =?utf-8?B?VGhLbHdNZmxxYTZ6NE5JTzJwRFRpTGZudUZNSjE2S2tHdUhZcFhrcVZPcElz?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YDGOvDNGlKHstIaRuxhKt9UKOO/S7AdQlgQPN9X9WtsQgHe4kzQDD9oueHjQ1jotFlrXmGrJt1Y3NXberq/mbxbViV6uzezlReWXsyy5p1Vh5H1+Ko0svHO4Cq9Zb7LKRsEv8tAJI4QmRzDoOIvAkD+D7xeoNeMsISWX/5bjQGdxGkPwznXkOk+4p4JFveeGNTF8SxqNLtHzjdpcnSG+mhLKNpgvEJmx7FvlCsy1bPpqU/2T39uLeFyf4S8V/Uj/kPcllbJQ7tklpaJiLvZtZn0ZqfVR9BSTrFs3vl3kjdj8oGVUJjQPM1h6yVpplTwa/ebMfLCPdoQHz+O/ageTh+ZoWHY/xTqn2ye2VckbWjG2V2BF8iwqUS2c/Q/x6/vJvXS3/WgPR7vjTTwZZCe5dktic2D9/m6FbSEF7+HMOERKjsbGB35NAjh9EMHyd8ImhfIWB2bEy4rTOLqtr54Ck4rN4R7JIjrHyKZfHxBhXkrBYQifDv2DFeK+N8HLnANGNEXQSsiWtI4j0R0t/CYvVRUzDl7wFz1vTOyckiB+nWNPY7BhU8cYr21ABd4uHBbzp1aHk40ST5D5HExMW0s7Ngb6aEgh5jfZPd2cWtMPTos4+uIQx1AYbhD6qQ5I4XSmQOtYHjfcetTn6mjRUgj184OTqfbNf2ar5NmD5gYpG54P5ta2tTPlYJQBRf5T1OvdAuHUCorxo27MMvFhBEgWwNb3CyAp+mvmenihPa7VuUR2u9SL/QS8ejePQ7nQZ3qpvVyRxjVKIE6zp/gx9Sa7Wp3UB3g5T1JAQQM9tvCZNqonebbCI4JKAcVDnS/ArC3j
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fb6e008-abb0-462d-9b1f-08db086c6181
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 18:02:59.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F02A5nS/WbPBhXW4saZ18ko8zfFhbG4nsUHhykMlq7mF7dqCb/pfcuRFYMleFZarYKT0rpc4dvKj35HbYbCI0HwkfMFOL0OvDxJAWZ5Jusk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6478

On 20/01/2023 7:44 pm, Anthony PERARD wrote:
> No need for $(AUTOSRCS), GNU make can generate them as needed when
> trying to build them as needed when trying to build the object. Also,
> those two AUTOSRCS don't need to be a prerequisite of "all". As for
> the "clean" target, those two files are already removed via "_*.c".
>
> We don't need $(AUTOINCS) either:
> - As for both _libxl_save_msgs*.h headers, we are adding more
>   selective dependencies so the headers will still be generated as
>   needed.
> - "clean" rule already delete the _*.h files, so AUTOINCS aren't needed
>   there.
>
> "libxl_internal_json.h" doesn't seems to have ever existed, so the
> dependency is removed.
>
> Rework objects prerequisites, to have them dependents on either
> "libxl.h" or "libxl_internal.h". "libxl.h" is not normally included
> directly in the source code as "libxl_internal.h" is used instead, but
> we have "libxl.h" as prerequisite of "libxl_internal.h", so generated
> headers will still be generated as needed.
>
> Make doesn't need "libxl.h" to generate "testidl.c", "libxl.h" is only
> needed later when building "testidl.o". This avoid the need to
> regenerate "testidl.c" when only "libxl.h" changed. Also use automatic
> variables $< and $@.
>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> ---
>
> Notes:
>     v6:
>     - rebased, part of the patch commited as 4ff0811
>     - reword commit message
>     
>     v4:
>     - new patch
>
>  tools/libs/light/Makefile | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
> index cd3fa855e1..b28447a2ae 100644
> --- a/tools/libs/light/Makefile
> +++ b/tools/libs/light/Makefile
> @@ -148,9 +148,6 @@ LIBXL_TEST_OBJS += $(foreach t, $(LIBXL_TESTS_INSIDE),libxl_test_$t.opic)
>  TEST_PROG_OBJS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t.o) test_common.o
>  TEST_PROGS += $(foreach t, $(LIBXL_TESTS_PROGS),test_$t)
>  
> -AUTOINCS = _libxl_save_msgs_callout.h _libxl_save_msgs_helper.h
> -AUTOSRCS = _libxl_save_msgs_callout.c _libxl_save_msgs_helper.c
> -
>  CLIENTS = testidl libxl-save-helper
>  
>  SAVE_HELPER_OBJS = libxl_save_helper.o _libxl_save_msgs_helper.o
> @@ -178,13 +175,13 @@ libxl_x86_acpi.o libxl_x86_acpi.opic: CFLAGS += -I$(XEN_ROOT)/tools
>  $(SAVE_HELPER_OBJS): CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenguest)
>  
>  testidl.o: CFLAGS += $(CFLAGS_libxenctrl) $(CFLAGS_libxenlight)
> -testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
> -	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
> -	mv testidl.c.new testidl.c
> +testidl.c: libxl_types.idl gentest.py
> +	$(PYTHON) gentest.py $< $@.new
> +	mv -f $@.new $@

Doesn't this want to be a mov-if-changed?

We don't need to force a rebuild if testidl.c hasn't changed, I don't think.

>  
> -all: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
> +all: $(CLIENTS) $(TEST_PROGS)
>  
> -$(OBJS-y) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
> +$(OBJS-y) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): libxl.api-ok
>  
>  $(DSDT_FILES-y): acpi
>  
> @@ -196,7 +193,7 @@ libxl.api-ok: check-libxl-api-rules _libxl.api-for-check
>  	$(PERL) $^
>  	touch $@
>  
> -_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
> +_libxl.api-for-check: $(XEN_INCLUDE)/libxl.h
>  	$(CC) $(CPPFLAGS) $(CFLAGS) -c -E $< $(APPEND_CFLAGS) \
>  		-DLIBXL_EXTERNAL_CALLERS_ONLY=LIBXL_EXTERNAL_CALLERS_ONLY \
>  		>$@.new
> @@ -208,14 +205,22 @@ _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
>  	$(PERL) -w $< $@ >$@.new
>  	$(call move-if-changed,$@.new,$@)
>  
> +#
> +# headers dependencies on generated headers
> +#
>  $(XEN_INCLUDE)/libxl.h: $(XEN_INCLUDE)/_libxl_types.h
>  $(XEN_INCLUDE)/libxl_json.h: $(XEN_INCLUDE)/_libxl_types_json.h
>  libxl_internal.h: $(XEN_INCLUDE)/libxl.h $(XEN_INCLUDE)/libxl_json.h
>  libxl_internal.h: _libxl_types_internal.h _libxl_types_private.h _libxl_types_internal_private.h
> -libxl_internal_json.h: _libxl_types_internal_json.h
> +libxl_internal.h: _libxl_save_msgs_callout.h
>  
> -$(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS) $(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h
> +#
> +# objects dependencies on headers that depends on generated headers
> +#
> +$(TEST_PROG_OBJS): $(XEN_INCLUDE)/libxl.h
>  $(OBJS-y) $(PIC_OBJS) $(LIBXL_TEST_OBJS): libxl_internal.h
> +$(SAVE_HELPER_OBJS): $(XEN_INCLUDE)/libxl.h _libxl_save_msgs_helper.h
> +testidl.o: $(XEN_INCLUDE)/libxl.h

I know you're just rearranging existing the existing logic, but why
doesn't `#include <libxl.h>` not generate suitable dependences ?

~Andrew

