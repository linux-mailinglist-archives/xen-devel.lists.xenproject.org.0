Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288BB7295FA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Jun 2023 11:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545793.852368 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yp7-0003R7-7f; Fri, 09 Jun 2023 09:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545793.852368; Fri, 09 Jun 2023 09:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Yp7-0003PB-48; Fri, 09 Jun 2023 09:54:25 +0000
Received: by outflank-mailman (input) for mailman id 545793;
 Fri, 09 Jun 2023 09:54:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H16Y=B5=citrix.com=prvs=5170a5cbe=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7Yp5-0003P5-U4
 for xen-devel@lists.xenproject.org; Fri, 09 Jun 2023 09:54:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99428f5c-06ab-11ee-8611-37d641c3527e;
 Fri, 09 Jun 2023 11:54:20 +0200 (CEST)
Received: from mail-dm6nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Jun 2023 05:54:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN4PR03MB6782.namprd03.prod.outlook.com (2603:10b6:806:215::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Fri, 9 Jun
 2023 09:54:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 09:54:12 +0000
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
X-Inumbo-ID: 99428f5c-06ab-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686304460;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C+L6op5DniXeSCfEV6FchGf1Lj7dsQg4xJd1GuHKi5g=;
  b=G9bEQLTwpw4S5/HEM/sPClFWy5YZjBgxll0dcd6QvLVMCFG9EHdRxKMl
   5pwSMDStVjeUTV21bSY87gEtyhhnbgFhtQgOn6bfpz5JQRf6S9J7DCUb5
   OkQZ2nmX42G7/wisblu8oBct16K+09nWWdF1kQfiqqpkeYpoH3WI9HDgK
   g=;
X-IronPort-RemoteIP: 104.47.58.102
X-IronPort-MID: 114707086
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:vEoJaKwVdVwxnMcn1396t+eaxyrEfRIJ4+MujC+fZmUNrF6WrkUBy
 WIeW26APPeKMGbzL9p1aYqw8xtT65WBn9I3Hgc4riAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaAT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KWdv9
 uwhLBQxVxuKl8G38ZDgT7dSrMt2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQruFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAd5NTOLgpqACbFu7n0wVCzlVU1WAmN6FmmyZZcNSA
 Gk49X97xUQ13AnxJjXnZDW6vXqFsxg0S9dWVeog52mlyKDZ/gKYDWgsVSNaZZots8pebSAy2
 1aThNTvLSZmqKGSU3+b+baSoD6oOC4aa2QFYEcsVhAZ6tPupIUyiBPnTdt5FqOxyNrvFlnY3
 DSivCU4wbIJgqYjzKWy4lbOhTu3upHSTwkd/AzPQmW/4wV2ZYioapap71ed5vFFRK6JQ1/Es
 HUalsy26OEVEYrLhCGLWP8KHryi+7CCKjK0qUVvFoYn3z2r8mW/dJsW4TYWGatyGsMNeDusb
 EqNvwpUvcdXJCHzNfUxZJ+tAcM3y6SmDc7iSv3fcttJZN52aROD+yZtI0WX2ggBjXQRrE32A
 r/DGe7EMJrQIfgPIOaeLwvF7YIW+w==
IronPort-HdrOrdr: A9a23:nMoL0KiOR3Nqdr/vf/LVI6wGYnBQX8d23DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewKkyXcH2/h3AV7EZniahILIFvAZ0WKG+VHd8kLFh41gPM
 tbAs1D4ZjLfCNHZKXBkXeF+rQboOVvmZrA7Ym+854ud3ATV0gJ1XYHNu/xKDwTeOApP+teKH
 PR3Lskm9L2Ek5nEvhTS0N1F9Qq4Lbw5eDbSC9DIyRixBiFjDuu5rK/Ox+E3i0GWzcK7aY+/X
 PDmwnZ4Lzml/2g0BfT20La8pwTwbLau5d+Lf3JrvJQBiTniw6uaogkc7qevAotqOXqxEc2nM
 LKqxIAOd02z3/KZGm6rTbkxgGl+jcz7H3Jz0OenBLY0IHEbQN/L/AEqZNScxPf5UZllNZg0J
 hT12bck5ZMFxvPkAn0+tCNDnhR5wCJiEtntdRWo21UUIMYZrMUhYsD/HlNGJNFOC7h8ogoHM
 RnEcmZzvdLdlGxaWzfowBUsZeRd0V2Oi3DblkJu8ST3TQTtHdlz3EAzMhapXsE/IJVcegy28
 30doBT0J1eRM4faqxwQM0bR9GsN2DLSRXQdEqPPFXODsg8SjLwgq+yxI9wyPCheZQOwpd3so
 /GSklkuWk7fF+rIdGS3adM7gvGTAyGLHXQI/llltpEU4DHNf/W2XXpciFrryLgmYRQPiTjYY
 fxBHoMaMWTalcHGu5yrnnDstdpWD8jufYuy6UGsmK107P2w7LRx5zmmdboVczQ+GUfKyrCK0
 pGegTPD+N9yW3uckPEoXHqKgbQkwrEjN1NLJQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AYQTPt2pVp8CVHdJ+5gCnf+DmUcYEcW3kyFPsGkS?=
 =?us-ascii?q?xGUVoeZ/OTAGu0qwxxg=3D=3D?=
X-Talos-MUID: 9a23:PWZhRAjT+Uo3DVFHm4mHx8Mpbedu4IDtDk42qLI6q+ujCz19EBKxg2Hi
X-IronPort-AV: E=Sophos;i="6.00,228,1681185600"; 
   d="scan'208";a="114707086"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UfLLk2KDjlG6ISaY3pZBF6DRu08EvO0EveXthFX1Llf7fDjVgTgvd030b5kKYigs9QJ3Zkg8/6y6kxbeQe8dEODfArSRaChHuikMtpFs/bS/4xNPj29eMgx8RyW3m7bI5eI7jq0X1rfQpTT9hL19urj1V96seNwS7a3C2iZWRvUULSPYlCvSuAdr+a9a9Waeu2P7+9BlNXU+kYSzCxitfeQsqXrEI0i7R0e0ps32Fiwq0/ZsK7NLbuNqNOUGkGQUSmuAJs3kzr2xGz38U+sBY78BOshIrBfCRHp6IZ1PFZxfHEt26YvVHP+rL0MWc+vrt0MvdsAuMShs7glbaQP4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+L6op5DniXeSCfEV6FchGf1Lj7dsQg4xJd1GuHKi5g=;
 b=nacEl5bxVVTx8P+MQHfocfmjWj4HD5V/QIw6ymOj0BTg/ndjQN6cyaQDEISuqxkCPpJQiY9BlVr1wCVy2TFQpyr+52+98BWsFrBvZalyn/4q7nXsnJRPXP0HYBmhrGIE60J+ikMuIWUBW+6/bYJXTvp0/hjC+9L9BSwzhpmHZowaYzQPGhkPJduZ/YDfJ5WKfE2V/63JNYO2F8aJhhkOT78EHYoDYgZx3RP1QSQ6wgZbfGLaeaRQc7dCoh9dyHKARcKCTz03xBP61GgX03uO74UBNT0f1gkp8A5WMRzqcc7DhlxargZMJnjj/9UvIRUYXh2selYMqBSQkvkMgA5mqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+L6op5DniXeSCfEV6FchGf1Lj7dsQg4xJd1GuHKi5g=;
 b=ZYsWHbWj69U+GcN3b2acPGqXnluMi5Kj7PJfXqet06V/LYxMzLV4GxJl0asvsgoKVWDY8oat++tDPJS54m5H8ZQjAXJxPTzd96PH2PLVhLLkAJLjMzTj5d2Eq6u74IGUUC9fJe5QrUoiNh9088SnPxd05ZJ2EHOAfBI7cqEUmj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <e16bcfa1-2b40-6bf0-57c9-5045ae1fdf80@citrix.com>
Date: Fri, 9 Jun 2023 10:54:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/3] xen/ppc: Implement early serial printk on
 PaPR/pseries
Content-Language: en-GB
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <shawnanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Shawn Anastasio <shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
 <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
 <0c0a19de-dde3-8b98-4354-6d3d2019179b@suse.com>
 <0b24d36b-adbc-9e7c-df6e-8754c269855d@citrix.com>
 <d0d9b1be-a9e2-fff9-d631-149086ea1dfe@suse.com>
 <d52feaa7-4217-973e-19fe-9ec027eed5fc@citrix.com>
 <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
In-Reply-To: <1c35f696-5a65-06da-8af5-685b8ad2e849@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0401.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN4PR03MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 315c86ed-8038-4288-65c4-08db68cf7a1c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ihonxSP5XC7yOv88kEoXN3F2Aj0J1T99HY9WCxvhnCi2HC/dClCDiXGhJjYifldoRrg2cVBKPS5Pg/zhZgMUk8yb8jDBT5u7H1t/NVwRH/1/1+Fi+Mcy+aE7JvUR4VUbTg/OGx8LjvB2+jZ1UKi6K9GsfEr8tmYhCPeM4MBpNUT7z293stPSL0rrUtOXjh7igtdoT7pXch/QkcB7C88S7X0qXG0Rbu6cjnLCP5kYH9b5kWR6TqdbJBmbrb32Gdg/eguj3uU++MCtWXo24Q9mJ4dBPHBeKC8vuvEihyxEbTaaWM1nsoAFQk0+gAKiVuMEU0OHfb3EihETYo5byZZArXWvnsYDo7RKg1/wr8nuOeT0/L8XvT4E1foMQtuTB5yEK7YCc5Zi5DAs38eHaPNkYoDi7a1AbrVOYBfu/axihEyVFdkUwM/PvNokp/GJxYdq+JJxl9tYxnaVT/bjQDJL3PszLEmi3hEr9fiyAIJuookrP2ZaQlED9f0Fi8tMZrrDtdEAth5xhYPRYdDiX/pWFuZuokCIjQXV7nZlpwCC82nzlV4gTr5DuUW2eC/IMdiT29dF9TNRab7064NN3ODWrG21uy2M6CUlDroeyaUU8SzhC4b6fFau3E1nui/5IGa4i8sFIgR0xby26zOaiyuxeg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(451199021)(2906002)(478600001)(38100700002)(966005)(31696002)(36756003)(83380400001)(6666004)(6486002)(2616005)(53546011)(6512007)(86362001)(82960400001)(26005)(186003)(6506007)(5660300002)(316002)(31686004)(8936002)(8676002)(66946007)(66476007)(66556008)(4326008)(110136005)(54906003)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVRaMlRtOGFkOVY0NGdTbEU0RjNPbStCWnc3YlhGSWZHcmR1cmhXa0N2VU9H?=
 =?utf-8?B?TGtsUlU1WThNSjdaL29jQTV5SnIxSkRDcG05WnFRS0Q1Nk1obnZEa1FxazJG?=
 =?utf-8?B?dnV2bTNMb0N4RGVzWjBvZDRuVzZDNTdCbVNvbmZ0Skx5ZFRuU0JXS3RYNHFq?=
 =?utf-8?B?Wmo4NlluSlpMNndZYkNwUC9vcERSbTc5TFlLNkFVeHpUMFlteWtlMGI4aUxO?=
 =?utf-8?B?SWhoeHo5VW9SSG5IbjY5R3Y5aDZVVHRESXNRRWEybzdjZ3VMeG0yejc3a3NH?=
 =?utf-8?B?VC9YWGFkZ0tFNms3dnNkS1JxaE1ld0ZibzlIT3JIeFBJUnI4V2kxVnM3cm40?=
 =?utf-8?B?aXV5OVYwSXZRanF3VkR2SVdHUlBFZjh3K1ZwWHNxZ1dFaXYwTlE5R1BSNUdi?=
 =?utf-8?B?WDRtL294UkQzd1h1N2VudVk4ZklkT3VoUXdoWE4rOWl6ZXFMRU43L1h5NHEv?=
 =?utf-8?B?OUl3V3dyYW1rQmluUEZKNitLZE9KMVpIMjRZQzB3YUNObUxJVzEzNXd6RlE4?=
 =?utf-8?B?d3RBalZyVlVSVXg1TE9WWGhFakFrdHE0RUNTTjU2RCtYY1NEZ1NpTmxjakkw?=
 =?utf-8?B?akpXb05HTjVXQnh3YUFUeTM0ejV3QUlkVU5nTkVJQk5EdnBuOUo3bklzK2Qz?=
 =?utf-8?B?R2N0cVZFdXVhZXovamFWQ1lCakUzZk9lRmRhdFhEdFpTems5K2tIVjRoa3pU?=
 =?utf-8?B?cEZBUmUzcFJmVThJZjhYV2J6UEpzSlRwSGZJYzJDREJvRDFNWEhYaFZzbWtk?=
 =?utf-8?B?M2ZTUXgwL3dZNHVqdXV0UXpDREdhZnlsOHIvTllQOGJPRmMwNW9nb3dYbmFs?=
 =?utf-8?B?b2YycHlpQml0OUk5c0tuVFpIN0cxeGlZTXJQY0VpcW9Xd0s1aWdqTUIzcDFl?=
 =?utf-8?B?U1VIMGJKaGZHWXlobFdrZGp6TmxuRER5VDFuQW1kSEVZZjNoTzU0MEg5cCs1?=
 =?utf-8?B?TmV3MldDbnpibjRDUG1pbmpSaG9Gei9DTURDYjIvbUtYcnEzOW5zUVBKMzI1?=
 =?utf-8?B?TmtLNXB2OWljQ0gyM0JnV1dRZEF0bUx0Qk4wM1RzUXdFUThQSVFoUmpKM2pY?=
 =?utf-8?B?VFJhTVN1ZENpck5ON2pENzY2NnpSLzJRMDJVa091VmsraWtqTXVXdmFZZ0VW?=
 =?utf-8?B?am9GeVdoeVlXeWJTU1ZwK1AzbWdSRW1OcGtvQ3Boci9qYWlyWEZQWlZiLzZL?=
 =?utf-8?B?dG9kYkw5Z1VKcVRaZnJScFdLN3NHWjYzSUVQN0JPRmdFR2pyanc3dEtFdXRv?=
 =?utf-8?B?Siszd2lKZWkvRjFBUzRSUVpqVVZBaldKdHBJdFNHdzIxaWh0QWQ2SW5VS0ZQ?=
 =?utf-8?B?eGZRdlJNc041cE5IcVNlUm41cGFrVDFSVG9jcnhmZHJUQVJGcVZrN2FlMTFj?=
 =?utf-8?B?eXNUdHRMbFFSRTBRMU9pZWpCbTBpd1ZkWlJ4U2lXb3FKOHFKbkY2Y3NlNENa?=
 =?utf-8?B?Tk12KzJ3aE81ajdGSXg1YjAvNTF6enpKN1YwTmJxODFzVmtMSDRkODVaNlJa?=
 =?utf-8?B?WW50TnFRZWRrRXd5VXczNWIyVW5PckluVDROV0JiUXp1RWk2WG4zUTFrVko4?=
 =?utf-8?B?ODF5YjVDNmJQemNJV0VsdlFHdmVOTUczVFNOMjFNMkJjUE1NRk56MUtIdzVu?=
 =?utf-8?B?V0FZalJob0JWL2I0V3hxK2treG8zQVk4czBVaWpudnJmK0ZhbDB5OEZZSDAz?=
 =?utf-8?B?enlyMExUOXhJNXpOSXVqK0lKa3B6WXlyK0ZkallFWHQralVMaHNmNE9yVE1y?=
 =?utf-8?B?R1crMDFLSVdoVmlzcVdLY3Nhc3BzRlI3Q1FQQVpyV0hkNUxqcnRBc2MyU1N1?=
 =?utf-8?B?M2J1SzV6Z0ZaVjk3Tm44NjQ4aVRMR1FaRW82SVV4L1NHTUtTeXFUU2o2cGhL?=
 =?utf-8?B?eHBEeE90dUJqdmFOdlVhOW9kejAvZi84VmdUM0cxdmkvRE5CeDh5cXI5Y0Ro?=
 =?utf-8?B?eStRcDVpclpubFFuMTN3SXJXR3hWZWF1VXJHWW9DRDA2WWs3aXRHS3FRbVAy?=
 =?utf-8?B?QVdReXZCNmpzcWNrWlQ1eGp3MiswMlNEbGZWODA1bEtqTko2cnhHaEp5OTAw?=
 =?utf-8?B?azNkTGxkK1BIaEtpTnp0Z1lrQjlRMnpqM3N1RUlRWS9tOU53UzBxMzdpc1NG?=
 =?utf-8?B?ZTJPUHNqNVZwYjY2ZWRVbkNsRlUwUWdBZXoraGJ0ODdaSHlwMUNoT0J2dHlV?=
 =?utf-8?B?Rnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	=?utf-8?B?UHFDTHRUTGptdXlMWFZWZ2kvVURGZGhYQWIzSGZrQndoK2RJNHpmWC9SeElm?=
 =?utf-8?B?dXZ2VmVYeVFQZlRMQ0k5NWw3WHVUcWdQVm5kQ0NFSzl0UGhRQXB2T2JyQzdV?=
 =?utf-8?B?WUpFajJ1dUJ3U0tETzRlVGFoMkJzZjgyM0FQNmh2WlBEVU55YXROMXBmVG0z?=
 =?utf-8?B?WXRmT1V1b1plODNUSjNUZXBpT0xYRk15VEhSckFhbnFiRlhKakduYnhVMURR?=
 =?utf-8?B?dnJQU1NpeHdOZFZDNVpRcldGSHZGdzRWMU4vMSt6cXlaODhlRmJHejF0MTgx?=
 =?utf-8?B?NFJYT1JHakVZWTl0OEdlMVZNN3lDSk9NcURhM0tzbmV3Q3RGTVZJaUlEVXNC?=
 =?utf-8?B?YVNRcUF6RnhWTmo2Zmppb0IyWEI3M2dnVkQwTXBRcytHSE53VUo0Um5mbTMv?=
 =?utf-8?B?eHRJUVREa05Bb09mbFdUM01NVWo4M3lOZEc4RlNyNVd3QmxJNE85OGpLVEk4?=
 =?utf-8?B?aGVXVGI2cWdBTWl4NFZPSFJ5YlppY1ROcS9ETmJsY1l5SlhUcUNyUk9FdHJE?=
 =?utf-8?B?cDZySTZ6YkJtcXdWb1VRakErZjY0OUNRTmczdkNVZlhLbDRPSUdWL1FZb1Bz?=
 =?utf-8?B?SEY4eDlxL2NWd3pab3Q3TFVRcVRDZlBUeVBHZThlbjNsUGZCZ25uZjJOVFFT?=
 =?utf-8?B?c0E3T2hoZ1o4VDR5S2ZLRFdtMTBGblJEV0J6VE1rdkJ3cno2UmNvL3RBNk5h?=
 =?utf-8?B?VmRQN0FVZTZMbjIrd1dFcHFkb2NXZ0d6RUwwb2RHVFBFeVdpNVduVnh6cTdW?=
 =?utf-8?B?ZXZ0bE5kTHcwV0pGS2ZHT0JNUjFtMGFKTWozQUxpZE1ldDNkS25DaW1FZ1o4?=
 =?utf-8?B?NWFoNVFOK0NkUXMrSC84MEFsYjNUaXptR2xURzVXV0JEZmdDY08xVkVKNk8v?=
 =?utf-8?B?QUhUV3I3YWhxQnlESldEdVBnOHlQaVU2YkJBU05JQXpvNTFVbHRkZW1XeDNP?=
 =?utf-8?B?NVpZNzJWT09tTG1lenVnaUgvZGNNenFmamo4ak9TSVBqOHBmZFAvbm4rTnkz?=
 =?utf-8?B?bHZSVUxoUUx5SElRbTMxMlpXQUcvL3dIYVNnOU51M2R0SEdKZURyUk1yekpX?=
 =?utf-8?B?MWRzSXFERURFbmtGTHRzSzNzeGJCTHZiRkwwdks4dEkxUVFONElhYmZVdENN?=
 =?utf-8?B?cWNDMnRoZ2MvMHJCS2VBWnVhWnkyTnN3aDM2T1V5WWYyRU9qdFJvR21TVWhB?=
 =?utf-8?B?NU9NVGNncnA0dTJ3WkJWakJsNnhBTkhocUdHSjVjSHNOd0ZaejJCODZaWlU0?=
 =?utf-8?Q?i8oCd/lJeVhEz6k?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 315c86ed-8038-4288-65c4-08db68cf7a1c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 09:54:12.1670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr/EVdEB3SB8bFlnkpBk1ZnE1KiZCMx05qxUVasEyE5NAG6xKw7zSiNIZadXjMewQ56vPqk8PONE51cY+N63gzqoSqDXr1MS13hxsnWjsXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR03MB6782

On 09/06/2023 10:46 am, Julien Grall wrote:
> On 09/06/2023 10:43, Andrew Cooper wrote:
>> On 09/06/2023 10:38 am, Jan Beulich wrote:
>>> On 09.06.2023 11:29, Andrew Cooper wrote:
>>>> On 09/06/2023 10:22 am, Jan Beulich wrote:
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/ppc/boot_of.c
>>>>>> @@ -0,0 +1,122 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>>>> By default we mean to use ...
>>>>>
>>>>>> --- /dev/null
>>>>>> +++ b/xen/arch/ppc/early_printk.c
>>>>>> @@ -0,0 +1,36 @@
>>>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>>> ... the more modern form of this (GPL-2.0-only). Anything
>>>>> deviating from
>>>>> that may want justifying in the description.
>>>> GPL-2.0-or-later is fine.
>>> Hmm, I was merely following
>>> https://lists.xen.org/archives/html/xen-devel/2023-06/msg00415.html.
>>> The text at the top of ./COPYING looks to suggest -only, and I'm
>>> unaware of any other place where our default is actually written down.
>>
>> The license is chosen by the submitter/copyright holder, based on their
>> preferences/wishes.
>>
>> It's fine for Xen to say "if you've got no vested interest, we recommend
>> GPL-2.0-only", but that is strictly a recommendation and no more.
>>
>> If the submitter chooses GPL-2.0-or-later, that is their prerogative.
>> We have plenty of GPL-2.0-or-later code in Xen.
>
> From my past experience, the submitters tend to just copy the license
> from an existing file in Xen rather than explicitly choosing it. So I
> think it is fair to ask the question because our original and default
> license is GPLv2 nor GPLv2+.

Did you read the bit in the cover letter about part of this code being
derived from the out-of-tree port years ago?

You're blindly assuming that there is even a choice of license available
to be used.

The submitter chooses the license to use.  You can request that they
justify it, but you cannot demand that they change it.

~Andrew

