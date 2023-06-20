Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB82737690
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 23:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552363.862410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBinJ-00067w-AD; Tue, 20 Jun 2023 21:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552363.862410; Tue, 20 Jun 2023 21:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBinJ-00065n-6b; Tue, 20 Jun 2023 21:21:45 +0000
Received: by outflank-mailman (input) for mailman id 552363;
 Tue, 20 Jun 2023 21:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBinI-00065h-7O
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 21:21:44 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72646f65-0fb0-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 23:21:42 +0200 (CEST)
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jun 2023 17:21:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5706.namprd03.prod.outlook.com (2603:10b6:806:114::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 21:21:30 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 21:21:29 +0000
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
X-Inumbo-ID: 72646f65-0fb0-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687296101;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LQOt/QIO85G8PVLtYt4HXIs3NuGOlElyV+fUVinaV8I=;
  b=fYjdKyPlh7DOEhlW1NhjQBcrszBJudDj9JdoPc9DCfSojCJ6dLTGEJFT
   cRFfqyhW57KcGh6EL2Qr58kO+7jNrzVAj0prGGSlQxQT07m/HJ5ApK+fI
   vCAFqFmsXRwNduY4w+DZKGUQI1Qq8gPReq5mk2MZ1f3rXGb6WHBPn2JcL
   4=;
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 112275599
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wQI5Qaxt9TS4/DeZmxV6t+egxyrEfRIJ4+MujC+fZmUNrF6WrkVTm
 moYCjiOP6nZYGT1eY8nbNu3/UpUuZeHx4JrGQc4+CAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgP6gT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV1Op
 MNGchcyV0qCi+Wf7/GXbM81vP12eaEHPKtH0p1h5RfwKK9/BLvkGuDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjaVlVMpuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdhIS+Dlp68CbFu7yTIyWThLEleHrqertBaBfv9fL
 1JNw397xUQ13AnxJjXnZDWjqXiNpQIVQNtXO/cz8B2K0KfS7AefC2UeTzhOLtchsaceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDQcYVQYM+cLkpqkphwrTScxuFqG0iND4AzD2z
 HaBqy1Wr7cZgNMP1q671UvamD/qrZ/MJiY3+wHWU2SN/g5/Iom/aOSA8kPH5PxNKIKYSFipv
 3UencWaqucUAvmliyilUOgLWraz6J643Cb0hFduG9wq8G2r8nv6JIRIumghfAFuL9oOfiLvb
 AnLowRN6ZRPPXysK6hqf4a2DMdsxq/lfTj4as3pghN1SsAZXGe6EOtGOiZ8A0iFfJAQrJwC
IronPort-HdrOrdr: A9a23:K4HRgKtUKo5f1h/CUS+AZs1u7skDTtV00zEX/kB9WHVpm5qj5q
 STdZMgtSMc6QxxZJhOo7i90cW7Kk80lqQa3WByB9uftVLdyQ6VxehZhLcKpQeLJ8SUzIFgPM
 lbHpSXp7fLfD9HZWqR2njaLz6AquP3kpyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3AxuRfomlFvJPev3TmKaLJQ3M/NDvXOUHdnUiOeWi?=
 =?us-ascii?q?HMDxoRLq8Zhy83oU9qfM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A4FOqyAxyo0zV33ZX6B5Z410Va6iaqKvwKREozNI?=
 =?us-ascii?q?Kh8baJxIoBBKwjDCpG7Zyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,258,1681185600"; 
   d="scan'208";a="112275599"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AP1yhr3GUzCZ4ZjFIdUhpOSvyrE1jeLgSkc7/JAXpJ9hluDzBvoLJ2jyJBBcE6wQjClif5G9wKEtl9RNb8dWavbBWZjUjGGBZLMVCzG8WBUHtoIMxz/zg2P2QEzVqW64rd4hY0PMPmGqo/ROOvN355ZWXfsDDISzNN2qama1l7SePr8khr00vpLTgLK8+wDJhhqzCMPSKOMH1LgD9OODX1Ah/vFITUkH04WlsEfemOKmERVdHxDpCq3ww+Lvgz5OR5POgHX01UJf8zZJEYwrIBhlgdP/+EJ2cWkY8mjOh/rAWQ87JaOUeujROjOvtKgGgm/gilB81fB07y3VutVNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQOt/QIO85G8PVLtYt4HXIs3NuGOlElyV+fUVinaV8I=;
 b=FyO7km8RoVn9yh18dM7ArSHYqbn+PiFaw9fNIpWyCJp3FmBZDNMDVHzeneZxQHRjw4K8Twi0BzIr5vtZh1SqjOLC0/q9Z+2GBWib6IhKDQnwGf/eJEyu5alV2ZmhaJ08vDqo4I36UN8dtlxCT6P7lk0N/1ppeVTboFd1ZOqwYLRTQ7QUEiGOnAQAauCDrTWiaGR56grwPE+yEILWkrQp9xJDZ6T9IllXgDpFA01WPE7tupDNn3kB6CY2AbMN1PdPpynmbNPxAmJ5SGaRlUY0xQ7PuQ19qQq0HfUhecKWW0kqwxSNiAlw/XfdUcthVzTGIsC6EsqxqGmvEoitRyd+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQOt/QIO85G8PVLtYt4HXIs3NuGOlElyV+fUVinaV8I=;
 b=Tdm9nj5yx2ahCzfB2v3a7JZOiqPngn2eui8BsIVYNsGKsSUZneAhWwI7NorH23w6vVOL40kyP9qPXYF6Bs7kx2unmvh+zQdvdUhoOyETs9YRxo0IlFe7H6xMmBp5P6SW0eM9k+3HbJBLHvX6xNwaIn3eIBBr/nuva5amdqLeH5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <8505b097-3191-ec7f-57f9-59cd49367981@citrix.com>
Date: Tue, 20 Jun 2023 22:21:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5 1/3] xen: Add files needed for minimal ppc64le build
Content-Language: en-GB
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1687283294.git.sanastasio@raptorengineering.com>
 <a2acef7759c79df311b06428f0ab4b6a940fc0d4.1687283294.git.sanastasio@raptorengineering.com>
In-Reply-To: <a2acef7759c79df311b06428f0ab4b6a940fc0d4.1687283294.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 848f7986-f8e9-4ae4-c71f-08db71d44fc2
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qeeZ4MsxCrwh724vhpr2A+Qbixahn0Mr1bwpgPsXnXAvdkMBLZrGh5mPdkwEMjixT3FqBpz93dVH/ewnttu7qprah5Rr2/I1iGJOMMixtmsGXT2xOVSyuJ4eeVW7We95T4Fikt9bHd7gbj1cdSuHktDSfUBjJg9hdX6sUITizNpKuyYnzsKALkdjzG3DqmBfeGJ7usRr2L3J5xyH0uJGNuizambMbH5v+UVlEUPQRh5Ob8nkW3XYSQMv0+kf7d/Cu7YL8ZhY7TQZY5bRXwNTU/MoLdWi2dyffBpuxvp14igfIHaVw/MT6gdcGpC/f/HEqTX4vW4rTxjQZMMXD26Hxmk4UAOwdBJ4BwylBqOXAKHLH84p6LXar0Mf6rrfyOdksZJ3x2ebYPZwWjwx9JCvTWrb9xl2j94S1ygD9jHSqkRgZlxgtIAS8IIn1fIfKo8RMVx5frAmOmLrK9Di1ETt7+Kn9SwF4voXLbrqfPcFdlk3k39Dj4ZfQSY/IJhkGnIZ7GyENe6vSv5nTvXOY4r4MaBBZ604NLrDAGQluvs69xOvjDM5RI95pkSJW74hgzFUKD6ibNRKdxAQEd7Aa6q1HUWXd2SYmKbmwFy6v+AgtGkocCrSjp2iZGL03jZy7sK8jOqdiFuBjM9MG+Aq2NYWcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(366004)(136003)(346002)(39860400002)(451199021)(2906002)(316002)(4744005)(8936002)(5660300002)(4326008)(41300700001)(31686004)(8676002)(54906003)(66476007)(66556008)(66946007)(478600001)(6666004)(6486002)(82960400001)(6512007)(6506007)(36756003)(186003)(26005)(53546011)(2616005)(38100700002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZIRUpoTEVFR0hDNWh3Wm05aVV5K2JTNDhtakZuUzE4a0kydXdqdUtMbGxx?=
 =?utf-8?B?RllISEQ1dFpLTzFxR0dGNHF3YlBKL1N6NzJkNWVoMFFpQWhEYThuaGNXRk1Z?=
 =?utf-8?B?cWNtU0tVN044MUJ6NkVoOWxXZFlyNzA5NE8xQlR5Y1JrNnlFd25pclE2Z3Ey?=
 =?utf-8?B?azlsRit6UzJ6dGl0YWx6YzRNS0ptQW1ZZkEwQThMMXQ5akFiNk84cWgrMk9Y?=
 =?utf-8?B?bWJOWUkzNVQzb3Q0c2RWUDY5VXo5WmRaZm52c3RGVStUNVFnaGVtdkcvU3h5?=
 =?utf-8?B?cVJiYXVlZVo5bjRxRDVqNW1xZGJxUGQ4aE9wRjFQTGc3b0ZNR2ZRMklCR3po?=
 =?utf-8?B?UHpocjFLc1I5NlBwdjhKWWo2Z2lHbDM1eGlMYVlGdm1WVUxFbGhBdjR4R0Zr?=
 =?utf-8?B?TCtKVkx1akFvY2wzblpSWFhnNTFpY1ozVUt0U2FibldicDNiM2I2ZnhYTFRX?=
 =?utf-8?B?Vk9BVjdNRmlWaDRxU3NUQ1o3TjJUTjcxVUtQVWFVZ0VaZFlzT09LQ2YyRGRH?=
 =?utf-8?B?Szh6Y1NWQ0FScXFWL2tkMXZyQ2U0QUlKQjc3UkRhck52RjcwZ1VHaEtheUpJ?=
 =?utf-8?B?MG9ueDNBR0creHRnWTVuMy84eWc1V3ZPaUtxZTMwcklxT1FCSVEwTDFnWFFh?=
 =?utf-8?B?WHZ2RXg1eVA5U1RwRitoazJEZTROL0FyaXlTQzg5K3FnM2Q4cWR1VVFMZXFw?=
 =?utf-8?B?NE1XeTExeStMWGttWUVXd0JqWURSejhFVXBIWm4zVTdLcGZwaGhIMzFSQS9O?=
 =?utf-8?B?UEJUWEdGUytQM1NlVG9DdkwxQmIwcVdoRTh6YjlxZDB1QjhSV0FGUUxMV2ZP?=
 =?utf-8?B?ZzIxbjJ2Z0gxSkFQYytld2ZSdVA3RVhKQ00wMmZDdGtvdTJBcDhuN1IvU05N?=
 =?utf-8?B?SDEzUDBYREZ4WGRQNFlINWR3TTJLMno3TXdFb21zSmpGSjQ4UEhPMDBHcGVR?=
 =?utf-8?B?cEdXa3VrNlFhQmt4SWkxaHc0LzRhZjZ5YU5nNy9JcG5HZlNPUEdaOHhJTi9T?=
 =?utf-8?B?Q2xwdmFIMDN1RE5ubHdraHNNVG52SzUyZVd5WUIxV3cvK2lpbjdaa3AvYTJp?=
 =?utf-8?B?Y3h6SWN4M241L2pidm5OSCttNVM1QklBeElkdmRxU0VCWWVJcU9jaVRJU08x?=
 =?utf-8?B?S3pQYmROWEczc0JVNTBEdmljUS9WVmNjTlg3NlA1enpvMWNTV3VnK1U2alVq?=
 =?utf-8?B?MXU1bkkwV3h0d2RNQTZCMTI3UjNBZXlmc285dno4RjBVQlZ3Qkltdm5zOFF4?=
 =?utf-8?B?YXIyS1VQWllEaENCa2J5Mlhud2hxMzBWZXpOSmZZUm4yV3hEci82ZUdLbGNB?=
 =?utf-8?B?blNGNUhsOVROYkFVc2wwOW5ZSWNwMDUwYkk1alYyZkdGY1oxSnFzODdsdVJa?=
 =?utf-8?B?N0laSHgwdDhJRDFiMlpwTC9LRkNZZHBkRkZhVkUwSktMa2sxdXVESjZyYitD?=
 =?utf-8?B?bmorZ0pUSkRPcEwyK2hRLzZmV1Ixa0lXa1hFTlZEWENMQWZVcVQ5WU96YjF6?=
 =?utf-8?B?cmZDNU5nS3BFb1QzbFNzVE9MYUVRNFYrSTFnaDQ2b3B5Wi9XR2lGUmdSSFpL?=
 =?utf-8?B?VkZzOVNyWkRFK1FGWTJmeCtPRnltMG95QUVQWUtOWVRHUUtQWlA5aVQ2ZWpn?=
 =?utf-8?B?TXd4QnpFUDRFSWRFc2xVRmZGS1RQYUpDK2syZkx1czNiL0svUFBCSVZxamRK?=
 =?utf-8?B?WFpmMk50VUV5WWcyNE0xOUlrYWVEb1FoNENXenVNTjQxaW9MV05rVXNndUQ2?=
 =?utf-8?B?eXMxQm9wd28rVkhHbzZEYzJEU1kzVXpJZVE0M1NXck9HdXBnUDNTUVBsN3Zl?=
 =?utf-8?B?bjZJcEVSUnQxR3kxak8xVVQ1SlV5VmVZWTN4UHdFTk04bnVRU2xaTUZTYUxF?=
 =?utf-8?B?YS96VDBZb1VBblFlNFZnRlVIZlpuWERVL2UzbGFxczY5UmRiVDBjaXFnRWh1?=
 =?utf-8?B?MEtzTGd2NytWN3BSNlhzMnVxY1VnYlpGc245b2FNVG5yNStCdys3RjZLZ0tv?=
 =?utf-8?B?UUcxYysxRkxWcVpXRWxTcVpPYVpRTjlxNTJ0YmhYVTFSbEZmODZFK0lFWGlC?=
 =?utf-8?B?cFdVTk5BOWhoZDZPZnd2RThBaFZHWkMvWGtvMHZ6dXhQcHNaSEdCeUZ3S01r?=
 =?utf-8?B?MVFVdHA3OU5YVjVtcUttOUVGNnAwOVltZ2VnOHRsTlFFaXMxSlo3TU12d1BL?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	kBFLwR2dSJ0mGhDttSfT/rB5kDtl9/l5lO+uP4gkWSo+XOyoYQt1ibLr1PdY+cOgtiTp1VAdzSxjRXP/3c0hVkSNEymTKItqcK47625Yd4siksPSWyzIW9TAemYqaz98V2SWwF7jDNpCU7EzxB6JmWwvE4aIgCsCP4I8Ed8j8S/QFQTYLGBFCwVuu/JzoMsHxRQZmUGunRVbsgkfgnRIRJDfdy5Hkj57XTcqzlzwCqM8s6fHHEH4sjhfCZmmMm26xbRO8Y3vddLDviS99ukjo/9QB8ee3OwDa4H3lG232AALXxzOOR9YRjFRz8gvJ7pu1FRzIJYOIKsPicMJqD4Ku5qKkVtf1W6FeZBCxXFyfHCoJai+ZmaYp05+eEzehvBV58VLcA8ZL4trxw7oYgGoUbBRwvGplyq1ZztufxXamH4mLuWp/NTtcdU8nOvwEj43Q482Da95IqLg9GORDOC6s9ANtIdy4aQAILZoUToSDt6Bi3xKKD1Tz4f2p/jOGuW776pcWKaufC1nTzO1lO5OuUsOr+JicjiQe1ftT68nhw7BU1yU/mbK5R5Ad8CP1Xm+F9tziIj+hqQmO8Z4H3SSx9jnN9bH2xCFDMY83tP9jZRpH83C3Az7SrJs6ccPqnxqutOM/q2QMPpx2Hm2kl5g7ylFrM94SmdYbbbTQuS3veiKxTO24py0+dPoc0VQlSYaWFkotucT9poU+0/VdC8D+oqSd5jfZh/9AnBGBGFFCz7p+xdtQYOskkns8bVPQU13HIao5N3Mz8ikZ0iAXCd/4UCxTZIEF/TkTm8zOdZyOaxHCzYrnzdLCcAzWzUFWDJifXFxUWtC+v9XFAYYKfYfWwtGPxEP9dN13HO2WY64ovqo+hRkUlZ+lSFl3Sz9B98Gy9LDBLO7k5drGwHYMGruEA3ZNYRwsv6TN5JJYQpW6uM=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 848f7986-f8e9-4ae4-c71f-08db71d44fc2
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 21:21:29.4068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ozm+Mjeit1804KpilTHvMG/v9JVDChg0NxsukKL1bDgFuOS+26H/OwyRu4dTP0E33HlBbOSud65pfiaGI0BQpdesAMXyCFRjV1SIhLMpxSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5706

On 20/06/2023 7:12 pm, Shawn Anastasio wrote:
> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
> new file mode 100644
> index 0000000000..f75d9be4ed
> --- /dev/null
> +++ b/xen/arch/ppc/xen.lds.S
> <snip>
> +/**
> + * OF's base load address is 0x400000 (XEN_VIRT_START).
> + * By defining sections this way, we can keep our virtual address base at 0x400000
> + * while keeping the physical base at 0x0.
> + *
> + * Without this, OF incorrectly loads .text at 0x400000 + 0x400000 = 0x800000.
> + * Taken from x86/xen.lds.S
> + */

Sorry, one last thing.

What's OF?  Searching around suggests it might be OpenFirmware, but I'm
not certain if that's applicable in this context either?

~Andrew

