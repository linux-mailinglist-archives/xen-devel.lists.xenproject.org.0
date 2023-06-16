Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4197331EA
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 15:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550197.859167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9F8-0005rh-O0; Fri, 16 Jun 2023 13:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550197.859167; Fri, 16 Jun 2023 13:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA9F8-0005oh-L5; Fri, 16 Jun 2023 13:11:58 +0000
Received: by outflank-mailman (input) for mailman id 550197;
 Fri, 16 Jun 2023 13:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uwsx=CE=citrix.com=prvs=524b7acb3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qA9F7-0002qy-Lh
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 13:11:57 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c952631-0c47-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 15:11:54 +0200 (CEST)
Received: from mail-sn1nam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 09:11:52 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SA1PR03MB6547.namprd03.prod.outlook.com (2603:10b6:806:1c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.27; Fri, 16 Jun
 2023 13:11:49 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::ab2a:a298:bacb:db47%2]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 13:11:49 +0000
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
X-Inumbo-ID: 5c952631-0c47-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686921114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=7Ds7+HuYIyt6HEqzcj5MwosLlYKE7B0tHlsStdp/T7E=;
  b=N/SQvEraLBKcjAWOw+R8HJFPEP3v59y5XfQBdGy+YJJcBsLVEqXSOc0m
   Se8CfYqZIChfzywBGeiXzGjSvD6OBXn0RqRkh11kcFPQ9kcVyTS62nNOX
   8yHlHW115KK4kGSFHP4JogTj0wE5kdhLI9FY5F05fo22EbmHxAaV/fvTR
   M=;
X-IronPort-RemoteIP: 104.47.57.44
X-IronPort-MID: 112951618
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:QEWS8aBIH0MCgxVW/wziw5YqxClBgxIJ4kV8jS/XYbTApDJx0mRRy
 mcbXzjUaKqOM2vzKdpzbYm2/BlV75Pcm4A3QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw6N1OGltN7
 MYiJC0OMjOqheC40JerVbw57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxrvwA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4WPcqCPx37GWzUsXXqpDCeSoyvxNvmeC/UgRDQUnR3u2juOA3xvWt9V3b
 hZ8FjAVhbg/8gmnQ8fwWzW8oWWYpVgMVtxICeo45QqRjK3O7G6xGWwsXjNHLts8u6ceRzMw0
 USSt8j0HjEpu7qQIU9x7Z+RpDK2fDMTdGkLYHdeSRNfu4W/5oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr8hu+lTOZJv7CV1GU=
IronPort-HdrOrdr: A9a23:J2caH6BY+6WwG6HlHeg4sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+U4ssHFJo7C90dq7MAjhHP9OkMAs1NiZLW3bUQeTQr2KqLGSugEIeBeOvtK1t5
 0QFJSWYeeYZTQUsS+52njfLz9K+qjlzEncv5a6854bd3AJV0gP1WZEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue73q7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLhyM0llWjo6i+quGRhOerN/b8y/T97Q+cyjpAUb4RFIFqegpF491Hpmxa0u
 Uk6C1QRfibo0mhA11d5yGdkDUImQxel0PK2BuWh2Durtf+Qy9/A81dhZhBeh+c8EY4uspguZ
 g7q15xmqAnfy8oph6NkuTgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 Meev309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0kN
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdI60rL22u7KCZkOlZCXkcYzveQPcb
 z6IS1liVI=
X-Talos-CUID: 9a23:I40fc27SDwkIvmdp79ss5nUtAfoma0fnwGrTf2yRC2RnWJiFVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A09brgAyB9z3WQ/FEN/QshIEf/E6aqPWzUVAxk7I?=
 =?us-ascii?q?4gdi/ES51IwaPrDmYWLZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="112951618"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/XAaXztHCW4n0L7sUejslu0aU3t8hQuZRD2RqfmfsKRofElr4VJWYpw9Uh+tS3Er/3ZvMQZvKUBolPtHEzQBg/SJPIicPOGOSc69dQFkSYGn9QzvbX+rimUxNkMVMeNgz7FJ2en01JBHVPTDOEbSOyzwT+gH8OuSeZc+xS8UZXNBrUELrjt+/fY4nfysczlXm51cC8vIwb+fFm4eXX9Obh9f6KamUcvqDGvwLcdZNQZ9+wvbet4movci7kQP2/9YUDY5t6J9/+CosjrB1Ox/NokpEGRB3TKw2R/mtFADXvgOzW3dkexllk5RZdNPtR0Yi6Il/uPMif7wlDV7rP5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/kbRo92d6u5kFORF8OyzCqReC5oQpO77s0waaoKxaw=;
 b=Rb/W8B6asNkQP85/8067Ulu8Ob9rHuGVqMtTPoxa0w9uZXUiDJkKLmv7fdGBc0aL/U4qSjJ9nDoMpTKUQZxJyJJa82QWWwpIK0HLungVXzENnVvUw9ywR6PhngS7l5pHTq3Fw5WdDDCEvFQU395CByu7b+Q0THSnVtAC7VrKuw5ISJEEjbqTRbwp3+YLHTihW4Ihmw01SG7Jvoz9k4dJGsPjsidKtMAfh6aXjjop7cW1gi4ENtIJA7a+5pbLYeK4IdLwBjsbaEzy1fLuBFSjvHsHtJBabTTSOkOY/C8b5CaquNDeUO7dSsijc3ANIhf5+KNmjD5DfkE1Mune1AhNjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/kbRo92d6u5kFORF8OyzCqReC5oQpO77s0waaoKxaw=;
 b=rPfiUnw6h6MNFxi7VKeQEb51akWHdcmAxeeOgqXORTMtjHAxLACLPJD6acr/fp/09rctk6gTu0lphitjfKhOwT/9gj02IKwYI0nZp7wrK4KTUkFZeNox3hoCzpaexPVBckij1c/81drJtI8h5Z+uTlm6kdoR8CXEpjuAsHAjR/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 09/13] libxl: change the type of libxl_cpuid_policy_list
Date: Fri, 16 Jun 2023 15:10:15 +0200
Message-Id: <20230616131019.11476-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230616131019.11476-1-roger.pau@citrix.com>
References: <20230616131019.11476-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0029.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SA1PR03MB6547:EE_
X-MS-Office365-Filtering-Correlation-Id: 0910a13f-c6e4-46ef-654e-08db6e6b3eaa
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WySOezY4OMCfwUkSycr4gqPLIIXnfHJjMXj8Zg+FSyydrLdVqtxNUmWk8/8J98bOGQCdUTlJe8osMu9K4BDIYUjupM2FAjHGRNyrho3PLPv7z5wcmlTf0UgXPi3FWD3wtSUZtDEG5wZLTSfAlUdEHV5AljJjcyY30yh2feuxJZO9zVDWK+OF8mnS6/O0dBYWJ+uaRYMfgsJLp1pluSarggyBKrNhJHJZQllyrvPekMJT3iegfz9NZEEwK8etJ3OD2t0PqbaqoNz/epVfAJ5IkYyCX6TjKYj9BZ1zi9AATj2IAoDgbH/iCHOZQzMxYTeFDinEGmosTCFLMPlKvmJC6VVD7thDR9twS7NWhRupltZROb1yLeq3ILwMw1BQx7HuSG8YdkShUoqeWfcJQWafjfXwacL9deB5vKmzE1RCmxkeefqdco7OnW/ZmirnmqJjREwMnWYmf3qQiBb6JM2cw/CFOW0p4mU8AEH29gK6dvzERFxbzzl3dW7bWPZMBJjss2BTsrnqYhKRJ5hB87ScJ6aAt62RURdnYNHfWhg4pG3YE26rF6xBQACaebxCoyfy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(136003)(376002)(396003)(346002)(451199021)(86362001)(38100700002)(8676002)(5660300002)(82960400001)(316002)(8936002)(41300700001)(66946007)(66556008)(66476007)(6916009)(4326008)(54906003)(83380400001)(2616005)(186003)(36756003)(478600001)(1076003)(6512007)(6506007)(26005)(2906002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dExpL3hmS09DUDk5cU4xcWZXWXVSQVNWVnlUZFdnUG90WS81ZzlVSG5yQlYz?=
 =?utf-8?B?WFM2WkFXK1ZldFpsUDJhYUxMdDVjWVBkZFNrRjhqY292bVZvNHVJSzV3Um81?=
 =?utf-8?B?TjVsaTRKZnliMnpNdUtJMU55OENNVXh0cHg3NjFXTTBodGpLVGp2aHJXamVX?=
 =?utf-8?B?b3BHUGNJVFZjR2tUK2YraVVzTEdGenVjMkhrT25WNmxKRmoxd3laTFhiZ1RS?=
 =?utf-8?B?TUwrWnJ5c2RacGQvSUZldkZhSmZNNFA5MVdNOTRpKzB2SXBYeXpqODMzWTVO?=
 =?utf-8?B?YzN5SWhIUHk0MFpxU25KQ2xwcTRjWXdPbWZ1UEhBNXpvaExrNndzSjREUFZ2?=
 =?utf-8?B?SHJuVndkTm9La215bjR5ZHNuT0xkcUZMQlU5NDhmQUxISzBqcTBaV2NoT3J5?=
 =?utf-8?B?dnF4TURLR3lXR3FITS9tMTRQLzd4SCtBSTVSR052Vm1WT0JDOVhvVENjMFB6?=
 =?utf-8?B?Z1Q3bFkzSndMVkp1ejBmdmx2MktLOEV6S0VaY1FLL0JweDZlclh4N3F6RVpF?=
 =?utf-8?B?bnRHd3F2TnQ3WFd2ckpzdG5JeEJlTTJVS2JvRTNMYkt4Qm1tazZ0V0EycDJt?=
 =?utf-8?B?WW5ydFM3cFlNbmt1UjlPdUdMckQ5UVk0VjdKdUY0bFh3WUtVSXBUT0xMdzJO?=
 =?utf-8?B?Q1JrV21YSXRLbnpSNXNpa0g2N0NtMmcxMi9rRDlZd3RNM3NKSVMrekhvVTRu?=
 =?utf-8?B?ZURMWkRpSkJxL0VhTWZFZjRPeE5MdVpqMGgzSUFON1IvZUczd3ZqdWg2eFIr?=
 =?utf-8?B?cExKbXVhQzhjSndHU1c5amNpbWpQaTYxUnFZR2RzREVXOFg3bTQvbnFKeXpr?=
 =?utf-8?B?b1RYRG5xUjluRDlHNW9HaEdkZExtTnkreGJ2ZkEzVEFObGMxbGMvN3VaTFVV?=
 =?utf-8?B?cUJFb1UxWWgrVXo4dnBHaGRJekwxVFNZR21iaTRDbnFjbHFQTHprcnhTYTJM?=
 =?utf-8?B?Z3puV2lJdndxTE45NzNIK2l2dms2bERucmhXS1VhUGphUHV0eWVhWWJiN0N3?=
 =?utf-8?B?VGlUaWlCaXBzLy90SVh6VEdYR0FwckdrQ2ZnYTZla3FneVBYWG9FTi8zTkhv?=
 =?utf-8?B?eFNzRWNkZ0RhY1lPa0l0RFJ3enhCQkVaOWFHWTZFOU1Obm9UWVdiZTQ2OG8x?=
 =?utf-8?B?SUNRazdKdTkwM0c4TGYrY0FnMUdZNVFscVFwL1pwZytGK2J4eTZRSkJqUm5y?=
 =?utf-8?B?ek9Xay93a3FCQ0Q5TUZpV1M2UjlnWktJZGVvRnJjdU9DamhHL2w4UzU1dlo5?=
 =?utf-8?B?cUFhN0RrN0NqRHdnaDRIY1FxU0Zyd09WamdHZjN5Rng2bVp5azlkSisyR3Vx?=
 =?utf-8?B?UEQ0MFNzQ3pxS3dEQzczTElUWGNGRWpJbE9DZ2xlV0FndFhuWUlPQU1CaXpx?=
 =?utf-8?B?Nm5hZXV0Z0R5ZXhsMmtpNkJQelBnVTZsQnpuOGtqYVZ1MTAwQzEraU5BRzNn?=
 =?utf-8?B?SlRwUVpoZXVPUGVCdElhNlQ2Q1ZsZVlhZzUxVUVxdjh0RGE5dy9xVUM0NWc3?=
 =?utf-8?B?TkswSDRBQ245aW8vQXJLSFRFYTFPbDFLT0VYZWZZYkJPTGVLMG9WR0hKZW9q?=
 =?utf-8?B?UmowbnB6S21UbFV2QXEvM0UveUEwWWM4eW5pclIwM1lVeElkL1ZnMlMwUXp3?=
 =?utf-8?B?YVhEOVVZVkdkblE0NW56c1NkUjFDR205Q0pVS0trQWFvbHo5aHN3UXZyNDgr?=
 =?utf-8?B?QjJKcXRPaUNwYzk3LzMwb0VHRVdGc2NNbnVRbmNOV2tIL1FXY1dhTkZzY0NT?=
 =?utf-8?B?RFZmZHlYdWR5ZTJ5b3Y3WGtMOFRiTzl6d3RpTUprdkN1NEEzMUVidCtCZS9H?=
 =?utf-8?B?Z2d0K2lsUyt1VkJodDFRckdrSW1RZ2FaM1Q2ZmU4UGFOZTZvTW54OFY4MjVM?=
 =?utf-8?B?VjI4MGowdkh4b2dqQkRlazN1ODRxcFZmZXJxbWVXKzdmN1ljc3JSSDFwQWlk?=
 =?utf-8?B?ZUZUV1hta0hpVXVJTW5tZ1VaQjY4WFJ6TExWUlhubFR4ZG1iT0lYdmtNQmhP?=
 =?utf-8?B?MFVweFcrUXdxMHhKalYwYVFuY2ZGOUdWMDVtWW93RFRTSmZVcU9YQi92TXlF?=
 =?utf-8?B?Nkh4RUxFSXlKNjFLSSs0Qk16empyKzRCQ1ZwUTZaNUpWWWlnMHhvcTlydVcy?=
 =?utf-8?B?ci9TcUJobUVnMHhUNzNTa244QzFZWElibjZ3bk9mT24xai9qR0NkQ2ZqVlhN?=
 =?utf-8?B?a0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6XflWninR5RmXwYjCenMhw19t+o/NiKmD+bjgL3iHqBB9ReVdYKiVac4kfMHFSvK8PXJm5f/yPrN0VeaY2/vtd3VWalqxC3qfShcskIybL4t53IBB7ee5tAN13prbIxOICW3Ed0I9dQEvlZk80JGJ6HpmmeMY4QPcDw9rqdRgDgECxJ8ux1xSPDHiZ4r+aQyajoFtd9m4ZX4vLq2CMPImcFeIlZ+5UKarEzpyrnTap6uA4XH6d9uaVmilRpUjm2CzthGqHrPgUZPoEMWeCTKpuTqSpnbOC7pBJ3JlNcuEwRCQ4L1T0JRtm0uBk08Ys0diXf9gutUExxoCP9ueZCVtNOXJimvNu5RRIBzOlNMI3e9+JW+zx1zqi/nn8pYA/cAjTUIQcuueteh1VxVySHtOP9elMzIQCgDUecLAtJSp6IyITexKVkdkII5sIoMVTnt4avPhGgKPYvjseoSbXq9R9As5aWw7nnU/RiLaG3RD8f8VGB81b9FfuZjYO3wLybkv0inomSY3Nb0lBxrD3Rgi1S8bRyRMCutkxBGnJ6E/s6FKmQy40wlJ6cRlS8BUftbYsPMgyQNeop9ZdRt1koAxb1RxbKo9JZA5zuUnzJ/1kY3oaotSUy5eIbJXetBrPAX1g2QgK5f2/HcuwLtLjAQWonuFQXXryTP4z4ucJ9RLe5jebteu/BXt0G+GVbVxEBRRG94vxPqkQ/i74SghOZBCz4WeV03qwi+tn0xhpwmmRDta/oVAfp+Gfs2jdPH7d7Ro4NkKTVHSTEJpk+NBlUJSUsJh6JSn6vVC0/UTZaeuZckBCHvkmk/9nu4CM903tM1
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0910a13f-c6e4-46ef-654e-08db6e6b3eaa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 13:11:49.6398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NZS2zBB7fvzaiOj2F1yXreu+4Zl/3VxrJZu6zLje+mm0FM5FaoJ1jjk/nvWgm2zqSYKnm5rfymYs9zOEfz5DTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6547

Currently libxl_cpuid_policy_list is an opaque type to the users of
libxl, and internally it's an array of xc_xend_cpuid objects.

Change the type to instead be a structure that contains one array for
CPUID policies, in preparation for it also holding another array for
MSR policies.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/include/libxl.h          |  6 +++--
 tools/libs/light/gentest.py    |  2 +-
 tools/libs/light/libxl_cpuid.c | 49 +++++++++++++++++++---------------
 3 files changed, 32 insertions(+), 25 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index cac641a7eba2..41e19f2af7f5 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1459,8 +1459,10 @@ void libxl_bitmap_dispose(libxl_bitmap *map);
  * libxl_cpuid_policy is opaque in the libxl ABI.  Users of both libxl and
  * libxc may not make assumptions about xc_xend_cpuid.
  */
-typedef struct xc_xend_cpuid libxl_cpuid_policy;
-typedef libxl_cpuid_policy * libxl_cpuid_policy_list;
+typedef struct libxl_cpu_policy {
+    struct xc_xend_cpuid *cpuid;
+} libxl_cpuid_policy;
+typedef libxl_cpuid_policy libxl_cpuid_policy_list;
 void libxl_cpuid_dispose(libxl_cpuid_policy_list *cpuid_list);
 int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *l);
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
diff --git a/tools/libs/light/gentest.py b/tools/libs/light/gentest.py
index 1cc7eebc826d..207f988a741d 100644
--- a/tools/libs/light/gentest.py
+++ b/tools/libs/light/gentest.py
@@ -194,7 +194,7 @@ static void libxl_cpuid_policy_list_rand_init(libxl_cpuid_policy_list *pp)
     };
     const int nr_options = sizeof(options)/sizeof(options[0]);
     char buf[64];
-    libxl_cpuid_policy_list p = NULL;
+    libxl_cpuid_policy_list p = { };
 
     for (i = 0; i < nr_policies; i++) {
         int opt = test_rand(nr_options);
diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index c96aeb3bce46..ded0d0b8bc15 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -19,10 +19,10 @@ int libxl__cpuid_policy_is_empty(libxl_cpuid_policy_list *pl)
     return !libxl_cpuid_policy_list_length(pl);
 }
 
-void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
+void libxl_cpuid_dispose(libxl_cpuid_policy_list *policy)
 {
     int i, j;
-    libxl_cpuid_policy_list cpuid_list = *p_cpuid_list;
+    struct xc_xend_cpuid *cpuid_list = policy->cpuid;
 
     if (cpuid_list == NULL)
         return;
@@ -33,8 +33,8 @@ void libxl_cpuid_dispose(libxl_cpuid_policy_list *p_cpuid_list)
                 cpuid_list[i].policy[j] = NULL;
             }
     }
-    free(cpuid_list);
-    *p_cpuid_list = NULL;
+    free(policy->cpuid);
+    policy->cpuid = NULL;
     return;
 }
 
@@ -62,9 +62,10 @@ struct cpuid_flags {
 /* go through the dynamic array finding the entry for a specified leaf.
  * if no entry exists, allocate one and return that.
  */
-static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
-                                          uint32_t leaf, uint32_t subleaf)
+static struct xc_xend_cpuid *cpuid_find_match(libxl_cpuid_policy *policy,
+                                              uint32_t leaf, uint32_t subleaf)
 {
+    struct xc_xend_cpuid **list = &policy->cpuid;
     int i = 0;
 
     if (*list != NULL) {
@@ -86,7 +87,7 @@ static libxl_cpuid_policy_list cpuid_find_match(libxl_cpuid_policy_list *list,
  * Will overwrite earlier entries and thus can be called multiple
  * times.
  */
-int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
+int libxl_cpuid_parse_config(libxl_cpuid_policy_list *policy, const char* str)
 {
 #define NA XEN_CPUID_INPUT_UNUSED
     static const struct cpuid_flags cpuid_flags[] = {
@@ -345,7 +346,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
     if (flag->name == NULL) {
         return 2;
     }
-    entry = cpuid_find_match(cpuid, flag->leaf, flag->subleaf);
+    entry = cpuid_find_match(policy, flag->leaf, flag->subleaf);
     resstr = entry->policy[flag->reg - 1];
     num = strtoull(val, &endptr, 0);
     flags[flag->length] = 0;
@@ -400,7 +401,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
  * the strings for each register were directly exposed to the user.
  * Used for maintaining compatibility with older config files
  */
-int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
+int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *policy,
                                   const char* str)
 {
     char *endptr;
@@ -427,7 +428,7 @@ int libxl_cpuid_parse_config_xend(libxl_cpuid_policy_list *cpuid,
         return 3;
     }
     str = endptr + 1;
-    entry = cpuid_find_match(cpuid, leaf, subleaf);
+    entry = cpuid_find_match(policy, leaf, subleaf);
     for (str = endptr + 1; *str != 0;) {
         if (str[0] != 'e' || str[2] != 'x') {
             return 4;
@@ -502,7 +503,7 @@ int libxl__cpuid_legacy(libxl_ctx *ctx, uint32_t domid, bool restore,
             info->tsc_mode == LIBXL_TSC_MODE_ALWAYS_EMULATE);
 
     r = xc_cpuid_apply_policy(ctx->xch, domid, restore, NULL, 0,
-                              pae, itsc, nested_virt, info->cpuid, NULL);
+                              pae, itsc, nested_virt, info->cpuid.cpuid, NULL);
     if (r)
         LOGEVD(ERROR, -r, domid, "Failed to apply CPUID policy");
 
@@ -527,9 +528,9 @@ static const char *policy_names[4] = { "eax", "ebx", "ecx", "edx" };
  */
 
 yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
-                                libxl_cpuid_policy_list *pcpuid)
+                                libxl_cpuid_policy_list *policy)
 {
-    libxl_cpuid_policy_list cpuid = *pcpuid;
+    struct xc_xend_cpuid *cpuid = policy->cpuid;
     yajl_gen_status s;
     int i, j;
 
@@ -556,7 +557,8 @@ yajl_gen_status libxl_cpuid_policy_list_gen_json(yajl_gen hand,
                 s = libxl__yajl_gen_asciiz(hand, policy_names[j]);
                 if (s != yajl_gen_status_ok) goto out;
                 s = yajl_gen_string(hand,
-                               (const unsigned char *)cpuid[i].policy[j], 32);
+                               (const unsigned char *)cpuid[i].policy[j],
+                               32);
                 if (s != yajl_gen_status_ok) goto out;
             }
         }
@@ -575,7 +577,7 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
                                         libxl_cpuid_policy_list *p)
 {
     int i, size;
-    libxl_cpuid_policy_list l;
+    struct xc_xend_cpuid *l;
     flexarray_t *array;
 
     if (!libxl__json_object_is_array(o))
@@ -587,7 +589,8 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
 
     size = array->count;
     /* need one extra slot as sentinel */
-    l = *p = libxl__calloc(NOGC, size + 1, sizeof(libxl_cpuid_policy));
+    p->cpuid = libxl__calloc(NOGC, size + 1, sizeof(struct xc_xend_cpuid));
+    l = p->cpuid;
 
     l[size].input[0] = XEN_CPUID_INPUT_UNUSED;
     l[size].input[1] = XEN_CPUID_INPUT_UNUSED;
@@ -627,10 +630,10 @@ int libxl__cpuid_policy_list_parse_json(libxl__gc *gc,
     return 0;
 }
 
-int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
+int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *policy)
 {
     int i = 0;
-    libxl_cpuid_policy_list l = *pl;
+    struct xc_xend_cpuid *l = policy->cpuid;
 
     if (l) {
         while (l[i].input[0] != XEN_CPUID_INPUT_UNUSED)
@@ -641,9 +644,11 @@ int libxl_cpuid_policy_list_length(const libxl_cpuid_policy_list *pl)
 }
 
 void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
-                                  libxl_cpuid_policy_list *dst,
-                                  const libxl_cpuid_policy_list *src)
+                                  libxl_cpuid_policy_list *pdst,
+                                  const libxl_cpuid_policy_list *psrc)
 {
+    struct xc_xend_cpuid **dst = &pdst->cpuid;
+    struct xc_xend_cpuid *const *src = &psrc->cpuid;
     GC_INIT(ctx);
     int i, j, len;
 
@@ -652,9 +657,9 @@ void libxl_cpuid_policy_list_copy(libxl_ctx *ctx,
         goto out;
     }
 
-    len = libxl_cpuid_policy_list_length(src);
+    len = libxl_cpuid_policy_list_length(psrc);
     /* one extra slot for sentinel */
-    *dst = libxl__calloc(NOGC, len + 1, sizeof(libxl_cpuid_policy));
+    *dst = libxl__calloc(NOGC, len + 1, sizeof(struct xc_xend_cpuid));
     (*dst)[len].input[0] = XEN_CPUID_INPUT_UNUSED;
     (*dst)[len].input[1] = XEN_CPUID_INPUT_UNUSED;
 
-- 
2.40.0


