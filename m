Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9D7772560
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 15:21:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578415.905904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0B4-0005kr-98; Mon, 07 Aug 2023 13:21:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578415.905904; Mon, 07 Aug 2023 13:21:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT0B4-0005hw-5H; Mon, 07 Aug 2023 13:21:42 +0000
Received: by outflank-mailman (input) for mailman id 578415;
 Mon, 07 Aug 2023 13:21:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ru+M=DY=citrix.com=prvs=57627f799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qT0B2-0005ha-JG
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 13:21:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55d3585d-3525-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 15:21:38 +0200 (CEST)
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Aug 2023 09:21:35 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA1PR03MB6562.namprd03.prod.outlook.com (2603:10b6:806:1c9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Mon, 7 Aug
 2023 13:21:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::6bfe:c2d3:2c8e:d2ea%6]) with mapi id 15.20.6652.026; Mon, 7 Aug 2023
 13:21:31 +0000
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
X-Inumbo-ID: 55d3585d-3525-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1691414498;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mMi6LU0PhvDU5U2ndnsFScM6mtJb3RWTKZHASzxOpaY=;
  b=Ir3PXnn8T0I432bMyykkG4cZtsrt0d0RLmpyRwj6vmnyOO3DUasSFHEm
   d7OVHa14aPlxdZe578wGa1M1eq4H33KNtsVKoE6wSiE3WnnnYvsvQAjzo
   eZMhiqOT9jA1nhRShTee9kfHrnkKYcVjq6H9G0LIETy1Q1s2Zo7q1+DpF
   g=;
X-IronPort-RemoteIP: 104.47.58.104
X-IronPort-MID: 118602308
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:z5wKEqyLNaMEbSWpVk16t+cOxyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 2oZUG+DPPbea2OjLdF0OYvj8EoBvpPUmN5qSwY5qyAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRuPa8T5TcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KURN+
 No6FAsUVCzAhO3ny+vkQ/BIt8t2eaEHPKtH0p1h5RfwKK9+BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVQtuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdJMTOfjrq4CbFu7z1ciUkc8C0GHuuDjjnenYPdBA
 E0q5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L8/AKxFmUCCDlbZ7QOlMIwXy1s6
 VaPkPvgHzkpu7qQIVqN+7HRoT6sNCw9KW4ZeTRCXQYD+8Pkoow4klTIVNkLLUKuptj8GDW1z
 zXUqiE73u0XlZRSj/n9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcvlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:VUWJla0lpLM/NWRukjSiZAqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-Talos-CUID: 9a23:0RRe6W9E//k2FqNC7oWVv2sXF+YHTkbE9kuTIEDpAj82QaSxeFDFrQ==
X-Talos-MUID: 9a23:wKaRwwkTlWD3kOTIBIrsdnprD/YyuY7wEnwWiM8CgtC/EDJbOgmC2WE=
X-IronPort-AV: E=Sophos;i="6.01,262,1684814400"; 
   d="scan'208";a="118602308"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MON3IxxoAS1ajR3iKRckyouIR46ne9G6xi+eEAjD4AsLgN9RsFVbdGp+Gn0MbbP8vLea9xJOptFiNAnchOz7DLi76kKYjFpKDkywyZ3he6uQh6v/PExARssptFWuaMKaF4t/8kiq901QZcjOYD4ejzRnQ6QYLLwRcrMlbtt7uCFGIIyNI6X31oN01q82zV1m8i2uL/OvFS0GFt9EsKssaVmu6AW1V09+oQZwZKejylEoBLKl8AMo/aQTNeULHXSQM4kElUQaQWi9bzHE21Yx5dLTYOpcVgogv3Rv0q1mVAOlg+NRuffskPKxw94fe4vFvEc3d6zDrgtGbWZMA/nEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbwdwUYbSmncgELkjSuam2FjUmRyNBwN5M+qmKUJ+9w=;
 b=dQbeWjnq0VafQa5sLmwGDjie366oRh+LWyjjNLlsKCBsqhjF2S2CLXPyv+iw69sBv3HZ/NoecO87jekE9YBP2FPF3Yo2NczMTP5x7PyDU4UoZT7dI/ApXYSpGYT5o3HMaL6P1r3Ij5FWjhgPBJ7Dwd/3/KNpoKoPCYiBNRv1EIX9cf9ozI1rZidS4SV2LWJPvAUNTI4lOKFTMHbw7+3oIi656IY1vQvhIlVF1ItNESmMEPuS6NhyeTU69ymP+2mvF0Zr3pFhSBEiWTBbfoiKf/u139u7/Jg66UH+DdPjxelCeGrfgvERee3NtrDgiVIWCYPvn+sghhVNam6HiMFr8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbwdwUYbSmncgELkjSuam2FjUmRyNBwN5M+qmKUJ+9w=;
 b=qTOqjEjt+mv34qpYP7A4/4quweTqhlGjv2ysZJiEMYVRF6bwAzWa+MCVJlYhU5DWviPdsGKcAMgwLNMpMTI3S4idD5lb8rtL68p+/06LP9uqKtI05uw4rNYdCQS4IuPK4KuIJ8O6EUlj8uRi779MERA5ggUggiDadVvlKTO34vA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6a22f4d7-e0f6-67f5-ba44-af0a07523c4e@citrix.com>
Date: Mon, 7 Aug 2023 14:21:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Drop opt_pku entirely
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
 <3daf5b51-cf5f-b9c7-b02e-0db5b48aa03f@suse.com>
In-Reply-To: <3daf5b51-cf5f-b9c7-b02e-0db5b48aa03f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0133.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA1PR03MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f695e0-61b8-42e7-2478-08db97493687
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9d64nLsu7V2po0dEnZPCbLW787hkT/N+NGmB1YPWHYv5jq5uuaHlDuNYVhfFRpM8iRkLn8a6RnABzGBuUrG1w5a7aQZW7N92Bt/p2FdX4jCxM1Bg+CioOCqiffL1MLms2bSJFj8q6oMYs3U6LC9nIAC3/18/+N48QH41Htpiq612y/0kz4JmQ77vTbHJaMaxsKmDstZeue8SxuJ4VWOJI1ki1rkJ9rkXp8nFUySjJey1GyoavbyKTxkikYhkb8whD0jzWBe88bR0xMJJK5+3bIFaPnuK/DqhAK6S1kqsJ5m6AoqKpU+VRvQtUUoef6oZztTpr0JLMWl3yIMk0Mkqf4qaO8NW9uEbEpeEwRp3BttQ3Cbw0GGAA/XK64Lg7SjYffn+ZEm5RU40DlwqJGimzw3dq7iiLPoy9OGw7bSsNVV/oFajTvxSaueZmasu8NOmB4vqRY3QRuU6uT4SS5bkihiRoy3XCzJC+0nLHTqQG2XdhYqoWz6sGtJvMOQWW/HaEmZ84t5X7t4klT/QGpQe55HiNm7pkeVIJXs7XlcpStfe7Cs1Pu9LfDclmRgrR+8SybimFR+hI1VxNpej9+YUk2zVD+4lJmMaGWKvmWOjKFaq1UsXpUnhR1J0csNF24lJ+0E3neolTmd1EjkJxe6gkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(366004)(396003)(346002)(451199021)(1800799003)(186006)(2906002)(36756003)(83380400001)(5660300002)(2616005)(54906003)(6666004)(38100700002)(6486002)(66476007)(66556008)(6916009)(66946007)(6512007)(82960400001)(4326008)(316002)(31686004)(41300700001)(86362001)(31696002)(8936002)(26005)(8676002)(6506007)(478600001)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1VhNC9Sa3VDSkNVbkRqNXNDY1NzekFZZU1zeVpYZE1QWW9CQWZUQXkxLzFl?=
 =?utf-8?B?NSt1Vk5FZGFVN1hkdmdNN21VTTZRYXVtQ3hQdHRrSE9LQlhVUXh2UjRYN1Bh?=
 =?utf-8?B?ZUJ3K2ZYY1U4d3hVQ1RXUFIrSHZpZGZGcjE1VVZQSE53UkJFbVg1TURpZ1hI?=
 =?utf-8?B?TUc0Skp2elRyNklya2QvOW5Fd3ZlSk04NUdyUGlUL0dSWU5GbWQrZ01FNFdl?=
 =?utf-8?B?dS9ldGpZOTRHWllyUXhFTEUwSDJsMDlyNExIOTk4VlViOTBiY2N5LzBZZFRS?=
 =?utf-8?B?cUZIWWt3VWN2SWlXL1F1c2E5THRNaWlwQXdSM3RFS0xPcXZxcmpub3A0OXZh?=
 =?utf-8?B?a1JYM2ZpZ0xiN0dhR2pKVEs4U01Bd2RWSEpFMHl1K2VpZ0kzMmE0cWpxQVlt?=
 =?utf-8?B?K3BJOWs1b1g2ak5YZ05FR1d4SWF3aWdyRm55cUZ1dy9nMTErbzNsWnJ3bjlS?=
 =?utf-8?B?T05KaFF1UlEyWnhtVjRPaXNmY0s5OC9kUERBZFNXQjVwR1dzaE5JTnBGQVdG?=
 =?utf-8?B?WWVLU0N0dWtCNkt6OTdvZHRLNlRVS3RMQzVnMWdKSDFZNVJUMG03eEo2YzJq?=
 =?utf-8?B?Z3ZoQ3Zsa1cyOFgvZzE4TnM5bFNHM1h5SFZhbFBPRjJtS21RcWRpaXNlcW5R?=
 =?utf-8?B?NXFZcGk2cmtnV2xwd1doakU4emJuNER3eUdFc0JucVBkaHJMUEdGZlJQeFFo?=
 =?utf-8?B?UDRoaGZCWjEyWDJWaW96dUw3ZmpvdGo0VU5hcjFmUEg1MlpUdmw4ZjBWamdL?=
 =?utf-8?B?Z3dFYWxZeGhCUE1XUG1FaEJQOHJ0aFhFL0NtZzNhQk15cTJVRzRYVWozcnZz?=
 =?utf-8?B?SmhqVi9kNktXSzBMdlJ0THNXU0tVTzlNbWtPYm5jdkhSWktrRE5iOGpzaUdX?=
 =?utf-8?B?ZFdZZ2dUY2duRmtQalJKZlllWVUwR1NaL250bkd4dGY2U3JBUnRrNTVyTXU4?=
 =?utf-8?B?azhzaEdqYkRVc1lkWTYzaUtsNjV2ZmFWdW1YNCtUN3BuVDd5T0QyL3VZWHp4?=
 =?utf-8?B?SEszUnVJMDhRM3dMVnNIQTJrdXRnQ29HbnBQKzFuaUQwZHZtNmRDNWcxVXQ1?=
 =?utf-8?B?NnlueWtXZm5wZ2dLWTAyR2hlQjg0QnN0QTd1eXM5bVIyenV6elVIYzZhcEJO?=
 =?utf-8?B?VzNYMGdzVFBDSWFtdVIwcy9zcDEycCtzRlcxVDFoU3JmQWJKQ2Q0NzJVd1Q2?=
 =?utf-8?B?NUFTUHl5QUNEaGN5TTZ4ZUQzRlVybFYvZ0R5S0VvRWppQmpRSmpNT0RoelRj?=
 =?utf-8?B?TnpwdzV6RnZZL3hHVEUyeXF1YWtGODZ0OTlUcHcxMEFreGRDWjBJaWpKeWtt?=
 =?utf-8?B?V3hqdnNwdkJYelU5K0FFL1lZR3pnRUdkVlBwNXVobEFZbUhpQnBkcDhBaXRh?=
 =?utf-8?B?WUx6ZHlycHpUYnJZenBwZVMvK0Z2T25yaGdMRXJGOVZtdWlZbEQwL0lsZWFT?=
 =?utf-8?B?UndnSS9TTzFRV3RoK2dicWZEdm5YZUdXUDRnbDl1blQzTnN0OWNldm8vUFJa?=
 =?utf-8?B?dXVJL3c0VzMrNkhOZ1luVHBOOXp3R21weDNXRzRPbWQveFRZbFdodXdFRG5Q?=
 =?utf-8?B?WkdnRkgvY1dKZXkrUzlCOWVtdDVyYklQYlVhbDkwbTNRdFZJWEpOOXNFOElu?=
 =?utf-8?B?Y1R4YmFBcmx6ZkFNUXpXQmpEdEc3Zm5HQjM3RVM5bzJoaVFvVmlZV1dMTU5l?=
 =?utf-8?B?SEVXTmhlWXFDVWpwSUJBNE1MSU1VOENqak1VV25jRUNYM1ViTmxGTGNaaGha?=
 =?utf-8?B?TTRHYkFub2xqN0ZEbVhVUVpVZ3VVcG5KNFdoVFFBajdUREFETC9WU2t1VDF4?=
 =?utf-8?B?SytsMGVWaVE1ektXcysxOXNtdi9wbEsrbGRtbFdHTS9SVmhnemcrdGNVcFlK?=
 =?utf-8?B?aVU4anNndHVybUQ5N3pZVTAya2I3dmFDYU5XS011d3kwZjJWeVZsYnZ1T0lj?=
 =?utf-8?B?cjdDRHc5RFROdTRoUmFIME1YVHArbVhlb21kMEt1VlVWUlZua3N1b1Y3amNZ?=
 =?utf-8?B?dXRpYzl0M21SbE5NbS8xNnhYYWFqWm9aRVJjZHZTVDllVkF0U083YVlMUWJQ?=
 =?utf-8?B?RXNab1FMZkd2MC91RUUvSExwUDFHTGVGTDFXZGJWM3JNWWlyYzY0SWF0b21z?=
 =?utf-8?B?LzE1cHV3aHdzckpnRHdQcTlBK1lOUlMyd2g0WjNibjZGMFY0OXJmdHdwRGw3?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	IwhUVz9MJMfTQ0sZ2A3GQP7JxwNOYP/f/UWMiLy11a66ent199cWPeymzTdBrya5AhLMWeX3x+6Rk03JXEbNsnAMNljvFhgmTOs4zw0TgshEMwvtg8xv3Pjv15cIynHqfyHbr6s4oll2QGrhbN4etdsD8VFSVt4AtUhkeOv5O9rYhJhve7V7mAY277mzoAVVYTJkPCt+ijIWwb4+YWw4p59FDgaze2C5OUf/By8GMuBzmC1/Uhqp38RWMCQyxIhcjGlc02sXPlMqN8DI6/oam2nbfd1zNSaxxNeoFyIYYybLORQD2tlQE6J8zebplmj/cZmr+53EuwmZvv09oD6mDxpSOov1TSIx8Bap6GYWDP6sJnC3qHShD0cVvrWu67kc5i/kqhsZ8nwQ3b3v0kCFY5brUC4+SoqqyZfvonudmf8zIymT910pZK86bwy+Cf5YxCr9eGSraix4w6RjsdHildn9atH/xMUCvp/M7r3nz/edggUQJWZTUd+O97ssdzmWOXvFwZ7XpM8D2UH8R1vF2EPF0KtdLWAkAp29yWbf1KQKz1em8/7WIyfwk0D2Ay3ZV+rkp4otMtbqBd+4YSp2suHnMtfdbtSKOAs96LHfgzmwUhQMzFDvB5cAs20Hhajo9pAlYPh+ffZjfi9BTOd4dg9tH/a803XQfR2wn7wmaMJuEX1WKhVtkiZNL5/mSvrGQUyhN2eeiay3DNSKB9tYsHZaMKQnjmhtJXffZpixfv7YAAuPguJ33nHzQcUleP7cNSmc2R/DD5OEEfXiDD2X6ccsPKbJEZQyzkTHE0LyuBU4CYTTGUHrmT1ShDytVSxVYdVWyXDri84D23oDqatQNg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f695e0-61b8-42e7-2478-08db97493687
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2023 13:21:31.4512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLRTApKzHjj9aAHoAAzjDeWfIz89LBCBp3nfZ3g0ZzDGoaVEHEjMTHvTtZW+yDhPqFbAMPAuPqgZHLNGA3klR7VmyQOu9pyqJMSumU2r1Bk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6562

On 21/06/2023 8:37 am, Jan Beulich wrote:
> On 20.06.2023 19:47, Andrew Cooper wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -25,6 +25,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>   - Add support for AVX512-FP16 on x86.
>>   - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
>>  
>> +### Removed
>> + - On x86, the "pku" command line option has been removed.  It has never
>> +   behaved precisely as described, and redundant with "cpuid=no-pku".
> Nit: Missing "was"?

Fixed

>
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1950,16 +1950,6 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
>>  those not subject to XPTI (`no-xpti`). The feature is used only in case
>>  INVPCID is supported and not disabled via `invpcid=false`.
>>  
>> -### pku (x86)
>> -> `= <boolean>`
>> -
>> -> Default: `true`
>> -
>> -Flag to enable Memory Protection Keys.
>> -
>> -The protection-key feature provides an additional mechanism by which IA-32e
>> -paging controls access to usermode addresses.
>> -
>>  ### ple_gap
>>  > `= <integer>`
> Elsewhere you said that we kind of imply that only the explicitly named
> sub-options of cpuid= are supported. If that's the case (which could do
> with saying more explicitly), you will want to add "pku" there in order
> to not regress what is (deemed) supported.

I disagree.  I can say it was equivalent to X without X being an
explicitly supported option.

PKU shouldn't be adjusted by either of these options; it should be
controlled in the VM config file (if at all).  I'm unwilling to make any
suggestion that this is supported.

~Andrew

