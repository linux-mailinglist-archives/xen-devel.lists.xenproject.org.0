Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7DF6E8231
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 21:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523783.814175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppDvU-0005Cj-36; Wed, 19 Apr 2023 19:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523783.814175; Wed, 19 Apr 2023 19:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppDvT-0005B0-VV; Wed, 19 Apr 2023 19:57:11 +0000
Received: by outflank-mailman (input) for mailman id 523783;
 Wed, 19 Apr 2023 19:57:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDf1=AK=citrix.com=prvs=466cd93b2=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1ppDvS-0005AZ-B5
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 19:57:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cb1f496-deec-11ed-b21f-6b7b168915f2;
 Wed, 19 Apr 2023 21:57:08 +0200 (CEST)
Received: from mail-bn8nam04lp2041.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 19 Apr 2023 15:57:05 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5590.namprd03.prod.outlook.com (2603:10b6:5:2c8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 19:57:02 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6319.022; Wed, 19 Apr 2023
 19:57:02 +0000
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
X-Inumbo-ID: 5cb1f496-deec-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681934228;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XY5n4IacEEi2TagWgZ5BUriE5NoAcsy2HbugFzefi7w=;
  b=F7vTZyWF4GR2be+TcHbVTLkCuRujLqJxxJBluEXywB0kvjVTx5m9hUVZ
   5BSvxWOUNlAJD0wdfQvwDq28l8HGzsn+tWINW9aPIgxZhdIgbHOwR7mTi
   8jLaIVAE0m4q/3497Z+viZhUvuxnfz1dlxn2Bj1zk93JzmERC7NYxqdTb
   E=;
X-IronPort-RemoteIP: 104.47.74.41
X-IronPort-MID: 106048928
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Bq3Ka6lm4O8CcbEzGDYYmFLo5gyjJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJOWD+DbPzZMTHwLd9xaNy18UoDvZ/Vy9EyTldprCk2HyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgX5Q6GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 ds7cy4XMTmAvuW32uLqR/Fvn90xPca+aevzulk4pd3YJdAPZMifBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVk1A3jOGF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtKSuXkpq8w0DV/wEQ6CUJVfHegm8CmtReafvB9N
 XZFwiMH+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313qiQhSO/P24SN2BqWMMfZQ4M4t2mqodjiBvKFopnCPTt0oSzHizsy
 TeXqiR4n68UkcMAy6S8+xbAni6ooZ/KCAUy4207Q16Y0++wX6b9D6TA1LQRxa8owFqxJrVZg
 EU5pg==
IronPort-HdrOrdr: A9a23:5nY2Eat2Cvs8md/WsvjXiaCN7skDU9V00zEX/kB9WHVpm62j9/
 xG+c5x6faaslgssR0b6LW90cq7Lk80l6QV3WB5B97LNmSLhILPFvAa0WKL+UyGJ8TQzJ8+6U
 4KSdkbNDSfNykBse/KpCW+DtY80J2m3cmT9JrjJzwEd3ANV0ga1XYbNu9DKDwPeOCRP+tDKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3ANrVM2Wgv7t57n1KdoA8W19jtQzJuVV6G0m2PCky?=
 =?us-ascii?q?BDmdzGOyYUVyJ4bF1nJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ARiO05w6wWHdYrTF1yuC+B3NkxoxB4vvtIWwWq6w?=
 =?us-ascii?q?ZhJCgEA5SJQ3MtD2eF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,210,1677560400"; 
   d="scan'208";a="106048928"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtLoD7zo9ZX2HtuWp0qQwQzK+3b88phfVWfLlOWehsipq5gQZnWxiijxdugYTFEXudRtxG00ep5DmiJ7kl9NUAzW3Mo3JU0Yd5kVhCWIk+IHbsfQg3+zLkZqdNIqSnqkFl73lDKaAANgEVa+Z+WkLbJ1xyekU/5h+L+PNLucaCvKG14QfrQPR8bsqybg2qdxUlT4NQ4EwvpGEKiuIRSdDiLjStkdmlBwYTQzl8GoEKrm8X9qCS9HWaEKmgQHedYSTPkujSG05+s9mJnVo1p7OAY6G8PxvdWPjcMM4Q4CK5u55nFFvmAk1Em4P/HBjfzIE8mfw7aOfUoykZdXjpxFRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IiD3lT9jsNQl5Yegvqz5+XSeV3o+sEPBLk96esFJqL4=;
 b=CKnc9cClRlErsVxD3DMO8ySgQiipZ4Xi4f88kncnp+eHKKFEYTPUSR4Z+MIXQRjYZG3GlCV8A55A+QEj9hHtv2YK7JPoboDpmeTQqM3F3j9w5y97TCwnUe6yGP18GXngDmHl32VVugCdU2Cm9yJ/Bn8+e8ne3dfObxM9Infvi7pq9MJ6A7q6IvNFK8FZmh9h1qr3akUQkPggitZByccUSIBhWrCuL1a7WvHzpYHiUxHcf2fTB1RWJEMV8Fvs6YBzf1YG3gr7wNhpZHPBjxuAfDe8RZTSIgOEhXpO1T8h0dPrzvdfFUXwJlqJiSLmfMZknjjg9z6Gght6nbxMNKwjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IiD3lT9jsNQl5Yegvqz5+XSeV3o+sEPBLk96esFJqL4=;
 b=p3bsYgm7Q29Yt8+zGbdvhYWKHP/69i0YVaTy43lOb+7G6Yk8uy0IsLzX3MNpupWyfx3NZmTeMKXNcnNi1VZgsAIZgtdDd1q0/3zPBuiYHnKoJF1Hl6nzKckd+E9qCc5e5HcfmRJFN+E1+Owzv6vbgM+koqz4sa9MTM12K33zJQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <53204261-3dac-579f-ede5-7acffd04f4db@citrix.com>
Date: Wed, 19 Apr 2023 20:56:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/5] x86: support cache-writeback in flush_area_local() et
 al
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <4b42e920-f007-186c-d838-a0294bfa86b5@suse.com>
 <ee33ad20-ef6e-504d-6987-59ccb166f8e4@suse.com>
In-Reply-To: <ee33ad20-ef6e-504d-6987-59ccb166f8e4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:338::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5590:EE_
X-MS-Office365-Filtering-Correlation-Id: 7253f363-ea9a-4a99-248e-08db41103e1d
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/wKxRnSGnDvf8a55hzqqlQ3PyWMw9VHJytEy6/vSCxG2ubAwFAf1jciDhijUrRa5vP+XieQT+aCD70iXjvai2KfpSmFFkCJS0aB2GxV6g3G27BySa6aa++k/XQX2Qz74FUS5butt+IJa8VjOS/WMVBwwPiPXRIp82VVRaA0WZHIDxbrIPe2rih6XVHqoRg5T5dkXS3BLOLGjHElvd+i2sqEan7TpQZ+HvSyIAOG+bJnNtPXKSTclxYklWuEN6QLK7i9glkWC6cJgOt37iqa/YUaF1RQvS/LM0AE71JzqKuqEttGubxGRqaC9wUgt0oOnbC63UHs57/o4PQ314uIP4bOdqHKM28FNYuMx83ggylZQF0XD++tbssRJIcUHZH/2yHGbXVMJ5sga8CiZhwirPITBAsQJU7JsHh4xvX/1wxDjSUQIzzcBq755LPytTDraXkWATyBXulrRxXpkKyQUt/DLFE+YpbKY8iL6Jepgr/YU0HEPoDa6Kw21nuSEk8pTqVTuQw4oVqpaiI/Iy2hMOcM+kRxNvtq2mbJoOe32PxR0WLGuTw50yBA0ObmMO5L4TND1Nj/Vmdws0sH6FnjIlVtGaft7EKs2QsFozAe2XLfffEatRZRbgV566xMEkPRLl6s77CIntGv6j+VlFmhTgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199021)(4326008)(5660300002)(86362001)(2616005)(107886003)(31696002)(53546011)(6512007)(186003)(6506007)(82960400001)(26005)(38100700002)(8676002)(8936002)(110136005)(54906003)(478600001)(316002)(6666004)(6486002)(41300700001)(36756003)(66946007)(66556008)(31686004)(66476007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T0RmQTdxb0M1MVUzS2ZEQVdRQ0tTa2dJWDhVVWJJcm1ZVW1Ea29WcjZCeFpH?=
 =?utf-8?B?bm9CcUpnakFLQUxoZEh0ZlFmVEo5VTRKd1c0ZG5pcWlzaGdQOVFJd3JqUFZw?=
 =?utf-8?B?RzhPNVRCeEpSN29JaXhJQ2tPUUdpRjJBc1I2SVFsZnFIMHk2SnA3WjgzK1dB?=
 =?utf-8?B?MVN6bU9ESFdWL3pZd3J2WUlGcXQwNjRuUk00UElGQytjQjZFQTNFbXowRjQ4?=
 =?utf-8?B?d0VWbXpJYTA0TGxyRUo5TEpXR0V0R0F1cSszZ1JxTVdUWmdoSFNJRldOZkxF?=
 =?utf-8?B?Y3Y4MXFSWTQ3RUVBbXpDWGdjejYvdTFMck9VbVJEVlJYUGdaVk9GekdLNDFi?=
 =?utf-8?B?VkczQjFELzdWNkpEbUY3ZEZvQ0lSWjJzTjhVNXpFZXRwaFQyTmJnNnVzd2hs?=
 =?utf-8?B?NXhENUNBKzVhdm1FWVFjZDJBTExBK0x0OGJqRW15ektlWXpMTm1GbVlTdGtH?=
 =?utf-8?B?OGlzU2tIRDNUYjBqRzFmY1pGSnE5Z1IxVXU5d1ZTci95WnNockhnQjNLOGN2?=
 =?utf-8?B?bllWYzlZaDdpNVQ5ZWlia1ZIS2JpZ3g2VTJFa0ZGbG5ZVWNlaU02UDdJZ3Za?=
 =?utf-8?B?bjdNcDNEa0pBZ3BuS2NEQVp6UFYrSytwNmZyN25lU2MxNmtaWk02MkN4NkEx?=
 =?utf-8?B?TnllNnhEZXZ5UjRWeEJLT3JaWkhzeEJoSHh3bVlHRDdacjhPdmlob1RRaFY0?=
 =?utf-8?B?bEZiVCtLOHZ3RWNDbkd6bnpYUVRUeHRrdTdlbHBOcFZ3SStBRmtBVTlmVlVD?=
 =?utf-8?B?dEtQb2YzKzRZMGYwN2pHQzdBbXFuenBmYWp2MGZmTE5wbkRNNlBNcUpNNUdL?=
 =?utf-8?B?cjdMZitvM0NuOVpGNDhjQkFkc1FzRnViU2NHN3p4SzBxTm1FbkUxcmJlaklw?=
 =?utf-8?B?VHhhRE5vRHl1Q3krOTk3VkVWdFRLb21RbitYOEJ0bml3S1Zxa2pWdUIvenpF?=
 =?utf-8?B?UndkL0dGd2pNU3N2T2IzdkVIQlVVODB6aCtFc1BhM25SblhER3laM1FUVGsv?=
 =?utf-8?B?YVdTS0hlMkFCRGNxVDdwdjRpbWdIanN3T2NTSndyOGpGVitqd2srR3pRRUY4?=
 =?utf-8?B?emdjV2pXUU5aQ0pMZmdDeU1hZTNGKzRtYzVYcFlpTWtpeTJiVHRFUFBQUUhq?=
 =?utf-8?B?aHlueUN5VjVZYlBhS1NZREVLc0NLUGZubXgxajByOWVpSEZvTkcwZktBc3ZW?=
 =?utf-8?B?Q29mQVpRQkxBNXBIVk01TkUxMHFKVnpMTTFSeWpBWFJBVkF6SWVxUzZnVS85?=
 =?utf-8?B?RXRDb25EeEo1YjM5RzcwZEk2c1REUEVTNThWWHlwN1V3SjJ0enVSSEZ6N2JT?=
 =?utf-8?B?N3VCcTczQm44WXg4YUp4VW9EMWpoSU5TdzJDV1JFMGRGOWFJZGZydVhyaW1K?=
 =?utf-8?B?RytYTUk5Q3daclVPOTFFazhRQnY3UzMzWHEvbzFYbmx3OFdKdVEzMGhGeUxa?=
 =?utf-8?B?TTl1SEowL2FxVWxlcEF2VXQ1Y0FwUEhzN2thMWY4U01vUHdJOTJHUzRiUllL?=
 =?utf-8?B?eUVPNkE2V2U1UWx2V2xIc09Ic1hZSDdWRnVFV1Urem5MMnJVWllrbGlMOEtK?=
 =?utf-8?B?WWRGVkxzNWUvUUZrT25MYjdkblRGY0wvRkpSTFRQaWI4clIzVlZnb2VhRUJY?=
 =?utf-8?B?K0lnL1JXSlc4ZlBkTytIczhsL0tZZVFxOTlXMzVhelpST3dPZ2RZVjdjZ0kx?=
 =?utf-8?B?MnZGdVBUTjlHT3gxREQvVDkxdExmWXVudi9KL1c5R3M2dmxOb0JOTTkvREN0?=
 =?utf-8?B?RjhXRDMxT1VBUWJ6aFRwYnprbk5CL2tMc0trSUd1ckdpbjBNanNHK3A1Ukk4?=
 =?utf-8?B?TnFhSW5yTGZjVUZHYzJKN05TcW5uUHlFaDRNNDlLUHhVa1NIK2RwUEhQWFY0?=
 =?utf-8?B?aVg1V0tBT0I0T0hqZlNPT0duYU1WeEFJWXM0bndmbEFXUEVUdXo0REVXaDRp?=
 =?utf-8?B?bEJXdHBjSjNUK2lWT0piMFc5a2xEVzNvU2xNbjhjcTBZbFVaT0ZJcUYrbnA5?=
 =?utf-8?B?UWgvZEFIdzVlRThRck9VZzlEcUxiTlRDM0lBdUJnY3BYUHV5dWpKMlR6OVpz?=
 =?utf-8?B?cmdqOXJ4YTI3VjdxUnZjTE93QjdIbmdEVUtQNXB3ZDNZTDlZM2FoUkJRcFZM?=
 =?utf-8?B?TWdTZmRSV24zYTdPTVNnR285a3VEb25yT2pUMEhBQWNFbmhCdHRwd1g0Ukl6?=
 =?utf-8?B?bFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	LN9/u233tmo4YKe07I0QOO+DDrhDWOIpioQH0ZWCSRM0WFNUNkLL6MyR8RsRbgxCQ+CvzYHpCHZ8NJSrbQcmB3UdKdYo5nIXBmVrNOuaHF6xyqF2D5bTLq0rsGXlgHEPygoh2pT4J9Lq7NX2vVsC7ZSjPDS6mHBo8L0sqvs/652KskPQWBzymycA+8j8T+ykO2DHSV/k/ijXNpdUSXQgBhjVDF7ZezEQLiL6/V5EXMnpXVH2i/eMNxLIiQN+kBTA4/20xAs/Ufvo8DW33TVlC8m01ouw0WUPUTR/B7jRBFm5bO2T7X6MPxTJeaoo8+LvAyCHxczpgWB360wtTdTiFEDdHtn59MJNhynbnYUAK9B95o3iLaNMjAgW2ATg+SE3Ytd+Iud1kTDfrESezFI2a7Bo4imHuDfOQWUOmn6SF5eQN659v+ToMvOOGcOzAf/HA+i+Uz0R3ICKgc1j1MrZim+wiefqFMyooTnnFLiMV66xA37knd1Lb90YiRHy5GV7KTBVaQuxsumZm9HggvQ4LNjon4AbebFqXsOmQ2HCib0mw55YOLV1B50IHlBcuyVbcgmBtRvA+J4s+CLCtZvnbMPCLAOfxNCsEIVTAkc99Nif49XpSx34/fRz1jtCsb6u9E2wpkEzh8WvVkBh5YMm70/JP69GGv+wRY51yDne1WkzgV7DZYiIyA+dm5gBqEvxn+vYJTXFz7oj+Snd63JZeePU3gxsMifzHZoQfbCZKPdATMLVQEyovLvL9Li225bPAUbQQogjT2bzonUIRVcboC95pwe9/ByUlH8OwxSKbwtE6t1qsSctMABkxKVt/UdH
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7253f363-ea9a-4a99-248e-08db41103e1d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 19:57:02.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P2GWB5kMxLZMhJyvbN2H8i86gpALD8CgdplT/ucPZ201eBnGvSAVkXaIQVGyeU0r+WahqqdOZustqRvjuKGbl4lDTgWHwD9d4TiDuhJKLZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5590

On 19/04/2023 11:44 am, Jan Beulich wrote:
> --- a/xen/arch/x86/flushtlb.c
> +++ b/xen/arch/x86/flushtlb.c
> @@ -232,7 +232,7 @@ unsigned int flush_area_local(const void
>      if ( flags & FLUSH_HVM_ASID_CORE )
>          hvm_flush_guest_tlbs();
>  
> -    if ( flags & FLUSH_CACHE )
> +    if ( flags & (FLUSH_CACHE | FLUSH_WRITEBACK) )

Given that we already have FLUSH_CACHE, then adding writeback also seems
fine, but we need to get the naming corrected first.

We've got a file called flushtlb.c which flushes more than the TLBs now,
and various APIs in it.

We have a bunch of ARM specific APIs which AFAICT exist purely to prop
up the ARM-specific gnttab_cache_flush().  That needs to go and live
behind an ifdef and stop polluting other architectures with an
incredibly short sighted hypercall interface decision.

The "area" in the low level calls isn't good.  Range might be better,
but I'm not sure.  The "mask" part of the name would be better as "some"
or perhaps "others", to be a better counterpoint to "local".  Some of
the wrappers too really ought to be dropped - there are lots of them,
and too few users to justify.

But on to the main thing which caught my eye...

The FLUSH in FLUSH_CACHE means the flush infrastructure, not "cache
flushing", and FLUSH_WRITEBACK is nonsensical next to this.  All other
things we flush have a qualification that makes them clear in context.
(other than the assist one which I'm going to time out objections to and
revert back to name which made more sense.)

At an absolutely minimum, FLUSH_CACHE first needs renaming to
FLUSH_CACHE_EVICT and then this new one you're adding needs to be
FLUSH_CACHE_WRITEBACK.

Except...

Is there any credible reason to have EVICT as an option by the end of
this cleanup?

CLDEMOTE does exist for a reason (reducing coherency traffic overhead
when you know the consumer is on a different CPU), but it would be
totally bogus to use this in an all or mask form, and you wouldn't want
to use it in local form either, simply from an overhead point of view.

We have evict behaviour simply because `clflush` was the only game in
town for decades, not because evicting the cacheline is what you want
actually want to do.

~Andrew

