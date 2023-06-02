Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B983A720732
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 18:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543204.847972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57QM-00075v-4y; Fri, 02 Jun 2023 16:14:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543204.847972; Fri, 02 Jun 2023 16:14:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q57QM-00074I-2I; Fri, 02 Jun 2023 16:14:46 +0000
Received: by outflank-mailman (input) for mailman id 543204;
 Fri, 02 Jun 2023 16:14:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q57QK-00074B-Qf
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 16:14:44 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 941608ba-0160-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 18:14:42 +0200 (CEST)
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 12:14:39 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5214.namprd03.prod.outlook.com (2603:10b6:208:1ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.26; Fri, 2 Jun
 2023 16:14:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 16:14:36 +0000
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
X-Inumbo-ID: 941608ba-0160-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685722482;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XFPv7WypZgzmAoGOLgUcRrLawxkZpdT90vj6FHjtCV4=;
  b=TWqVmD+FWZMk72t9J/B6hZhgN64w14BknuRNkorNRXMQgTtYFgHwOHe3
   NAayKBXHAi94N7Uf2udUBP17nAMfXjcSDndsUmFe+j/qYky5zdcjBYbh7
   oNopFB69RyOU9fbRH3R9t7i/RmaCzh970FmQf3S1o29x3ThGaf66RRsQx
   E=;
X-IronPort-RemoteIP: 104.47.70.104
X-IronPort-MID: 111275469
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:ODsXcqx7xD9tCyOhXL56t+f3xyrEfRIJ4+MujC+fZmUNrF6WrkVUn
 DdJDT2Faf2MazPwet4kat+ypkgPu5XUnNQ3TAJrpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaoT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxg8
 aYxKB0TVBSkndOswryRaapxmdt2eaEHPKtH0p1h5RfwKK9+BLrlHODN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvDCVlVQtuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdtIS+DkqK8CbFu7xnwBIzc0UHyArODgjkqecvFSE
 WIKw397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhC03hrFWh8hU0ay+pAjDm2j1/sSPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:u9NfY6lmzwlfBgJJHSWMIq4lt63pDfN+iWdD5ihNYBxZY6Wkfp
 +V9sjzhCWetN9OYhkdcIi7Sc69qADnhPhICOgqTMGftWzd1VdAQ7sSiLcKrwePJ8SczJ8V6U
 4DSdkbNDSYNzEX4voSizPZLz9U+qjkzEnev5a8854Cd2BXQpAlyz08JheQE0VwSgUDL4E+Do
 Cg6s1OoCflUWgLb+ygb0N1FNTrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P+7E/6m
 LI+jaJrJlL8svLhyM05VWjoKi+q+GRhOerMfb8xvT9ZA+cyzpAL74RIoFq9ApF2N1Hrmxa2O
 Uk6i1QRfhb+jffeHq4rgDq3BSl2DEy62X6wVvdmnf7p9flLQhKfvapqLgpAScx0XBQzu1Uwe
 ZOxSaUppBXBRTPkGD04MXJTQhjkg6xrWA5meAegnRDWc9GAYUh2rA37QdQCtMNDSj64IcoHK
 1nC9zd/u9fdRefY2rCtmdizdSwVjA4HwuAQEIFpsuJugIm6ExR3g8d3ogSj30A/JUyR91N4P
 nFKL1hkPVUQsoffctGdZc8aNryDnaITQPHMWqUL1iiHqkDN3XBo4Wy+rkv5O2xPJwO1oY7n5
 7MFFNU3FRCB37GGImLxtlG4xrNSGKyUXDoxs1C5592tbvmWrLxPGmGREo1m8Wtys9vf/Ezm8
 zDSa6+L8WTU1cGQ7w5pDEWc6MiVkUjbA==
X-Talos-CUID: =?us-ascii?q?9a23=3AbTT9G2h1YriQT8iqRe55++6oqDJub1PZll7QDlG?=
 =?us-ascii?q?CDUFzeaeXR3Wzu757jJ87?=
X-Talos-MUID: 9a23:LCrlzQqterhCkh1Kh4cezzFyJuxCwaGJM00UyJECm+CnOBZeJQ7I2Q==
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="111275469"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlrsZBIM6ktYE84Fp+SHOznwZqdJFAyEUdqv6BSC7/0RXDCIblFwPm4tTaZLWXCLN217/9Qx2U5wj8zAx6GPzFLSntJy5dtI4Y/h5NzJi1bhlIe0d2Ggf91JVBmTV5Km0ZY2d2UNueiRBL5Z8yg/Z8FqLwPUmTlgDZWOIj3RuxY2sbI7MRdF9/JwzJc7HPeQ/+GDw9kxoB+KI2WDQjJ/4R08nokOw3Y1I3SdeRRkcidPOOtSPRRRrzr+d8S2zdT/RiVpZXCzpFSqKP81VkmNxNIpQMONVlv3XAjXBJ7uKL7S91cGntRD+urnGIJwb+sfgriVlXWLtTHrX6XQoiiSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFPv7WypZgzmAoGOLgUcRrLawxkZpdT90vj6FHjtCV4=;
 b=jQsoiSSlxwqdEtttBrn4cDKFXUsFWhN1Nn4N0kg1lSmlgDvX7Se9c6sSi5Lv5pgL963puLHarfMreH54u7KlmtOGxP+bWCdQ6yT7ll17b6Q7QXqYb4BVO93CdI5O2ECsSRUQtNNWIAutDyIaJxv0ck7WQ3etEefg1flFYTdXP3biEdi1Jz3/E24zUYF0kwEAg8x5Uu3sQmmJZCUaj5BCzj+qA8CFm8JLnnyF1pcYbEG3v4Qq787Y/FgQR0+OpD05y9ZXAmpyr3uwH/j0ND3RZhXhBwQxAc0IgVts1yPPTmrOHXGgL9ePXZZE3riERCOzXZAXFnu2+SVuKq5dnBtpFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFPv7WypZgzmAoGOLgUcRrLawxkZpdT90vj6FHjtCV4=;
 b=cNvHPx+gCPIHjqQEArDhtlDZQKI4vLa2+f3FtdAo3RcA1F0JnQobufYebUfEquDHb/xQcfdhKl/wfNJxP8ygEwoQ3Q5UmM6qwy84WxNbzIn2GG/lCSU7dky1TYxphFn1836Bq0ipxrXuhz6OwFuBosQKTqkNNXo/HMiDpxS0iC4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <b53a2604-5588-24fb-d6fe-03c29b1ae8e3@citrix.com>
Date: Fri, 2 Jun 2023 17:14:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
 <55945272-58d8-3dd3-19a4-0dea9be1db6d@citrix.com>
 <647a13f9.5d0a0220.d924.94bb@mx.google.com>
In-Reply-To: <647a13f9.5d0a0220.d924.94bb@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO0P265CA0008.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::11) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5214:EE_
X-MS-Office365-Filtering-Correlation-Id: e81bf1db-3a5c-4842-e89c-08db6384754c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SooRqfDSQ95cYxHvWBoyz54AuR2EdQyU+aAuvxDA+srJncCp622WKiWHO+bw79fHKfgX8uAnuFZC0G/ot5ulLd0+qVVg4ASl84Qu4Kmk2YarGieVU7fg+KJL+Lx2sdEhOAXr4oYs+HuK7Kn+EfZVDRhCAxmFYad3LitlTdo+j/c/60slnCMa3GQ3F+ErIoHsEiK2960UzCZqvp84lRCNCzv/VDoNOFX8uFKxzVA3R5P7+roGE390AKU37fRqDnUAQYaTgdjipVwhSl6iLkOgzpKURj0UAbc9AOnn2ObUKa/JC5PFCUgHcbbo/MqLLX3wskRtAPOgjn8s5CoILqsq06qYoI3G8kfSsJXKgCC0F9eI1Cu/Ql8ElwemDsX0YCbMNwssvpRXwYVCwmcR6oEjTaCm7vpbiJnqRY5BNY7gra3YSh+q6Njfh73xlFMBS1YW8XjJn+4QKY7ul5d5fs9UkCfMGhrr8GaQbZqnWWjySN2yuCA9QmDqiRAc/PTWq4IsCeLlGR+XI6ug1NkiLQcvlY4eHDkA9LrMJTEHFL1XAhmyVXoYSZryANZ9mX+v/6a6y/5w+I7WwUCVDo7G9g/JtoOesgtQ2rZH3dICBNemd7KCl/Sn7OBK+Kk32goPMPqAx89KyM7NUtELQpsI0r+kfw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199021)(83380400001)(2616005)(2906002)(4744005)(36756003)(86362001)(31696002)(38100700002)(82960400001)(316002)(6666004)(5660300002)(4326008)(41300700001)(478600001)(54906003)(6486002)(8936002)(8676002)(53546011)(66899021)(186003)(31686004)(66476007)(6916009)(66946007)(66556008)(6506007)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U2wxVC9IMm5LRFZJc1AwRGJWYmdEalFkejcySzZGRnZXdW1oWFVuSnhzZlVQ?=
 =?utf-8?B?YXJ3YVZoOFFwaklQWWhYbE9FNk1QUWVFeEE1dHNyRzhncS9Za0Vncno2aHBX?=
 =?utf-8?B?T0FCYXdPT1I0ZWtBSlhNTVpIUzA3aXU4MkNTaDI4Q2NZS3ZYd0l4NlErR1FO?=
 =?utf-8?B?K1o5VmtRNEhuSlhsT3pPOVJvcDR6ZHJySEpvNXd4L0V5ME9QazREaWpicjdi?=
 =?utf-8?B?RURtTzV1TzhTSVVYQThpelNiL2ZwNVg3Sktja3R5OTdOY0pMTUIyQ2xhcWNN?=
 =?utf-8?B?ZGcvdHIrMDZ0OHBFbWk2ZU51T2ZVMXRkdTlTSlNTd0xleE5EYU9rK0J4UFVF?=
 =?utf-8?B?V2dYQU1SRzBsTm80alk0MkRIL3QramRvUU9JMStmckhucHlBa1czVENoMjZE?=
 =?utf-8?B?dkpjSHFWMlAyTXRiRWYvd2hKNmtrZVdWQUNCR3ozMW5vS1RTMUNnWXV1Unk3?=
 =?utf-8?B?b0JTYXE2bjVxWmJXaVZUQjBIUjdCQitpK1Fpc1M0Y2ZiaDFIbXBVbUp2OEFa?=
 =?utf-8?B?eXI3Uy8vMWpibmFnelptYUZDOEMxTy8wOGhSNERSNEhXUVR4b1RmNjg1U3hS?=
 =?utf-8?B?Q3VnRjd5RFJIZSsrbS9WdmtqcFY3ekIrOVJXTVQ2QVpDeDVpTFZ5MitLWEoy?=
 =?utf-8?B?Z3lqTi9sMU5RK3V1NFcxVldnSSs4UktWZ0RnYUsvOUZveUFBcXB2VEVic0pl?=
 =?utf-8?B?bzhTY1BzejViemhuK0NpNUNpeUQxR2xmWWdINUVTSUU1SmhFYmd4ODREUDFV?=
 =?utf-8?B?cEFYRG9MV0xjcTFZMlVBdDI5WFBzN216cDJCaE9ZMFc1OEJwWi9MR3NYZktO?=
 =?utf-8?B?WmlWYXNaVGVJZTNtNmVGZVZlajZBM0piZGFHclZpaU9UUkhsWjlEVy9uZysv?=
 =?utf-8?B?amxablRGVjFPN3EvS0NnM3pBbXF6b2xiclh5WWcyeTVSYnBtMHNEV2RvVWxm?=
 =?utf-8?B?cVNpVE9QMGJZSlRIYllYSXFGMW9aODVyUVVsNDR3c1JzWVQrZkxrWEU3bXU1?=
 =?utf-8?B?UHdQUW1LaHRxQmZjb2dpLzBZM0FQRTI5bm5JZ0N5R2prdmVUZDV0UkNUczRI?=
 =?utf-8?B?akNUSUxQUTRMWXhZdzV5NnlhdGpSUlAxRkVTRjFSaXZmdUs1N1lzdEhYZnBw?=
 =?utf-8?B?UUtZckVYeWFuRnRQR2Q4ZFQ5cThmckxnWTdUaExPK09zU1JJay9hcTcrZHlZ?=
 =?utf-8?B?MnZzblNqR0lpZ2hVM2xjaXVIZlhyQXRzZ2tiT0laSHZpcmxsOUhVQ2RQWW42?=
 =?utf-8?B?OWdpRVhXdUVOc29SVmxUbjVyS2hpM1lEa21xbWFZRXZ6V1JrQkc5cnk1S001?=
 =?utf-8?B?NENnZGZsVmJiRHRxQzl5UitaY0lVOWMxVnE2YWZ3akY0ZXpjdmpvclErNDBB?=
 =?utf-8?B?OEN1dVJjWG5lemF1WVhnTVpsUXZFT0xuNVQxTlVVcGhOMG5xUXFXdzJhdVFy?=
 =?utf-8?B?UDJIdVo2SStpT3VvYnZ6WDhJN0JPTm16ZjRCNkN4QUJpU3o1aW1XOUpTdkVY?=
 =?utf-8?B?ZWlZYXN4MmxLMU9EMEMyQXgrYkNVV1c1SDY4ZklpbHZkUEpoWDhLano4dERv?=
 =?utf-8?B?K2Y1SUZuUGlOR1RSWHRkeGFkTmdBa1BVckFTamhaL2diSm4zWXRyZ0Z1MHNY?=
 =?utf-8?B?VWEwdEMrdGRMcVMxanMyS1ZmeGdiSTdVVDhxVFM4RUFVUzFWWjluVWNzTko2?=
 =?utf-8?B?NW9TMGI5Qm9mOUE3RllodE43REFhamI4SDM3aWhxSXoxWUlpK0RYUG5jK0pH?=
 =?utf-8?B?YTQ4cWdhTGFHTHJnL2VSd3BMZlZsaTlYd0lIM3VORGoyM2lvVk1mYnJSTVdV?=
 =?utf-8?B?M0dIMEtXMSt3Zi9HMGY1RGdhVExFYzlIdTk2WnlzYTdYSGV4RGw5OG4yWk9Z?=
 =?utf-8?B?blpHY0s3b3FKaElGT05UbmhObHE0bXpUNEo2SUtyZEtTZWZkK3ptNk1tWWdP?=
 =?utf-8?B?Qytpek0vT0lTYzdObzQ0WDlCeEdIOENYaU1GSlpsQ2RINXprK1l1ZTVMQXA3?=
 =?utf-8?B?Vk91Ni9LdlNTMTJ4emhlekNacGNibHRjakhIWHhGRlMyWVE3ZzcrTDlKejB3?=
 =?utf-8?B?SnF1VVBhRG5FSUVDcW1JdDJrbTJOOUdSRUx4U3hGUUZHVUtoZjM1L3VSelI2?=
 =?utf-8?B?azFKQXJUUTZQMWxrdXd5TUprTGFLOVdyZ2lIbkxmWjNXRWlxa2lPZHI5L2dr?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hr6zibg6XzUeJunS6g/WuMAZu+44aUJd/iweysZT6nKxJc82pj57ANRCSMppz/xcGYa4SsfhnFI+FgqUc9i9EFvER0ZPhl6/ZzVxKO4JPZ1isaXlDvi8qKwQzasa2i6tFZNudeOYRi+YiAX2l1ZN75LVtwHe8/t0A9okaFYO9wPA6IkK8HDoRQ3cxgKiPIRNzWvaWgyMDiY9H95gilkm7fhvXO15I0RqZdiRujUaw59uEzolyVTBfR3gQEQvcCT84ePqQsi9Dz+JVhk0Jbrk4Hr+KvKQgXdW6uUgwyrb7A/Lp4bpbmXWjbUJf2RIoUjM9RYY1rHPcuu5NpjkE24fzd3KSQkte5DzP7nz/zD52MIRl01d5C86nQM0SQfzUfflc4v797NSezZXoyABvk0hf6Q+pbCTOpqsjrX98mLsJpbtTFDJ/UdhkyXg6Wc9iCc+AAE4Y77IzWbGRGVpXeFDXZwrOCF/35MiNYcEqFIc9jZOzzGl8ONuRATGmiryEMjoSow8xr8KpmkAlDL6OgOX3JTnxCKjE5bfc2c2+HSrE1eYBPYXWTuIyfeMdp7xUZROEhHmRrHbnbDp3CBvXtau0e+eeFRk6U8YIxeRBBssP+xPnywtC/M3rnK+EqvBXryQzrsg+dCvuRimz4eNYS65PSbBAk1H/TuSboF+TCJM9O11/4+Qb72p3J54BCRaPt7642VztkvjdXOfVxEM0j3M5kk2NjMQSDSZyxQkMFaPj0a+IbRvlPINKWi8OD/9tlkIQgyyQdjr/lmMyEMrT6Kk/pCGIJ66dM7qj87bwZO1ls+WSV7Gei6gy/QbKgQ0nbqRjYiZBIwh0VNdgDtVADqk/MvzY6VS2503rMrd+nZfU0A=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e81bf1db-3a5c-4842-e89c-08db6384754c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 16:14:36.1140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nnuqNY9jJHxftIRELujkTBtWmcqwoKyVqnDqY0O/ddl7VE+KJUODcMf8SpfTyDFBszkSXrk+M4ym3TTowK3fWdszq1+PF8Z+Rn5Ai75J1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5214

On 02/06/2023 5:08 pm, Alejandro Vallejo wrote:
> On Fri, Jun 02, 2023 at 03:22:20PM +0100, Andrew Cooper wrote:
>> Linux deals with this in verify_cpu() (early asm) along with a FMS check
>> protecting the access to MSR_MISC_ENABLE, rather than using rdmsr_safe()
>> and catching the #GP.
> On a related note, we don't use rdmsr_safe() either. We just hope it exists
> on any Intel CPU. It fortunately does on any Intel CPU we care about
> because it was introduced shortly before Pentium 4 (Netburst), so we're
> fine since we mandate long mode.

Oh, good point.  Yeah, that's fine, but only try reading it in the case
that we've found LM, not NX, and GenuineIntel.

There are old versions of Xen which don't emulate the MSR at all, and
the only reason Xen does emulate it in all guests is for a
CPUID-faulting corner case.  The same assumptions are unlikely to hold
for other virtualised cases.

Failing with a clear "NX not available" is strictly preferable to triple
faulting.

~Andrew

