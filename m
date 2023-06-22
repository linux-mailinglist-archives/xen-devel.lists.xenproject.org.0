Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A2673ACB1
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jun 2023 00:50:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554185.865234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCT7I-0008Pu-1a; Thu, 22 Jun 2023 22:49:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554185.865234; Thu, 22 Jun 2023 22:49:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCT7H-0008NB-UL; Thu, 22 Jun 2023 22:49:27 +0000
Received: by outflank-mailman (input) for mailman id 554185;
 Thu, 22 Jun 2023 22:49:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SyBn=CK=citrix.com=prvs=530397782=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qCT7F-0008N5-RT
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 22:49:25 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 07030655-114f-11ee-b237-6b7b168915f2;
 Fri, 23 Jun 2023 00:49:23 +0200 (CEST)
Received: from mail-mw2nam12lp2040.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.40])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2023 18:49:19 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BN9PR03MB6201.namprd03.prod.outlook.com (2603:10b6:408:11e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 22:49:17 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6521.023; Thu, 22 Jun 2023
 22:49:16 +0000
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
X-Inumbo-ID: 07030655-114f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687474163;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sCeWMgsH97p70MTqUVai3FoPThVuoBOHW56QVdTtVuY=;
  b=At2wFCpjj99eaYMLAS/4WSncvjn6dpwr4lx96l+eFMa+ITkr8hQELqPu
   k3OCeNdL+ZG/W/kKojasy7OY9DuiFYT9IR0u6orOmQSLt0AgNyQig2ldu
   7fJ1SVDDxFlZVJA1Dpx0d7Onu1mT9PO2OvmaKv9noinu3Qdjra44xE0UG
   M=;
X-IronPort-RemoteIP: 104.47.66.40
X-IronPort-MID: 113699900
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:swiK1qABolROoRVW/8Hiw5YqxClBgxIJ4kV8jS/XYbTApDxz0jMAz
 TAcCm2EOvnfM2qmctF1ad60oxxXvJSHztRhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1C5ARjDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwp8xsHEF+t
 vgkBR8ucTSAie6W0JeHVbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xruwA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37aUw3KqCdpKfFG+3vAtnkSi2kFLMgQLEnzli/qIt0LncPsKf
 iT4/QJr98De7neDVdD7VgakqWWFuTYGUsJMFPc37g6MzKfZ+QefCS4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9MXcPbDUfSg0t+dD7vIYpgxTAT9BuHbS0iNKzEjb1q
 xiIpiUjg7QYjeYQyr62u1vAhlqEpIXNTwMzzhXaWCSi9AwRWWK+T4mh6Fye6OkaKo+cFwOFp
 CJcx5DY6/0SB5aQkiDLWP8KALyi+/eCNnvbnEJrGJ4isT+q/hZPYLxt3d23H28xWu5sRNMjS
 BS7Vd95jHOLAEaXUA==
IronPort-HdrOrdr: A9a23:8h8tb68iUcCuhZ0tOXxuk+Hvd71zdoMgy1knxilNoENuE/Bwxv
 rBoB1E73DJYW4qKQsdcLC7UpVoMkmsiKKdgLNhSotKOTOHhILGFvAb0WKP+UyEJ8SczJ8q6U
 4DSdkENDSYNzET5qqKg3jbLz9K+qjhzEncv5am854bd3ANV0gP1XYcNu+cKCBLbTgDIaB8OI
 uX58JBqTblU28QdN6DHXUAX/LOvZniiI/mSQRuPW9l1CC+yReTrJLqGRmR2RkTFxlVx605yH
 PIlwzi6r/mm+2nyzvR3W7a6JRNnLLau5l+Lf3JrvJQBiTniw6uaogkcaaFpioNu+2q6Ewnip
 3lvwogBcJu8HncF1vF5CfF6k3F6nID+nXiwViXjT/IusriXgsgB85An45CNjDywSMbzYhB+Z
 MO+1jcm4tcDBvGkii4zcPPTQtSjUaxoWAvi6oopVk3a/pYVJZh6agkuG9FGpYJGyz3rKo9Fv
 N1NdrR4PZNfUnfUmvQuXN3xsewY286ERiHSHUTo8D96UkToFlJi28jgOAPlHYJ85wwD7Ne4f
 7fC79lkLFVQtVTZaVhBP0ZSc/yEGbERhjLN3+fMEmPLtBcB1v977rMpJkl7uCjf5IFiLEono
 7aaUhVsW4pd1irDcGVxpVE/grKXH62UV3Wu4djzqk8noe5aKvgMCWFRlxrudCnue8nGcHeW+
 y+ItZRGP/sLWznHIxN3wH4RplKIXQSS8EOoL8AKgqzi/OODrevmv3Qcf7VKraoOy0jQHnHGX
 cGXCL+PoFY9UagVmXjjBWUUGOoeUri5pV5Fajc8YEoudUwH7wJljJQpUWy58mNJzEHmLcxZl
 FGO7/ikrm2vy2q5m7O9XxuIQdBFU5b77XrTmNSqWYxQhjJWIdGn+/aVXFZ3XOBKBM6ZdjRCh
 Rjq1N+/r/yB4CMxAg5YujXel6yvj82njanXp0ckqqM6YPOYZUjFKsrX6R3CEHiCwF1owB3s2
 1OATV0DXM3Vwmew5lNvqZkSN03ROMMzztD5vQk5043gH/s6P3HgEFrHgJGH/TnwTrGDAAk+m
 GZu5Vv/4ZoMwzfdVfXxt5IeWGlrA+scex75MPvXvQKpljmFTsAM1uilHiUjQo+dXHt8FhXjm
 v9LTeMcfWOGVZFvGtEu5yahG+cW1/tDX6YUEoKxLGVOV62yUqbi9X7F5Zb+1HhGmc//g==
X-Talos-CUID: 9a23:YCxex2wny4grGJcfgKE2BgVJMNs4Uk2eyEv9DGynLWVnRJ2FbGOPrfY=
X-Talos-MUID: 9a23:+9Y/Ewg8Awr1VQJp+q32gcMpOoB2+pWyJRg3iIhBnJeuNh1NN262pWHi
X-IronPort-AV: E=Sophos;i="6.01,150,1684814400"; 
   d="scan'208";a="113699900"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3HMR2D9oHb5zhKdVjrJP2xaGip0av/iQt/v0VRiigQvSJ/e5+yl0QhSydVE0xZdPEXXv00O476+I8PKoEUWLWt8AkzePVc02on7QhDijVnUBpR6SCIAATyTCr110wXn/sCz/cNXzZVhtC0w7SHmJf7F/RqHKOOZHadQ6c8e9OdtCcaGYc50RmSpGSo0XWNHArLOA4Hhje59iCuY2RIfbkyUb4kAubK+bkNzVQBGDuP0mNh0+nghFetqjNv8wxHn8V57chvf4kO8uzRQzecd7iAdL2QVKGs04BvUgkRRHTgTFFBbcb+aw7d6O4ZmuksbPCa0xHlGidLFHY1JYAzeMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UE5A1DoJf6f0CukC8p7GbsiMKdDyxC78NP6pfzbctag=;
 b=c18DWS1ueJUtBvzH+YHoTLjU9w5ESFEEOuhQLG7MY2f2TexkCFWoPtqFW8z4I0ztyNscvIn3uMaYEKG+koVVcuLwEGmB9V3Ht9YIm2pubJM3a2pyPz+ZkRLDyvEgPsOFD2GgQUKPOLM4GhWrJWRYGvlXmZTMMBE73/OZnUjU0H+6eEJPiwRphXtG4MjSupi230EA2mtW8ySvIvKfknCuaGqvTb22ymajI2Vk7lMEmn6iGDGBk/R7he6U/qmy1Y1jg5bZ7C1wnq89bDtPUHoSMy15HFyEvzFkkz0xfcaLlJ/am2eXTMcfH2lsgdZLiAW0zKXXdPeO1HhjV74JPRdrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UE5A1DoJf6f0CukC8p7GbsiMKdDyxC78NP6pfzbctag=;
 b=PNYmQbnM5rt2RAoP/v2LBt6u7r9S/DD2k2lGaQm+Pmjm9lQqg4gKr1FVsG19RmuJpo28laUFhI0OieIaGlnKClTVoKFOApunLMf472/64+J2IWhFNjgZr3ew64WFMP8j+bWH+qz6sA22i35aMj7B9nZ4XBZYks2+JPN4gcM0tog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bfaba0e5-36e9-b201-30fd-b96add91cb1c@citrix.com>
Date: Thu, 22 Jun 2023 23:49:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
 <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
In-Reply-To: <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BN9PR03MB6201:EE_
X-MS-Office365-Filtering-Correlation-Id: d53dd242-472b-4ebb-ee05-08db7372e854
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qwuauzA60EWQCOgoVXjPEdEbkwWjttehgVO88IuaIZH+n4qOsLArS3y7YpKXwmvRppOA1GQ3ukLTA7Pn0i6FhLv3sHz3y3v/7yw5+Bi2scpaD9aBqVDi/BzfIFjWcvgZoaJr9Gy3HjNU0dPHfVnNiGdx7Yfvholq+pTfZ2fF3qf1jV7ZXqsMF59wvXZE2jcu9RcebDdqj4xKPslVcfMBxxpMxzSXUwMcaH/o+j1HzTfLZtZYUs9s6sRTnhCN6Zn2KWg0fcG/2L6zK+ffCH1w/hvZodCZRWRRj/LuuY3haF7eE1hhZXrd8/eJVDHpw2gxzFhHmPXu6z+cATF3o44rYkzS/4Mf+OvX+b+Lz/InCvmPvwxBTbcoyGvFrbT/NT2BpHIis5/k4D23ruwPN2ah97fYh8TRKHYZfVhkfd3OSW1mVE3C3jNqXINRl17x5gPopyr31XOmEFQavEeldSFINMYdrNhgPT3xFKpkaw78vamtt6ca77YXADXCSjKbUSDovY2C4p6LkJJTazlssOA1D8M7zfIJE0RTDO5jy8uSY16++rQnD8y3qjElKhITWRo/Xtz1v0Ysr1ztXFHjz+rPz7wlhisNarYTVgUCLwS0TjOnhaWIt9QUZ4ubq931Mnb/YvdyDAnUnUy5ui42Brm+FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(2616005)(54906003)(86362001)(478600001)(186003)(31696002)(6666004)(6486002)(66556008)(66946007)(66476007)(41300700001)(83380400001)(316002)(26005)(31686004)(53546011)(6506007)(4326008)(6512007)(5660300002)(8936002)(8676002)(36756003)(2906002)(82960400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NVhub2ZWTUVRRXhjUkYyendEc0VIT3ZpN1Y3eDJWSDl1Q3JMblJiQUVTdWtY?=
 =?utf-8?B?K2ZyTHNMS2VNblJUTUUzTmdoeHJDNzUxRXorRHNieVUzTlcvMGdyZEhhcGNx?=
 =?utf-8?B?MXQrbWFMWXRHaEEvdTcvZDk2bitCTGM3RU5qa0JKTGtuYVJySCtCTkxQeEEw?=
 =?utf-8?B?V0NpY1IwYVcrZ29xZkt1SXFyVXB6cjllcEpYbDdmMk44b2l0OGJKNDVUbmFu?=
 =?utf-8?B?UFFoQWEraFBXUEsxQTVWRlJNNWxodFI0UDlKMmdmOWdSbFUzK2RrbjdXSTlw?=
 =?utf-8?B?cWZSbWdKR29NRDdUK1BoVE9JdHRxSnBBaE8vV0pGZjBoUXJ5Ni9JUEJvenB6?=
 =?utf-8?B?WmFxdGVwV0hOQVZMMXQwOXBhL21TVUdZYzlDT0Y2Z0w0TTYyWFN1ZDdhcDdy?=
 =?utf-8?B?dy9INWZsRG5vSUdrYnRQazhpTlkwYkJOKzlGT0pzNE5KREVrSjh3NTZaWi9Z?=
 =?utf-8?B?TlVCNWVjalhuZkVoK2xNblNDUjE4dmNHQkxaaU11eHp6SDdtYjkrQnJvSDhO?=
 =?utf-8?B?dnZOV0g2YkJRNERBSzFrRk9DNEpGZGtrNGFiZXJTUXh3S3JmZTkvSG5Pcjlp?=
 =?utf-8?B?OVdxelREdzhDVnJBS0p0VnFjeFhkekN1aVoySVhaU091WUg0TVVyT2g0czQ2?=
 =?utf-8?B?Wk9JUFFqcElUSWVDajdrWklYeWZ0VUEzQm9vK1FVM2FyMnN1S1BXajArS1BB?=
 =?utf-8?B?VjlzMGtmendFZ0szNDZBL1B4MTBsZEg0NzNNV3cxRUxMd0RnalFtUHphVkor?=
 =?utf-8?B?T29adHU2UEtXd2lrS1N1YkZhSi9OQmZKdG1IYytuWmpUZUlpTUt1Nmd1c3pP?=
 =?utf-8?B?TGhrd0Z0VWQ1K2NwWm44czZoZzhRYVBZMDRhdWF4eDUxckg4N1FQRStWQzgx?=
 =?utf-8?B?dWRhbUZ6ckdtcTZrTFdCQ0lKcmtxRXkrQkxlby9iL0ppZXJsU3dOVEJla1R3?=
 =?utf-8?B?Y3ExN1pSUE9UK05DYTQ2VGpLSU9zdnh1MS9kT01IUGZScWlReGttd1pWVlZq?=
 =?utf-8?B?MnJoeDFBcGloLzFSSjRheTRsU2dxYWF2c3I0bDlKODRwTVlyTjlzVnRObzJV?=
 =?utf-8?B?Szd1MjdsY0JFMEVldEllQ2lpZS9LNFAwQzFNNEFwQWYrdzkzV2M5MmZ3Tlcr?=
 =?utf-8?B?OTduVjViMDY1SWtrZGJMRGhFN3JZVHJaaXY2ZXlkMWl6QzZXcXpXclNjT2Nn?=
 =?utf-8?B?eC9LS2tGRGlVRXRMTURIK29xM0R3ZjJOQXk4ZWppcnlhNXNBTGlvYkF2c01z?=
 =?utf-8?B?YkJONUg1ZkZ3ckNnQ1UrVFZZV2FnV1BPYlBDZUpKMGsycmF1bXVGWnBGWDV1?=
 =?utf-8?B?TTcvREduRU55ZERsNEM2R2ttR1M0alB3ckxXbmU5S3AxZjF6NmpaUG84Umlm?=
 =?utf-8?B?dEtwRWNtajZJQXJVN20vZVZZTHI4NFQvR1RNdHVJL243b3A4eWR3VGR1THBv?=
 =?utf-8?B?N1FGMXRmbkpYMXBZV3RVOFdZNmdpTTQyMm1yczNWRWl0ZmxDQS9IT3RKWFZJ?=
 =?utf-8?B?UTI1NkpWR2UzRGRyVFZrVlZGZE9oOWpKckQwWmxRbTcrUFlJOGc3d1BIcENw?=
 =?utf-8?B?YWhPMFlhMUwzUTVTS0U2S1d2YTloRU01R1E1NVJ1S0g4VU5KNmpvTExRQ1Rp?=
 =?utf-8?B?d085dkxOM0R4MDRTUW9wSjJGYXZQQWxBaDJJd2NkNnRVamNrOTBBRlRPUk9L?=
 =?utf-8?B?bXpuR2pOMVdBTUhLVk92bHpEbVVLRE5oL1plWVdzTmt0TVRSV1ZCc2RnakQr?=
 =?utf-8?B?cmdldERpK0FJZldOYXFOYXF5L295S0x3Rm1YbDRmTVE5MEVCb2NRK2JMWkp6?=
 =?utf-8?B?QUFYUFh5cE1hUlZZaWtaSzdseVl4UVNpdHg1YzZISytGMzhVQTBlTlh6ckJm?=
 =?utf-8?B?aWprWDNZRnhOcEE3UjdmcExKZkk4MWQ1c0xzNjBoMEdaL2dMaGZHUGlVOTlW?=
 =?utf-8?B?V3RMeXIveEFrSEQ1WHlUd3BnQktiVXFWM3Q2ZlJnWUJybUZKSlBKOTRrMTBJ?=
 =?utf-8?B?emFmZFJaWHBPQVRqUVUzSE1DclduZnJvQVFTZmZkZS85WlBjaUt5UFhaNCs1?=
 =?utf-8?B?RDBYQUZad3o4YSs1VmJqb2dzWjJtdk9GYzVPYUNwVjhsNklEQ1gvNjFiOHpM?=
 =?utf-8?B?clQzTlN2ZGVzR2xJQncvZkZuc2dmbTU3VnRxeXF3Y003UWVGM1JKblJ2ZG9k?=
 =?utf-8?B?eEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zGXF1FY9FPdIvt3V/emV6qIyHUsY5NEy7pOMhjbvotnL9S8PazBnGQF/qrG286MhSgrIvS17KWSS7jHv6et2B5dn+d/BB0A1i9SLVRIWrYlThks+lBgA+7xST4e1Rnl4zTnKJ8aD5z0AR5tsU2WNN7CXqpIFLurI063eRYmT/+YDoiJb0m2g8OoZfQiJoOavOECJ1aMO5VND4sfurzjFHn+D0rt4QEIpr3xDbYf+zACpGZXn4tcWR3asJlDTkee6ZLB81uy7eYlP4FEOFZ4sxZpNmeYQGi4f6Un/IIo8E2CrlY6XwrAwSynKoBNNA9ZyEJdSA/JLns+IPrQexjRfTB468xZomApVF/MGJm31qk+xf2z6vP2rNzwR0Y/64D1Z3QxS2bvmsO6Qr2jozCFZU9NkASuKSPMGuBSxiIHVbOnZ2KC966bl+kP9+etgHQ+/GUXEo95zPoG0MBDQm0pkWVWUy3BRRwBWqJheIldjU3Ji8mYRXqGo7zHK3AZ3mH3Q406ysjr1XhHUa6au4mr1Gz4wr/Hv7GRE1Dt92wmsG1eKk8DcNNwNzgHJIpNHbFPUXGLvGfcNQ5CeXqf0emsmLZJc5q/LvqqeQ+PXMsaZU5MhoEDQ9ywhLpa1K9cO5z5pR/0GDmBffq18ZgTO2CiUIsbBc2/DApLzq3cClP/ksntMWbiCJtDnceRc7NEZ/7ScwnnqVUuuu1fdw+Tv0zHrTFvzvNq0TMDN51kA2/nHfmIReKk7OPOuHQHqQ9738eJwaDzr+F7MWAxl6jjNPOkPBmd8ikg1m8sNNXjN7uvCLjYCMMnCR2zN5Yh+LL/I3WoerUdZdIKqjRcDgqs2C9+QgkHWtomRozXLzUjsaItm8XD4sBFHoYg/LSS2g/nJOkME
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53dd242-472b-4ebb-ee05-08db7372e854
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 22:49:16.6845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFEL7oJhJPJtGtF4/ESBKi24cyvNKtBJx2WS/hjfrtYAFlVGVQnMIhOpv2dAF7X1EGTPzB2kleT/JW9k9F4/9XNJz4HTDVwISlMw61XHMeQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR03MB6201

On 22/06/2023 9:57 pm, Shawn Anastasio wrote:
> Update ppc64/head.S to set up an initial boot stack, zero the .bss
> section, and jump to C.
>
> Also refactor the endian fixup trampoline into its own macro, since it
> will need to be used in multiple places, including every time we make a
> call into firmware (see next commit).
>
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thankyou for making this change - it definitely simplifies things.

> ---
>  xen/arch/ppc/Makefile                |  1 +
>  xen/arch/ppc/include/asm/asm-defns.h | 36 ++++++++++++++++++
>  xen/arch/ppc/ppc64/head.S            | 55 ++++++++++++++++++----------
>  xen/arch/ppc/setup.c                 | 13 +++++++
>  4 files changed, 85 insertions(+), 20 deletions(-)
>  create mode 100644 xen/arch/ppc/include/asm/asm-defns.h
>  create mode 100644 xen/arch/ppc/setup.c
>
> diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
> index 98220648af..fdbcd730d0 100644
> --- a/xen/arch/ppc/Makefile
> +++ b/xen/arch/ppc/Makefile
> @@ -1,4 +1,5 @@
>  obj-$(CONFIG_PPC64) += ppc64/
> +obj-y += setup.o
>  
>  $(TARGET): $(TARGET)-syms
>  	cp -f $< $@
> diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/asm/asm-defns.h
> new file mode 100644
> index 0000000000..3db2063a39
> --- /dev/null
> +++ b/xen/arch/ppc/include/asm/asm-defns.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _ASM_PPC_ASM_DEFNS_H
> +#define _ASM_PPC_ASM_DEFNS_H
> +
> +/*
> + * Load a 64-bit immediate value into the specified GPR.
> + */
> +#define LOAD_IMM64(reg, val)                                                 \
> +    lis reg, (val) @highest;                                                 \
> +    ori reg, reg, (val) @higher;                                             \
> +    rldicr reg, reg, 32, 31;                                                 \
> +    oris reg, reg, (val) @h;                                                 \
> +    ori reg, reg, (val) @l;
> +
> +/*
> + * Depending on how we were booted, the CPU could be running in either
> + * Little Endian or Big Endian mode. The following trampoline from Linux
> + * cleverly uses an instruction that encodes to a NOP if the CPU's
> + * endianness matches the assumption of the assembler (LE, in our case)
> + * or a branch to code that performs the endian switch in the other case.
> + */
> +#define FIXUP_ENDIAN                                                           \
> +    tdi 0, 0, 0x48;   /* Reverse endian of b . + 8          */                 \
> +    b . + 44;         /* Skip trampoline if endian is good  */                 \
> +    .long 0xa600607d; /* mfmsr r11                          */                 \
> +    .long 0x01006b69; /* xori r11,r11,1                     */                 \
> +    .long 0x00004039; /* li r10,0                           */                 \
> +    .long 0x6401417d; /* mtmsrd r10,1                       */                 \
> +    .long 0x05009f42; /* bcl 20,31,$+4                      */                 \
> +    .long 0xa602487d; /* mflr r10                           */                 \
> +    .long 0x14004a39; /* addi r10,r10,20                    */                 \
> +    .long 0xa6035a7d; /* mtsrr0 r10                         */                 \
> +    .long 0xa6037b7d; /* mtsrr1 r11                         */                 \
> +    .long 0x2400004c  /* rfid                               */
> +
> +#endif /* _ASM_PPC_ASM_DEFNS_H */
> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
> index 2fcefb40d8..a7db5b7de2 100644
> --- a/xen/arch/ppc/ppc64/head.S
> +++ b/xen/arch/ppc/ppc64/head.S
> @@ -1,30 +1,45 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  
> +#include <asm/asm-defns.h>
> +
>      .section .text.header, "ax", %progbits
>  
>  ENTRY(start)
>      /*
> -     * Depending on how we were booted, the CPU could be running in either
> -     * Little Endian or Big Endian mode. The following trampoline from Linux
> -     * cleverly uses an instruction that encodes to a NOP if the CPU's
> -     * endianness matches the assumption of the assembler (LE, in our case)
> -     * or a branch to code that performs the endian switch in the other case.
> +     * NOTE: argument registers (r3-r9) must be preserved until the C entrypoint
>       */
> -    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
> -    b . + 44          /* Skip trampoline if endian is good  */
> -    .long 0xa600607d  /* mfmsr r11                          */
> -    .long 0x01006b69  /* xori r11,r11,1                     */
> -    .long 0x00004039  /* li r10,0                           */
> -    .long 0x6401417d  /* mtmsrd r10,1                       */
> -    .long 0x05009f42  /* bcl 20,31,$+4                      */
> -    .long 0xa602487d  /* mflr r10                           */
> -    .long 0x14004a39  /* addi r10,r10,20                    */
> -    .long 0xa6035a7d  /* mtsrr0 r10                         */
> -    .long 0xa6037b7d  /* mtsrr1 r11                         */
> -    .long 0x2400004c  /* rfid                               */
> -
> -    /* Now that the endianness is confirmed, continue */
> -1:  b 1b
> +    FIXUP_ENDIAN
> +
> +    /* set up the initial stack */
> +    LOAD_IMM64(%r1, cpu0_boot_stack)
> +    li %r11, 0
> +    std %r11, 0(%r1)

I've done a bit of reading around, and it's rather sad that things prior
to Power10 don't have PC-relative addressing.  So the LOAD_IMM64()'s do
look necessary for the stack and bss.  I guess that means we can't be
sensibly be position independent in head.S?

Also, why store 0 onto the stack ?

> +
> +    /* clear .bss */
> +    LOAD_IMM64(%r14, __bss_start)
> +    LOAD_IMM64(%r15, __bss_end)
> +1:
> +    std %r11, 0(%r14)
> +    addi %r14, %r14, 8
> +    cmpld %r14, %r15
> +    blt 1b

This loop is correct, except for the corner case of this patch alone,
where the BSS is empty and this will write one word out-of-bounds.

For RISC-V, we put a temporary "char bss_tmp;" in setup.c, and I suggest
you do the same here, deleting it at a later point when there's real
data in the bss.

> +
> +    /* call the C entrypoint */
> +    LOAD_IMM64(%r12, start_xen)
> +    mtctr %r12
> +    bctrl

Why is this a LOAD_IMM64(), and not just:

    b start_xen

?  From the same reading around, PPC64 seems to have +/- 32M addressing
for branches, and the entire x86 hypervisor (.init included) is within 3M.

> +
> +    /* should never return */
> +    trap
>  
>      .size start, . - start
>      .type start, %function
> +
> +    .section .init.data, "aw", @progbits
> +
> +    /* Early init stack */
> +    .p2align 4
> +cpu0_boot_stack_bottom:
> +    .space STACK_SIZE
> +cpu0_boot_stack:
> +    .space STACK_FRAME_OVERHEAD

Why the extra space beyond the stack?

Also, I'd put cpu0_boot_stack in C, and just LOAD_IMM64(x,
cpu0_boot_stack + STACK_SIZE)

> diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
> new file mode 100644
> index 0000000000..4d1b72fa23
> --- /dev/null
> +++ b/xen/arch/ppc/setup.c
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include <xen/init.h>
> +
> +void __init noreturn start_xen(unsigned long r3, unsigned long r4,
> +                               unsigned long r5, unsigned long r6,
> +                               unsigned long r7)
> +{
> +    for ( ;; )
> +        /* Set current hardware thread to very low priority */
> +        asm volatile("or %r31, %r31, %r31");

Is there something magic about the OR instruction, or something magic
about %r31?

For a RISC architecture, this seems subtle.

~Andrew

