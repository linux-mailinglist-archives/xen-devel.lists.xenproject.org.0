Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4435EC8A0
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:53:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412811.656277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCtg-0006Pv-MK; Tue, 27 Sep 2022 15:53:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412811.656277; Tue, 27 Sep 2022 15:53:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odCtg-0006N8-HH; Tue, 27 Sep 2022 15:53:24 +0000
Received: by outflank-mailman (input) for mailman id 412811;
 Tue, 27 Sep 2022 15:53:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEHl=Z6=citrix.com=prvs=262470e07=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odCte-0006Lf-PJ
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:53:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8207434f-3e7c-11ed-9374-c1cf23e5d27e;
 Tue, 27 Sep 2022 17:53:21 +0200 (CEST)
Received: from mail-bn8nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Sep 2022 11:53:18 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6516.namprd03.prod.outlook.com (2603:10b6:806:1c7::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 15:53:14 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 15:53:14 +0000
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
X-Inumbo-ID: 8207434f-3e7c-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664294001;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=H+VgL4WSKpP+S+SO6sL3Ai13+LdfkScFNzV9CmQm1+E=;
  b=QS4Glo1t2DP2P1cecDlqp6KXARJ3sjOqp18wB/6msrJKtkVHz548ZsXn
   X5Mc6sABdDp1eirE3NOkPcHU9OyFPlhnOPCIvRwFC+mb1LBQlSiPVZHul
   Z/DlaAa1j7hF7+hAE2SE6E7r4RqAkFnZuzzR4SRiOOuBUMYrFUyc4ldc2
   4=;
X-IronPort-RemoteIP: 104.47.55.175
X-IronPort-MID: 81109928
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:yLKQUa7tjpZl85vHaQQQLQxRtCPGchMFZxGqfqrLsTDasY5as4F+v
 moaWj3VOKuJN2b1L4x1Pti/9RkE75aGzoc3T1ZoqiBkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvymTras1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPYwP9TlK6q4mlA7wZhPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5dDkZ31
 fxBOQwob0i5o/P157ihTrdF05FLwMnDZOvzu1lG5BSAV7MMZ8CGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGMkWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL137eezHmrMG4UPLyA2sJa0EGi+mASCicabHiq++CCh1HrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/037kSBx7TZ5y6dB3MYVXhRZdo+rsg0SDc2k
 FiTkLvBGjhHoLCTD3WH+d+pQSiaPCEUKSoIY38CRA5cud37+ths01TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:tHlep65Jr14yBfoqHQPXwVOBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A30QaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGw9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9QwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgrf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQS/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpbzPKN
 MeQv002cwmMG9zNxvizylSKZ2XLz4O9y69Mwc/Upf/6UkUoJh7p3FotvD30E1wtq7VcKM0l9
 gsAp4Y6o2mcfVmHJ6VJN1xNfdfWVa9Ni7kASa1HWnNMp0hFjbkl6PXiY9Fl91CPqZ4h6cPpA
 ==
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81109928"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XuFZgtwDOe/qQq/QeAJnmiBsZy+q+08z18T/IYth2O5fX1hWeH7jw9cBSb53+B1INbL5Gg53CjvZ5SaVQ20/BSBafD2wxwmWdmEISBcA6vQqonhMoAb/bpPpYIEaFRpyYeK7N4mR8tovEfPSCI+YVNj6nhc0F3cfmoGTxamt+lZ6PmssnOXNc5xPjfoZIfsEwrtyyjdj+AvKqyqYhU/h11TW4aaeTsfUyz13DMyVd2DetoaX8sMn1vchMyTvtYFowWGQIimzFxUq40VtZMEhFOH+FU+JPzvc8jqFBXwOmVR5d7rB2luf2S0RSp7OxxaaWYhceOvaNq/y4EhHKkjrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wVkphd21ENVtWsNYeVVgVUbFeR91ASK26PDzuyvoD+4=;
 b=fZUPPewzqRplyDOWiEHZCt8cMWMoRFAWB5ghv91ncwi/Af7u0glxAca/QfdNd+pqWqrWY6DNEeBsuSGxe4x8n4hVd6XNry0VbqIFuaoxAaYGmolE0uSsKT2tUw47mL2YMVPhdzoaM4+NVYkB1dl1eRb69mH2X0P+tOtrabwsJzdKMVN3WODootEJaYPNMB7GS6gD0kYpfv+fnv2UeEW+15zXepXRRdHiz+eU9eR9yW4m/KyBDvBK56IZWkExMMR3BRPyvvUU3BAKCQsgY/hi44YdR5J4VaiTJLmPjfLRPhvnFKnirwOel3iOBgTVVshMX6Ti/s4JFBqcGcP2HQXYRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wVkphd21ENVtWsNYeVVgVUbFeR91ASK26PDzuyvoD+4=;
 b=o9E5fNOgtcgHkOCXAXyy1s8Ivk4VnPpgJwDEG9cycD0rPDNbKd/Amdg9FnLeD4SZJQ5EsAyDBC2KrZqcfq4nKvVh/ByzPA57YoA0ZIRhiZk6IyBVJYCy0s7Qt7aXPsO069Tn7dNMiv2BSPHjxFCV6qwX1S+ZQEw6BxRY8yVN0mg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 27 Sep 2022 17:53:08 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/NUMA: correct memnode_shift calculation for single
 node system
Message-ID: <YzMcZHa55QPqepiv@MacBook-Air-de-Roger.local>
References: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87c5e6be-5ad8-fe2f-d729-4f9904a4a027@suse.com>
X-ClientProxiedBy: LO4P123CA0173.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::16) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6516:EE_
X-MS-Office365-Filtering-Correlation-Id: b68c1521-5a55-4bf8-fc32-08daa0a061dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HHOLuuf8o0wSEMbNyJo/iHxbOgRtZzTTYnFU+aODaO82A73jy7oXsADealBkdhwbxrumEM4Vty5aDTfu8BSwm5AAAJdmvYgCKBNY7hdYscva+9ctCMkEhioFqe+tejfJHgaFHtmMYy+8DufJRhL518L9ouikvX9FVaLcbJLBE/t8A5Ju/x3Ij0rxraz8wXSpHLHCftOm6JQMg5OQ2sgkH/is8b+/8TRElnzB4PWGLwDBlydDC7xTEXDHzOEC6QUh1iPtIiNbe79p6wugGwZ3pQdZaEeDnbXckz1e/5PCaOpoYykpct8Ypx0Wz6N7D9K2QjdqVer/HmCd6HZ+apSry07oQmluyrZ6mEDOkYB/GIVYPb1t8xsusZZCOvDQLhxrtk2CLv/JxpPHFpEaYmR55l+DHO8BnLmwq9cj5XYs8ynmRPuBiw6mkSoS1XUonu1Z/75L13klVEBdoX5Btmp2xZMYbGWTY4NhADFoFBnVejH+8F5B/b7iscyspop2YytWmum9mgR6qAMS7HKP4cXiCSQTCdsvHzTwq6T1OVtGRCVBH5uJ12yGU7O567ldwjF24rBYqezpCZ5KzHAYumjyw5BrFgxbZsabqcxjdXW/ohu48cOeZKYK/IgZGqZboCxIYwvsA9pzVxnvhuUNlGD4D8vRu1b9yL+J4gG76Vpv3HLW/B/04OvrA4Q58bYtvgCH2EvKjX46LFMrfsh6d9pMlQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199015)(38100700002)(41300700001)(6666004)(8676002)(66946007)(66556008)(66476007)(26005)(186003)(4326008)(2906002)(83380400001)(8936002)(6506007)(85182001)(9686003)(6512007)(5660300002)(86362001)(6486002)(54906003)(316002)(478600001)(82960400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0dtdlZnbDlzdFZFWjI0R0FiQWJWNWgzakZZVThmNGIwR1FtdWRvZ1lrYkc4?=
 =?utf-8?B?VVZVR3o5Zmx2K0I3cXJaa0hMdEM3VVphdlJQcS9lSUhFQzYyUVRzM3dRZUYz?=
 =?utf-8?B?MlFXWDFLT283TGgzOTViWVVKRnhLL3RSMy9aMGFuRGhJcC9Nd3liZEpiVllE?=
 =?utf-8?B?dXpxVmxsV2gzRmtzWG9PRVk1MjNDYlBjM3NadnJMcE92S1luM0V0c05JZkxt?=
 =?utf-8?B?M044TjNUUG1MMVR2YzdnYTVtMjYraklpWCtlbzdtelpvWjlKVnMzYlpoL0xt?=
 =?utf-8?B?VExjTW8wODl6Ym82T1VnZEp6S1JpUUlZSUxqUEtWWHZqZDZTdmpEQ1ZzRWVP?=
 =?utf-8?B?RlpVckJBamxEMzdjVGhpQ0VyekxTU1MrQjFQWFF5Q0gxSzRibmlkdEp4ei9D?=
 =?utf-8?B?ZkZFOFBZSXBFM3p0b3hWN1RhOGNJWnZwMVMwdEVGWTArdndNcWl2L2FER2pz?=
 =?utf-8?B?bEZXa3pYZ2RmOHM5c25QZnF2OWhXTWtqQjg2SFBiMXA4VXo0aDVLdkhZU1Aw?=
 =?utf-8?B?YWNWODlmM0lVdUVBa05jOVMzR2c0d0QwUHdzZzRxVGREcVR6Zlc2WDdPZ1Jh?=
 =?utf-8?B?bkRLdW5WVTVHM3psOXJzR0N0SDVLOTdGaFc5UXRML1NEU01vMVNrb0ZRRTl2?=
 =?utf-8?B?dmdsSFlHT2VpbWRqSUVibTRTVlQyZ0pzMG1TM0NRYks0YnYzSmZXMWI4SDQv?=
 =?utf-8?B?WllMUTlPaGg4ZTN4S1hJU0gvUVFDajMvWTRaNStQWlhmSGVDZXd0N3RPUlYy?=
 =?utf-8?B?c254eHM4L3ZoRENaaVNKd01SM0lodW90Uk5rWG53WHgyTkN1RUtXV25XeGYy?=
 =?utf-8?B?MjhnVXcxMm5vdTZ1Z3M1VTRhZXN0NUNUL1F0VWt2OWFTZ3FvMTk3Vjg1SzF6?=
 =?utf-8?B?bU5TazgybU1IVnU3TFphZ1ViSWlpMlVDQlBXMEZPRkR3MWViYUFpUytzcm1z?=
 =?utf-8?B?Z1IvakdkRlp0cUhIZytNZFFSV0Q3U3RXQlAwMmFRaWE0ZHhQa3ROeGVkSFNl?=
 =?utf-8?B?bEMvNWdRMlNPcUo1MTJnU25JZVZRVlFwUlVrUjBTUCtSTlVxQ2RYaUhhSS9Q?=
 =?utf-8?B?cXZacyt4MnJzNUltWEt4UjQrYWhYUnc5ZW1XL1lkRHN1aWFTWHczaVhVWFE2?=
 =?utf-8?B?TXNkNWdwK3RnbEVxRE9iTjNYMmFTVmc0UnZJU25KbVdaREpuZXJZWTVITUl4?=
 =?utf-8?B?SUpPb2czMjZRcG91WmRjRVJPdk5iZmVLSjdqZmMzQ245eGNXNGwwSFdZVElD?=
 =?utf-8?B?S0gyNmw2NW5DM2p6aE9peGQxa0YwVFBENStCNm9qTm1Bc3F0NnEvZzlYZ3Fj?=
 =?utf-8?B?RFNtR1JJWUZvVlZ6VjBZak1LUVZkclRYY05wSzFRUFdhTC91QS9rSGtIQktn?=
 =?utf-8?B?MXlQMFAwU2pVYWZVaWZkdnVDTWhhT2s0eGIxZ2ltWjkrZ2RQNGhyOHY1cEh3?=
 =?utf-8?B?UlhFZ2dXV3FLeDcxTjErbVp3UUJpZ1VWb1dQWE56TXUrWXFzWDVWV20yMXd4?=
 =?utf-8?B?WHp6ZzdROHpRUGhwcm1sY0k2TkpPY2tNdG9zcXlZbDNZNDlZOE5rUGcvNmh6?=
 =?utf-8?B?emtYWXNBQW1JcWR3MUNvQi9PczJZWVFXKy9zWWlsSHVFcnhTV1lpeGlVN2xl?=
 =?utf-8?B?aTVqZWN2ZkhhWU52dzhOczIvZ0FNZ05WN2crZlRnbkpDck1ZaVYvYnZ2VUdL?=
 =?utf-8?B?dGttZTFxbXh2RWJVazArS3J1bkJKUEJHVmppYzJaenhiQUdYWlpZaGIrcUdF?=
 =?utf-8?B?V1lUb3J4MUt6R3cvYnV5NDVvWkJSWFEybEtQYVd4bFRadk1YeTVBV1VqNFph?=
 =?utf-8?B?RzkwaDJCeGMrQzBxNm1xT0xQSVR0RE1kMnVhQ3Q3dXhFUmx2OEc4ZytEQWlo?=
 =?utf-8?B?b2RWWlBFbDRLaVlPUmlac0d0WWJVNFNRWmE5V3p6R2E2VHMvdDRZbnNwcWRM?=
 =?utf-8?B?VWY2dVhHcUVFelc2SFRxc2NXVUFjS3piVXoxSkFvTkJPVzZKM2xYRzJqVmFQ?=
 =?utf-8?B?dnE2YjlmYk5CTzFtUFQ2TkU0cTY2MUdoaEM3ZDk3b0hHSUFWQStyRXdzSnZO?=
 =?utf-8?B?eklodjM4Z1pIcWM3ckJ2YkdOVS9hU3lnSzl4dUVSaVh0MU1PZGREV050azc4?=
 =?utf-8?B?dWw2K3YvbElsbHBod2FhS0w4cXJYaUpUcTdsYkhEcE1rTEhzZi9yWWcyTi95?=
 =?utf-8?B?cGc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b68c1521-5a55-4bf8-fc32-08daa0a061dc
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 15:53:14.8132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe6rSwS1VTj4EvjY/GdO5J+MZkjTJgrsyH1jtWc2HLJLbfo7+ODrAQple2s7DslyP9Vmt6F7odpDQcb3akVfBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6516

On Tue, Sep 27, 2022 at 04:15:19PM +0200, Jan Beulich wrote:
> SRAT may describe even a single node system (including such with
> multiple nodes, but only one having any memory) using multiple ranges.
> Hence simply counting the number of ranges (note that function
> parameters are mis-named) is not an indication of the number of nodes in
> use. Since we only care about knowing whether we're on a single node
> system, accounting for this is easy: Increment the local variable only
> when adjacent ranges are for different nodes. That way the count may
> still end up larger than the number of nodes in use, but it won't be
> larger than 1 when only a single node has any memory.
> 
> To compensate populate_memnodemap() now needs to be prepared to find
> the correct node ID already in place for a range. (This could of course
> also happen when there's more than one node with memory, while at least
> one node has multiple adjacent ranges, provided extract_lsb_from_nodes()
> would also know to recognize this case.)
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> On my Skylake system this changes memnodemapsize from 17 to 1 (and the
> shift from 20 to 63).
> 
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -78,7 +78,8 @@ static int __init populate_memnodemap(co
>          if ( (epdx >> shift) >= memnodemapsize )
>              return 0;
>          do {
> -            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
> +            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE &&
> +                 (!nodeids || memnodemap[spdx >> shift] != nodeids[i]) )
>                  return -1;
>  
>              if ( !nodeids )
> @@ -114,7 +115,7 @@ static int __init allocate_cachealigned_
>   * maximum possible shift.
>   */
>  static int __init extract_lsb_from_nodes(const struct node *nodes,
> -                                         int numnodes)
> +                                         int numnodes, const nodeid_t *nodeids)
>  {
>      int i, nodes_used = 0;
>      unsigned long spdx, epdx;
> @@ -127,7 +128,7 @@ static int __init extract_lsb_from_nodes
>          if ( spdx >= epdx )
>              continue;
>          bitfield |= spdx;
> -        nodes_used++;
> +        nodes_used += i == 0 || !nodeids || nodeids[i - 1] != nodeids[i];

I think I would also prefer the `if ( ... ) nodes_used++;` form, as
it's clearer.

Thanks, Roger.

