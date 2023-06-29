Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DD274240C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:35:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556782.869544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoyT-0000gq-KW; Thu, 29 Jun 2023 10:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556782.869544; Thu, 29 Jun 2023 10:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEoyT-0000f7-GP; Thu, 29 Jun 2023 10:34:05 +0000
Received: by outflank-mailman (input) for mailman id 556782;
 Thu, 29 Jun 2023 10:34:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=imm/=CR=citrix.com=prvs=537aff723=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qEoyS-0000ez-Qb
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:34:04 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75205911-1668-11ee-8611-37d641c3527e;
 Thu, 29 Jun 2023 12:34:00 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Jun 2023 06:33:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by PH0PR03MB6915.namprd03.prod.outlook.com (2603:10b6:510:169::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 29 Jun
 2023 10:33:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6521.024; Thu, 29 Jun 2023
 10:33:56 +0000
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
X-Inumbo-ID: 75205911-1668-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688034840;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=p0oozo+bKpMVka2vrFX3liz7dkZ60f1NKn5cIuzKNGU=;
  b=cCHWIo/zTAh23rn75UtoWC50qToGrYgtmu96uyt6+hlAGaW06Xk567OG
   /U9E279pUvGxSIQWd+D3pprklQvoj6m5YaYPSUUFo+dm3fxiSuMtdg3PP
   VvZ/yFiHroS2+uZsM/A04iBrURfpYW5IgiSvo5Ys09eY4AKzAQQwLbb22
   o=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 113900092
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7i9SxKAVe3WvphVW/w/iw5YqxClBgxIJ4kV8jS/XYbTApDkm0zMFy
 2dMWD2OOvaKYmvyctx+b9vkpktXv8CEm4UyQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4G1C7wRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw+cxzIj0N6
 aQkJjkrbC6+juWw57irY7w57igjBJGD0II3nFhFlGucIdN4BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9OxuvDW7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyn93reXzHmTtIQ6TJ/m2sdMx3ypwmEsIwUMRUvkgeCpoxvrMz5YA
 wlOksY0loAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLkouQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnop4thu3MCkRaGMHOykNSFJf58G5+d5uyBXSUtxkDai5yMXvHi39y
 CyLqy54gKgPickM1OOw+lWvby+Qm6UlhzUdvm3/Nl9JJCsgDGJ5T+REMWTm0Ms=
IronPort-HdrOrdr: A9a23:NZ99karwVfTYFjp4kzg5XpkaV5oQeYIsimQD101hICG9E/bo7v
 xG+c5x6faaskd3ZJhNo6HiBED4exPhHP1OkO8s1NWZMTUO0VHAROtfBO3Zsl/d8kbFh4pgPM
 lbAs1D4erLYWSSXPya3OHoe+xP/DHYmJrGudvj
X-Talos-CUID: 9a23:FAI6XmBtWNOLFkb6EypN8G1IWdx9TnPU6nXuHka/D0FjWJTAHA==
X-Talos-MUID: 9a23:ilQU8QlMsUbAYdCQU0L/dno6FplE2oLpKXoJnKoto9OUJXNQIie02WE=
X-IronPort-AV: E=Sophos;i="6.01,168,1684814400"; 
   d="scan'208";a="113900092"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTecrm/VukdmN3aLlZGimrN2A9eD2QRhTc3/aJDSk5tWBve3LzauY7ZBVuXwHhxvwix0bd6KkeX9mKiRWoEdlFrCwwJKHpxYpam6rbF0h1iizmefN/kG0rnaM5dfzmW9B7xMvMOgoIEvPr5eofoRhf9PuH3HHvpLb5eYVlCt2VsS86VCQaqlGgH1MaXsAE7CwBhSZoTLt9+rPcihW+2noFMBV2cy0DPeppZ+e/Dq7Ej+mn9g80zFWkGy1fZS0GTR2kpOP+n8SdrKTxRbIsntniihEZotnomj0WPdkkTllfLG6LHUDo+tbaj1JCTdfLliRNo+1ys3ccBntlzJ5O2ERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p0oozo+bKpMVka2vrFX3liz7dkZ60f1NKn5cIuzKNGU=;
 b=Xf7BIxpOZWAflt/KTaJ0B8HcYgh4tFfPQY7yNCp1iAu9CwY0lTWZA31KN7dVZ54Eizt7TxPmbJn8jYrGIaFSYvrEFGgaacYUcfSYMtQTL02HXj6rATyKNNIiYM+qP5GME4Lh1lRzTTq5AQGHl2HAxk7o1G4BH2iCR0GQJWqVbfq64rf2bEQkRl8hhKPpEGzpFC2Wwbrwjpb5KgrccgHofZOSK/oa6nTkTeE/QWa+VfRCYipiYKZwWu31TE2/Gc9gnHYrjMGwtStkoygbJnl9JJw6Du+Wqs2CC1mIw4fF9GzhgEGRAn+enpPXRh6iwu8qb9CAG13RCH91tCqfCnwHLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p0oozo+bKpMVka2vrFX3liz7dkZ60f1NKn5cIuzKNGU=;
 b=kkWnyPI8PYTGRkaI5RFZPWWPjoFa9NESGxo5CG00rTLlyq2vEXgPldZzLiOrIaoyBir3QIwfMoQZxng/hUMsJBOsilX0P1ft1+EaSMJiNF92L2TMSOUuzGe2Ecl6/gTZKBWTYKg6w5Nkw7N3jGPKOuZIUeHNfolSoU645ryFUow=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Jun 2023 12:33:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] xen/sysctl: Correct comments after renaming
 xen_sysctl_cpu_policy fields
Message-ID: <ZJ1eDWXGzwyHTSsf@MacBook-Air-de-Roger.local>
References: <20230629102600.61262-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230629102600.61262-1-andrew.cooper3@citrix.com>
X-ClientProxiedBy: LO4P265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|PH0PR03MB6915:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dfebf2c-3ad8-4896-575f-08db788c5737
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6jJU20LQBCafjdd044z5QCE19QePHOL+F7UYNCNUwjpQWgoNIjqM6StWTvd7aYB0cJv5+E8x4doFqGzLMCfw53+5INJ0OknenpcnLTzbfU1+MRX2tkUY3smDPRPgP8ypxbygPIPtuWuxCTknvF0+lY0Sx8g2ohWhCaaKa7QO/e87OqD0Z00kxelz8CZT+oP3/QKAR/BJ8fTGohhdk3sLOyFI5XeYnK4X6Kh4oYOtXhzeO/L0SzcVfMoU4oxMkjnz4C71UGl7pENp9qeY7mepI+FWIuiXzGCX/+d8GZrMTWdHjSSMDyOjEiAO85pEWHQaG5ELe9Tt0VoeZUHsRBHYQNO/c7XWTVTJZo3ON4uSdZXeyudZHsFoECpRFtObGtbZpnXkSBk8S3yyjmUHQl9td+qXUnDMkPkJeAG639JWadJUtIZYMdN/40HnNvRhxHJ8DW74/uuIQJO1zux7w4n3zb3cuqOkuDoksLDbkh4kbRjPt32MBBxOO8ibx8K1ROKupglX/gaLZ9aeqOZyoEscnTkzTvHJVPedlCBjO65Z/TvDFSs+gakPLr1LcaFBstw4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(26005)(9686003)(4326008)(66476007)(66556008)(8936002)(6506007)(478600001)(54906003)(186003)(2906002)(6666004)(6486002)(6862004)(558084003)(85182001)(66946007)(82960400001)(5660300002)(38100700002)(86362001)(8676002)(6636002)(316002)(41300700001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnZxYXM4ZUFSWk91OEtpTlVCaDY0dFl3NmhQV2tHL2VhUjFwUExuY2hhNXVL?=
 =?utf-8?B?bmh3YkI4blV6emJURlViZUJ2TmRmaDR3VW5mTkJSQlZ4UlpqSnAxcGNsWGoz?=
 =?utf-8?B?YklWcHhzK0JYWUNZRUZzV0w1Q01GRmZrWEFUTmRPaUNQZ2RORlE5MW16NmFI?=
 =?utf-8?B?dnFkZk9kcTBsaG1RMnNkSUk5bHNHMjJHclZSb2ZzeC9XYm04MXRMenV5QXdV?=
 =?utf-8?B?VHg0bStkSmZwdVpvYUk5L2VTdUFWUHhjRERnSmd0blJqaUNiMXBBZWRmTjdz?=
 =?utf-8?B?cE5rN0lNZ1RHZUhqUmRwNFZ1NTBRSVdQblBSQU5EVTQrY0lpUXNRcUNFeFEr?=
 =?utf-8?B?NzVjUEl4cVZFa3hlMnBsU0hrV0Q5bzhXRTUzMkZzUzljYkI0VDVQY0RDZ1By?=
 =?utf-8?B?d2Nvck5maXpmMkk1dXN2MjFWRkRjOWhpak81b3VFcjFtUk84OTk0Z2x4SjdU?=
 =?utf-8?B?WDhNendiTUxuTUdCVDNKUDdFVEwyZStaTjhyeUllZk03dGEzWjJvcjdYclNX?=
 =?utf-8?B?L0FWb2xSOVJCY2NJSkQyOEczNGtsTU9tdk1XdksyZURqakM3TitUaXg4SVps?=
 =?utf-8?B?QlhkTTFDZDRaRU9aQXVpLzdQY1YvYm5PdEowQVF3bGpQY0lqay9OQmo2dkc3?=
 =?utf-8?B?bFlTa2pJVmpjRXZvOUxrcHFURk1SejNwNmF4UEMrRnpYekl0MTFiVHlsWk9z?=
 =?utf-8?B?bGo4TDdJSDk0TlV3WnpnNFU2d0ZheStRZlBHRVZuZkdNN1FGODl4NWx4QXVE?=
 =?utf-8?B?emc4aS9mald0MmxwMXp5VHV5bXZJUUM3QUNjOEJEeTJ6RDBkL2VvZnE2dWxv?=
 =?utf-8?B?emJtYWt2MXZpZWM0akJaUmg4OUJCdDVkOUswd3E0YzQxcVJGcFR0eXVTTGtn?=
 =?utf-8?B?c0h5cThob0pQUjdYem5EOWNVajFvMzM1NlBDcEhLNlBVNUM2aWRiVmJIR2wy?=
 =?utf-8?B?WXd4ZVpOWFlrc2l4b2Y2alFBcGo3QjJRM0pNMXNLdzNKQVF6VXlIR1hvVlRG?=
 =?utf-8?B?Ui9VK0UwYWVGVFFpa0w0WTk1eTduRGR6TVVOTm9JcktNV1NTeFJ4SVVIZk1H?=
 =?utf-8?B?bHZIeXU1UHJlOUVJckNQU0hZQS91c2ZJaUlOWjYwbk1RZFFwa1g3QThDRkRG?=
 =?utf-8?B?MDFOK3dYbmFrV29HRHpJTE5hMFdKNDR5MHlVRTVnbFJXcVRZcFFEYTQxYS9Y?=
 =?utf-8?B?YXBiUmhsaS9sbzc5NFZpbFk1eFgzMDRlOGw4L1ZKcnpsWGtuaG5OOS9oTlVH?=
 =?utf-8?B?cm9YQkIxeDcwNHpVZ1EwaVQySG5MdnVOcXUyQ1VBZmx5NVNrRGgzWFFqaGox?=
 =?utf-8?B?Rm4xRElCOXY1MWN2bTVvZUlVUXhjVFQxSENFTy9uZlVaZlFrRVJBcGZ5SCtW?=
 =?utf-8?B?dzUvYkN3SDlXM2xrVEc4L3FTWm9YOUU0ZmxVWTNFZzJ1anI5bnRmcmJFb1JF?=
 =?utf-8?B?MktocFEwZ0xVZWF4a1BzTXJ0cXlibXNNYWdrcGpXSk4wYUJYcllFekQ5UCti?=
 =?utf-8?B?QVpjb0IzKzdEN0pzOTlvUFRtZ0RLUXk3U2wybG5DSWpJSGIvSEtLQzZGeTAy?=
 =?utf-8?B?c1lGWThTMXdFWFB0enlITTJ0TGJqb1orVXVwZnZycEJHY0xJYU9iOWlCcEp6?=
 =?utf-8?B?YkRCNmhqeUN4Uzk2emlHdjdxS0pEYWkwK1dyT0hQWUo0c2pXYjdWNXdsOExt?=
 =?utf-8?B?UHVQTnU4YjcxcVc0d3dmSHV0R1lBOUN0NWRNVitMU0dWZzdzby9JWDVkN3Vq?=
 =?utf-8?B?YmRYTTVHWVErUEpWcEFjODBha3RJSjVKM1liOE1HbVNSMEdrbnRIMzRjUlVB?=
 =?utf-8?B?eGc4a3RJTTZTSDF4MjVDbTMvWXc5SG14b3VRckE1dEhLUW44M080cUMwV2Jz?=
 =?utf-8?B?QitxcmpiK2c0dUNlanprczEzcUNadVo2bVVtK3JvTVVxaWEyNldZcjgxY29w?=
 =?utf-8?B?eXVILzRVLzdib0pDVnd0QkJWekdMblUwZU1RT0dIakNBbzdXTlE3TWtZR1NB?=
 =?utf-8?B?eDhNeVNTUVIwRXh2RzFjT0FhZ1NIV2F0SWI5OXk3cnliTkxUVkh5WXN6amJ1?=
 =?utf-8?B?anVES1BCUWVsQ3FwZlRPVjlmTStFNWticnpQYmhvT053TmJLb3BZOXZnZWs0?=
 =?utf-8?Q?u2wsMAsdZbVSFiVJYokB47YQ3?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	PqELRhWetDIS6kWPEcXpA9HUcMprqbbwt+r1eGloLuu0TVmJRne4oMCkeI2Ux6daDbjqw5VC7cuAh8rULd+uVmjdiSVBQCk0QM2gqdPAPDRCqABIGCGo2hKV8tBVuZXIpq6zTtPrsHqnHdE5JrlLOsbMUfomHHz0hO/q4YTFk8U6cbEfUQ9ruUtacpXxctKH9wqBx+J0SYhNzEBM9XNdFJ0zI7Yb90tLN5AvUivuC/Rc/dvfT7pRyT7pot51Oqk5Hd3nN6YF2KcmTn6X+iOrBbYY2qlodyqvvlUN9HBoVKvQTo9dP9bG95fhjAyVeBR6KAbPjNfp9XUSA6tKpcOj+HxPxamWQ1Ttb8zujvoV3FkQKaFvW6C9CMFxYi0Kmu7M35Pr0V9Ii2vNgAzDLAxuRSFc3qZr4VYAZ6bSfTbFxq0AEdAvpfqnZuXtpK+E7b20mCzjtRWc6T/+mkS5Y7MJpsdL6CSchsyFQhUqJuZ30TNPmn+wPknEd5E68LU2ovLB1BHYoyILXVPwC74ouKgCcYkB9L7BNzMw28gaiLtp8G7cAWF+K3pDg6KTGdZw63Cax71EVxYcI7qE0XEH9TkT7g1maKRM6HZ/JeL67bYwFs8JMRvQxND4+P1ZSW1JG1Ze1jZqGPasaKozBfTILsTCpm3smmjto9BlpSuOfaKfULKa+Y3C1YhvKobwVn9vvzWgFfyykFqBhTiveV7vjHh7hKJi3YIq2rRqMcagP7RdyCtIePfdw9KJtdhn+YBrYpJqaOAAM6ufr6QqHr+Q1TZL71j8sNwy5zDGIIeP5ITwb9OV6oHqTeM0kg812PdkeUjC4uw+soKBXguqUZDfQPlA/w==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfebf2c-3ad8-4896-575f-08db788c5737
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 10:33:55.8673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUw0xsfnh3D9ctLACPwVcXYbm5g66T4iIQOsdrjPYjCweqNrCDB8gda1osFcGYgUXMZMQhRauI4gVlgmRndqlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6915

On Thu, Jun 29, 2023 at 11:26:00AM +0100, Andrew Cooper wrote:
> Fixes: 21e3ef57e040 ("x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

