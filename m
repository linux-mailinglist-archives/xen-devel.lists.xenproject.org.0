Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E399D7259F9
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544570.850452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pKs-00079S-E6; Wed, 07 Jun 2023 09:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544570.850452; Wed, 07 Jun 2023 09:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pKs-00077O-BJ; Wed, 07 Jun 2023 09:20:10 +0000
Received: by outflank-mailman (input) for mailman id 544570;
 Wed, 07 Jun 2023 09:20:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7E03=B3=citrix.com=prvs=515218b52=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6pKq-00077I-K0
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:20:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d50a6a9-0514-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:20:06 +0200 (CEST)
Received: from mail-bn8nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Jun 2023 05:19:57 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CO1PR03MB5764.namprd03.prod.outlook.com (2603:10b6:303:6c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:19:54 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:19:52 +0000
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
X-Inumbo-ID: 7d50a6a9-0514-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686129606;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lxSehOCXvTuK9a/M3jJsqqYW/nw6ZGiQ5JqxYviLNh0=;
  b=f8k/8eNcdggHBmI2aGlg36jDLpz/mRE1xBcxgnEOyuWI7zvgLeFDTzP8
   W9xBopC1SFGDkInqW5Zl5Qh14Eauq70BQeOMK0xh2yFh+43F0mxizrWkV
   sNo/Nk8cG3CCGgA6KLkjQTGUHqWbidjyPkiLj6yjrhGwAtkdejj0q135m
   E=;
X-IronPort-RemoteIP: 104.47.74.49
X-IronPort-MID: 111771539
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vyj0xqDboExQ0xVW/7Xiw5YqxClBgxIJ4kV8jS/XYbTApDkrhDQBm
 GscWTrVOPeNNmr0f9p3OYq//EICsJeAmtBnQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A4QRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6u0rAWYXz
 tkicx8CNymuqduq2JW4Rbw57igjBJGD0II3nFhFlW2cJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTK+exrsgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37aWwnyiBdlDfFG+3vs6pXO14UtDNDIXfmeyusP6oF+GcM0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBqW1qPe7gKdB24FZj1MctorsIkxXzNC/
 l2Um9LkAxR/vbvTTmiSnp+eoCmuIyETISkHbDUdUAoey9D5pcc4iRenZuhkFKm5n9jkAwbay
 jqBrDU9r7gLhMtN3KK+lXjYhxq8q56PSRQ6ji3VUXis6gdRbYusdYuur1Pc6J5oPIufC1WMo
 nUAs8yf9/wVS4GAkjSXR+cAF63v4OyKWAAwmnZqFpglsj6rq3iqeNgM5CkkfBs4dMEZZTXuf
 Unf/xtL44NeN2eraqkxZJ+tD8Mtzu7rEtGNuu3oU+eiq6NZLGevlByCr2bKjwgBTGBEfXkDB
 Kqm
IronPort-HdrOrdr: A9a23:FftSfKCpi50HNurlHeilsseALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPHjP+UMssRAb6KK90cy7IU80mqQFkbX5UY3SIDUO/VHYT72KjrGSsAEIeReOi9K1vJ
 0IG8QQaeEYT2IK7/oShjPIbOrIqOP3hJxA7t2uvkuFODsaDp2IgT0JdDpzX3cGCDVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+ww+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlZQnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDyqISU+G4Wfd+Qdrz0Wn5U6TgHPlr8C8bik9EdB9iYVQdQacw1Y8vflnuZ
 g7m16xht5yN1ftjS7979/HW1VBjUyvu0cvluYVkjh2TZYeUrlMtoYSlXklV6voJBiKrrzPLd
 MeTv00pcwmMm9yVkqp/lWHFebcG0jaHX+9MwA/U4KuomFrtUE863Fd5NcehDMl+I80ZpFY74
 3/Q95VfYp1P4YrhJJGdZE8qPSMexvwqDL3QSivyAfcZew60jT22t/KyYRw29uRPLAWwJwu3L
 THUE5ZvXM1YCvVeLSz9awOzSr2BEmjUTPxjuFY54V4sqD7X/7CKyeCSDkV4rOdisRaPffgH9
 qtNJVKR8L5LWXhFZ0h5XyEZ7BibUYlaok4pdo9RhaystvGQ7ea0dDzQbLtHoCoKzwjQ2+XOA
 pmYBHDYPp71ASQRnTjigPQQm7sfEu63b8YKtm9w9Qu
X-Talos-CUID: 9a23:EULEemAHUYgjXGP6EzlsqE4TQ/sASCbywy7pDmGBFX5OS7LAHA==
X-Talos-MUID: 9a23:qSzJZwlD/J5cmqJqxyIxdnpnZOJGxYOJWHwikL46stK+dgZhAxyC2WE=
X-IronPort-AV: E=Sophos;i="6.00,223,1681185600"; 
   d="scan'208";a="111771539"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dop8eDig57IE7alr5CDOMHwR7G40z5bB2Mvq4kfT4ZROJ1x39HnJIGs1sGr8lW+DMURE8+XGe3A4PZBtNaVtejvd4O91auPMcw0LiyARnrIVNSRzG6aXft2Afy3kZJWx6gCoeGqLiMYGXbVFNn0kcBQcUxallx035NF+cBSNOraMqRUVjvzeAJApbPYYKxXiFyQzWad9FKJnZhhOZg/uIoBIB1S2c5S6T9zD7hHRHw9Xb6Ts6PTlhUFKtpjCeE/7YZzmbD6HRBpVbsXl9QU2DheLa2oMJMiBi/CR4xKZ5WQuzX53T0swmoTM6XzLVr1pfGNCkpKJwGfbibr4mrsz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/siiXUBYf9Zsjtfi2bfaZ6N+sIbNb6Nnq5u30yeg/7k=;
 b=bWAzJHGiNlojx3YYCoJPwywFwWAB3ukqk7Y/+C6d1Db08OxwWjogCSRQqzbIUsZKQBmmA4easK+ZjGE/D4xgCqknezhqayEZoZ6/dsTRDKmd/drmKELU9C4SBdm5ogPi4BoSI74pmMz1i/7l3T0s7WPTy6bTuaZZB6FM97naozsFbNx9iIg9YP/M0DxbN/hBACrC0s3+X732CM7iNbS14VmJQ/Wl7l5XNfLjtApn6202mctw1Rt8dLHESDhhpTBMuFxcYyT/S65sQR5+uJ6CvweS5BN1NyOdA6WGgMCvDetCdXnzNFw5mGmWyRgNQb6lv0eo2m1kV1/ouh8a6fFX8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/siiXUBYf9Zsjtfi2bfaZ6N+sIbNb6Nnq5u30yeg/7k=;
 b=O8zo3qACKmLBa2yxnSpY8Ew+DpnM/RY8hI1hRPDD+cfVz9LAM1/FLXHvxEybLknSexQapCtwE6iCnQ06SHrpsxvZWKHDcOEK7jmwXBHYjNfnCnSpAXaXEqg47MRLtiY4xMA882Qx0b+Rf52cH6MpttmjpAxXhu9zy4SC/1doEWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <d2b5c125-3086-d66d-cd29-e7c31002a3c8@citrix.com>
Date: Wed, 7 Jun 2023 10:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20230607090120.49597-1-roger.pau@citrix.com>
 <d8048c61-4b81-0527-444e-fdf6f38ccb3b@suse.com>
 <ZIBLOYiAFE8gqUY0@Air-de-Roger>
In-Reply-To: <ZIBLOYiAFE8gqUY0@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0184.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CO1PR03MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: a2a6d48f-a194-4ce2-8300-08db67385948
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AFpwNnR3thvj+qbrSIBMPARdiiX7FVjRcxZmf5SwUlo8CkS+ZJ+fotBetvH3nUglwE2g6cjNG5M7/UyHb25OPwneF9jnAmBkSWJh/VBQInX0X/witzDbxzl4iStXIhy7RU9J3QY+t/jKC4VDQXsyCbOnAwPadQv16EtZe/1lW9+Z2Wh/pv86OuVBAZY3Fd87AJQ+IYWsIyDAWWzsd9EeqAzfHynKorsqSVGb1i4prPlZbISNw5VdOFL3kHaJPjIckGVDRZa7VJ70T9Yl6QpcnAhqejH8BXLmdNDvN7gZS7UfGI6QNYJNibTEfbNGrtop9/2fWJ0HdSf1OtkutNKrDGmFWQE+aSkk8upR7Jhf6ZQScfcNQQXnyKZBTBnghlsJ4uOHpvM9nZkvhJshrjKUIWH4q1y9YZ6t1iyF6qCRqD17L+RAeXU6xzVmaiwoaATY9TJqPpIIIc566Q3dO3UuApXksEancOHkrv7ezLKqprkCiOOmVRa1ZUxtqz0IAwVu3liPLLoC4p4p4ZTNNsqHFCRe8a5aDuf6BVTJqHZQQLLbflJKUuozLbgAB3JyjZFRaNiR5dPZW8YkV/vo1E9mAXxEiDcKs1tYz/JkC5criD8GRUp79hdhq3VChwnPGs33z/kstRJVug+curGNZVQR+g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199021)(86362001)(54906003)(110136005)(4326008)(66476007)(38100700002)(66946007)(6666004)(66556008)(6486002)(478600001)(2906002)(36756003)(186003)(2616005)(5660300002)(8936002)(41300700001)(8676002)(316002)(31696002)(82960400001)(31686004)(26005)(53546011)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0V1VVRkYUN4OUZWdGtNWXY3cXU4d0FTaVRDK0NOOHBJc3U4MWhKc1FJSnJJ?=
 =?utf-8?B?SGdtOVRjZW1yL0N3SnlPSHJNRDkxcGc0Z3RkNEl1M1V3N0gxVlM1VHE0NS9u?=
 =?utf-8?B?OFRQL25PUkdXREZVb20rc20yeFRveTFqbTVEbVU4Q2pkUGJHRXcvL2FHNXpk?=
 =?utf-8?B?RDdnY3NtWDdWaHhRdjlSOHl4cXhWU3hnVkV6RVU1ZHpMVnVxcVhYNlhiODMr?=
 =?utf-8?B?NWNINi9qMnFsbERwLysrSWF1WXE4dTNITWljWTFWaE9WcFJyUkpCY3ZHc0NO?=
 =?utf-8?B?TjdwSHhnZlRHNnY3VzQ2UEswT2ovOWtuYnR0UlNSRkwwSEdNZXdpOTgzQlNW?=
 =?utf-8?B?bU5WRWIwSGYrc1MxT2RheHdlbjJoOVRSU0hpVVY1NFRWSHl3UFkzcTVseTZO?=
 =?utf-8?B?R0lpam1jQWZ0cStia3AxOGxGaWkyckZRUXZWUmRUOVRjNk0xc21PWVpCNEZU?=
 =?utf-8?B?NGs2V3dtMFNZc09rNHJzN1k4bDBqS1RheTIwYnFsZmEwcUZaZzhzVEYvY2ll?=
 =?utf-8?B?L0hENmVMTTlUOU4zV2N5RzVtek9PS2dzc0FEMkpsNHBnSjR3dWJtMno3OWM5?=
 =?utf-8?B?bkhtWG5YcXJYbFNBUkd5dys1aHN0S3dyODUxaUc5cU5COVhCZlUraCthM3lQ?=
 =?utf-8?B?K3g3NmZGSG4yU1o4bnZUWTlueHpYR2FEdVZ1NGhoUXpnTUFaVGFJR3h2UWFw?=
 =?utf-8?B?OXAzME1CZW1UMkZpeXpjaFM3R3U4a0hFZ0VhczJSOFZUMTdwVlZVWU5mQVQz?=
 =?utf-8?B?cHVWRkQzTnJCQVdZbjB4b2ppSVlYcTVlRXdxOVMwWG5aSFJRNWZJVjJ6aWVw?=
 =?utf-8?B?bEpXa0lmczlHSDZZM1ZsTGtoQVNmNC9Vem1UWmZZakttVjl0Rnc2bU5SdzY3?=
 =?utf-8?B?YldrSVdvQWI3V0g2bStMN3JwYnZBalM4UW44YkpTdFY0M21WbzlxRnh6SDFs?=
 =?utf-8?B?NFVpTWlnOGRraTZEUC83QkhPZmkxUWtISHJWbDVRMTJBcDVEbjg4bkZFamVp?=
 =?utf-8?B?OStVQS9pamhUc09Tb0hWb0Y2SXgxSHZyWFFrblVZQ0oxYzc4cDV2bVMweVBC?=
 =?utf-8?B?YTFPZzdZSGpMbnBOTGNSQmRxTy9JQytyanV1dEpPaitIR1I3MWRid1lieXM1?=
 =?utf-8?B?S2h4RHVZSHFoVVlOWE1EbDNSNXpQYlQzL1ZWUzFIZk01SjBSVng2RFhHVnRs?=
 =?utf-8?B?cFJJM2UwQjZ1VTNGZmh6eVNNMTZGNTFucDZaWlRuVHQzQ1R3ZlBqRkVYMkVU?=
 =?utf-8?B?N0hiWVZ1M3NvQWxRSnF5dS9CZE1DSytpU3RFNEtPQ0QvOTZxVGFacGU2TVN6?=
 =?utf-8?B?b1VudU5ycngxamxEUzZ6VjF0NURUSEwxYXBoalA0Sk4vZDdReFNrU3F3YzJI?=
 =?utf-8?B?dForSVVHNDZTVTN1WUh2WEd6VkM5MkhvUnBLcXZJWjBoZG9OMXY4NTFMRC85?=
 =?utf-8?B?QkVKQ084YW9JOGNYd3BITjlaNFJ2MmpJYTZuc2hTTUtJRHEwT0xLTUN0V1V2?=
 =?utf-8?B?MFRvdkk3Z25PR0VKazM0eitqcXNaRzU0L1pNcTAxbGRKVW5zWW5IZUYveGlL?=
 =?utf-8?B?QmxwcVJkVUM3aXhiVVFkaWNyeTNBTlRnU1BxZmJ1RjdkNTNiVERQR0tkSmhZ?=
 =?utf-8?B?VDUzMkx2ZlBmd1ROeU9Ka1ZMSE9TVnlHUnQzOVJGRE1FYUZWYkdrTWFQWVBj?=
 =?utf-8?B?TkxqRXJsNUpsK2VENUUvY2RsdkF6N2taMXRmTFY2bjlJNU9TU2IzWmY4NzZJ?=
 =?utf-8?B?ekYzQU5lTGZLbzRqWXo1Qk40MmFFb2hRZDcxL3VLTU5iYlY0NzBsTEhibnUr?=
 =?utf-8?B?ZHoxSnVpQTBSU0UyNDh6ay8rbTRBTEMvVTFqSkhuZTZNcFQ5Tk04WkE0R3Y5?=
 =?utf-8?B?dDFWUER6b1NqNFY5QU9ObStMUWtkRmRPRHUyeS85T2lNT0wrc21OMmVoTW5I?=
 =?utf-8?B?WXFydDdobm9ybXAwNzc5S2tRb2Y1S3RWV1laTkh4czBFaXhEUENOUmRiU09F?=
 =?utf-8?B?SFNyeDF4aFF4MVhVSDVVSzJib3ZpS1g0YWIrZWJhZUM0YXVFeGs3WXNKSE9j?=
 =?utf-8?B?OER6YUxGc3pvZkdRVXkxRFp2L1BhNGxKeDJUV21HK21xUDdROUM5MDRybkNw?=
 =?utf-8?B?LytVRlRpaGY2aGdDWG9yTWFMSTFKTXhFZFl0bUE2ZWlmb3d4cDc0VHUwUlp6?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5oNLNdhzMHFP6midM1NHwbrolo4BkZggKXNzBWAwIvoVaMbEGCT6QriWQDobCNcp5Izas0xrDQ0t7n00InZT/d7HB20Egwbj4h0MhILg2zjGn735aaPl4VCIXJN9ihiOaFXyhoTbmYcI2F8U4zQPQJcJbg3U/9RnjAV4VpoijAaplf0wFFmCM18R8vWTQFteyjVtIgjd80vxSBtIk9tpjnUUYlygk2ST8Y13TbR3DmXRkfQAnlNgqeZ3XBC9LoJoiTxhW1ZE/3MXuigd2l+FANyAAiu83NAYcsmKquYc06Sn/GaMfO78wf68gKXoerfl+OCLYPdq0aB7s14IGMCgeiCZ285x4j+ztcSB63l3bi8mF391/Tk6o+kuM6TV16H1xLswemSd4DXDg/5A0ISut1ULvGG92e0mfF+dDJKwcReipbKqXo93y3waOzWDnjAw+/ejiI3eyb3g50J07u6ydLaqsAHPJ78sRtKl1DDP15xx8mLGjl405mpAQMWPUP84ZWU7g7eG+2jBWYgGCwayy0XylqnlZLodl6KOw1mfNhvtgHyiO9vhZ7aXHb/qJR0wvd04Zl2yZf27uW1IZm8lJHeYLFX3ITz6czdUr4D4P11jadZKD0Y+otTBB4rMCfRC+0PJaoZAk9MEVf5VtH2QBzM9oAI38vnz83zHYnWhqdOinjmhD1sgBMHtS+edCqy9wEBw9zni8GOnZvnRvijTNzeyizQswDyNdnzdaf34X/pWdq8lPff/s3+pgGENiF06K6DoUi+/olyF/6zjwlcHKGontirE99sWIKOmrV5wHj6m5FSiObJOxX2ZtHmgwvhDZ0dM1FPNgwmXtpl0TDO8f9gwU2R/igOdH3OZWiQsjs6Dg7ClLeofiF0VEQDhf9DY/3BJUu5kA+YnHqKTeMPqvZSTqKj3tDlHPrFBgDjGfEg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a6d48f-a194-4ce2-8300-08db67385948
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:19:52.0357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /y3Pf851/6HnXpR2BZKvE+KHPK9xRvm4qi9MzmJoVvRhled3bTvdFjLOZP6QJuydqh7USlyqBEEgu4wu/4o2uy+42M5oe8gBkc3gNsjV34w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5764

On 07/06/2023 10:17 am, Roger Pau Monné wrote:
> On Wed, Jun 07, 2023 at 11:10:27AM +0200, Jan Beulich wrote:
>> On 07.06.2023 11:01, Roger Pau Monne wrote:
>>> Guard it with CONFIG_LIVEPATCH.  Note alternatives are applied at boot
>>> using _apply_alternatives().
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> albeit the implicit ack therein is only on the assumption that (apart
>> from me) it is generally deemed better ...
>>
>>> --- a/xen/arch/x86/alternative.c
>>> +++ b/xen/arch/x86/alternative.c
>>> @@ -358,11 +358,12 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
>>>      }
>>>  }
>>>  
>>> -void init_or_livepatch apply_alternatives(struct alt_instr *start,
>>> -                                          struct alt_instr *end)
>>> +#ifdef CONFIG_LIVEPATCH
>> ... to have the #ifdef than the init_or_livepatch attribute.
> But the init_or_livepatch attribute doesn't remove the function when
> !CONFIG_LIVEPATCH, so it's not a replacement for the ifdef.
>
> IOW: it's my understanding that the purpose of init_or_livepatch is to
> add the __init attribute if livepatch is not enabled, but
> apply_alternatives() should never have the __init attribute because
> it's solely used by livepatch, it's not used at boot.

For context, Jan you missed the MISRA call yesterday where this was
identified as an emitted-but-undeferenced function.

~Andrew

