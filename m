Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B3B50DEC7
	for <lists+xen-devel@lfdr.de>; Mon, 25 Apr 2022 13:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312788.530156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwto-0003Rg-Db; Mon, 25 Apr 2022 11:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312788.530156; Mon, 25 Apr 2022 11:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1niwto-0003Of-Ab; Mon, 25 Apr 2022 11:29:00 +0000
Received: by outflank-mailman (input) for mailman id 312788;
 Mon, 25 Apr 2022 11:28:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2itc=VD=citrix.com=prvs=107928106=roger.pau@srs-se1.protection.inumbo.net>)
 id 1niwtm-0003OZ-Nj
 for xen-devel@lists.xenproject.org; Mon, 25 Apr 2022 11:28:58 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3603a5d-c48a-11ec-a405-831a346695d4;
 Mon, 25 Apr 2022 13:28:56 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Apr 2022 07:28:34 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5529.namprd03.prod.outlook.com (2603:10b6:806:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 11:28:31 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 11:28:31 +0000
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
X-Inumbo-ID: e3603a5d-c48a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650886135;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8phw4lfF/6CYGGmkNHKbuvG787rzTs4/XXOs+gyVdMU=;
  b=RMIzv59xEh6nx2LuB/H59lSYidshhf5LMSsNUjXY4kq6KYawvUFEQzcE
   6dNY3ETWCUSsYXkJTWyrYwhe1ccXVrb3kFOPWg30ZOSVb+LWu5HyedWrd
   9OKEk+hEun0CPVuYlEZNeOUWGBTmc8Wz/xVldvFMPFKA26bZJAW4nMeu0
   8=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 72289615
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:csQfXqhWOGmqJMQo+XOoJk04X161FBEKZh0ujC45NGQN5FlHY01je
 htvWGiDO/rYZ2b0f9AnOoS09BxT7ZXRztRhHAFpqSszEn4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhX1nQ4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YV47MrWXvOIyaiJjEGIhYZdi5Jb/E2fq5KR/z2WeG5ft69NHKRhueKc+paNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuocehW9r7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wjP9ftpujW7IApZ2aP3K4bWYd2zRMRogmOU+
 Eue80bSO0RPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQpgyfWW4NS2cZbMR87ZdtAzs3y
 lWOgtXlQyR1t6GYQm6c8bHSqi6uPS8SLikJYipsoRY53uQPabob1nrnJuuP2obl5jEpMVkcG
 wy3kRU=
IronPort-HdrOrdr: A9a23:+q+nIavxxc0FNju5Ps94hf477skC5IMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVfUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZozU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDm1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9UfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWz2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 gjMCjl3ocWTbqmVQGYgoE2q+bcHUjbXy32D3Tqg/blnQS/xxtCvgklLM92pAZ0yHtycegA2w
 3+CNUYqFh/dL5pUUtDPpZwfSKWMB27ffueChPlHbzYfJt3SE7lmtrQ3Igfwt2MVdgh8KYS8a
 6xIm+w81RCMX7TNQ==
X-IronPort-AV: E=Sophos;i="5.90,288,1643691600"; 
   d="scan'208";a="72289615"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/2hHNW3e/AbG9yN47A9+gocn8D77l2vvvgFSeo5K+rvzfyct4CZwtsrg9vf8jmMyTlXyFXQ9Y6JEl4o1AqsHwBA39TCDfJiG85fyoMZXYb3b8v5VqUi8z6k379yfWLWI1zoNVNnJnl3VafyJwiw88HCpehM0j8F5rZSXwJVBmtrR6cnA2WXAZoX763zsfb2BeLJDuQ5uroeHektYfV2Q3FRPwiJqGp2byRKASWvFuON0VXOKmMWjK/8zM7aqpsW82E9wfPrZYQWrHUZUN7pUHVW6hucwKR5pFr59VGN/ZoxcWNwBBD/QQgsGfGaFubB8fVtse+Bpi9w6X9l3AlYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwruwajnMoFdvrD6u6SQgKnwpS62pvj4c64NXFPwQ2g=;
 b=etsI5rIzch75ejheiVR/pVchDz87VAvpHfY52Zo4dZWQWuoHGwI7lxVWXX7mTAm4vvuHZl8bpFCWIJ3nWb+e/OPoZKvqbpvowO5g7KTIgyNQBnTd+KCQ+mPN+LhcIXxeSTDM+CrxZGxoGS4Y18wiujFnYF4bX2KdP/O0bWYeKwmBLb+bngYWyQSS+wg0XciVTmuh1x4pjsZW111CuAoNMlJIvEvVjqYEeufybHrwcOOXuUY/3nuGRHylg8zNE1xDrpJctANjICOIfW1FRJLSkQOq8UwL6+uLaCHAviJVSKWCHI5wSiNlqLLM4v6UzvBHXN2q86DgXCGFAz3NHbNiwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwruwajnMoFdvrD6u6SQgKnwpS62pvj4c64NXFPwQ2g=;
 b=Bh6w5iYhRWQtTpwP0GhIagfvABGOImdLsnMTz36OTjg55BGfY8cioY9dcpKP/dD9w2FLA3dPJKZKqRtwERaUl1gkHy1teqA9CgCI2erxCWi4ROGNn8c9hXeRZENPF+jnj3FBGpurVR+wLewBHN2yMZLMvNtyWutLGNOMUY9gFnE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 25 Apr 2022 13:28:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Message-ID: <YmaF2tCNzTj0Gd2H@Air-de-Roger>
References: <20220331092717.9023-1-roger.pau@citrix.com>
 <9f510109-df45-af7d-1c0a-49ef435e371f@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f510109-df45-af7d-1c0a-49ef435e371f@citrix.com>
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 203d60f2-71c9-4cc2-7e3c-08da26aeb9ff
X-MS-TrafficTypeDiagnostic: SA0PR03MB5529:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB552928784945535CFDAB7AC48FF89@SA0PR03MB5529.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eLQbXIS6LJqoJS6+7Ir0ZICidjz8WdLHmgc6Do7zoLdGxOi/SsA7kZhS1Yx55AHDNvEmuCFwNVlF3zAgTh6wwqaHB66EPIqb+4XOIcIRCXrn5xtKok0VrWCPNNqG3wNIn7dtXLvnkcjvkhRxM+gab1CCGFtfI9P2gK9+UeFI0iQd7LP3HBXirz7liJoTSPzFoDyX/hX1LAUn9Mr0YpC/Avg4AkiCTbPILpeaVpCntF0ME7IORhy7R2I5bmrmAeD6PN4FcMmsAPwK/j7Xy5Bw4ntC1u08/HV7Kc4ovT72WzA7zCRMXzgi1oMlDKTeEoAM5p4hKv48KLCnB/fCPWaKQdxRrDa4SBqK2gFXw2Nl/ApZgEiwJMk+XlrBLeufhW06HAKiwXYOgt3EBs4xMkln/kP1c+DA9VtlcQWbgOBRmbcRXrVVnNfKQm//6ZmKZWA/8Fn/kNqVMPTQ2lIGvCqp2yMF4ig+j9MFFxkrCTL/y6GBQXRXFQnKuY4y4VCXfeQpvrhS4dS8jtBeH+VpCelWDfe96AXeMlgZDjL9IADl8FurJ5ADrX15bL0TIkIzXYIzGaBhyXto1Ot7DzukesjvjCMKBnhEGUjGgrielXC+L5l/S9CUKXKHa+rSM53aBSPC1eEpEdFLoIQewjtZwJ6pRg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6636002)(186003)(316002)(66556008)(54906003)(66476007)(33716001)(6506007)(6512007)(6666004)(85182001)(9686003)(26005)(53546011)(5660300002)(66946007)(8676002)(83380400001)(6862004)(4326008)(8936002)(2906002)(508600001)(38100700002)(86362001)(82960400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUs5RzRlTEc2M3MrSHVoZmRkOUFKZmtXcHNjMlA2OWRWZmtSNWo0cFFhS3ZF?=
 =?utf-8?B?MUF2K3NyNktCRVA3UlJuYS9YZVNJdDRmY2prQW5pV3ZaeW5TN1lDOEtrZ1pH?=
 =?utf-8?B?bVdMZmJVc1RaSWQ0ajBxTWRJRzhmTGlLNnZiYlg1RTlGYW8wWDJSTXFEYllx?=
 =?utf-8?B?SjdiVFVQSmgxU2VCd2djV2FUdHdNbDRiUytabzBndmpDMmVFMDFhSjkrUk9E?=
 =?utf-8?B?TFVrUWR2RlRjSWpmaGQ3RytTTDlVNGlJUHNZY1dmYWIzb0c2Z21GTFA1elhi?=
 =?utf-8?B?dnd3ZDBxeW1ETVE2VzBqcFFRVTBjZ3pmMVFDMWFQOEpiLzhYK2hHUDJTNVhM?=
 =?utf-8?B?UmNLWE5ycW9WcTNJd2JDbE0zSU1zSnIzNnFETERIaTE5c0piNFNIUUttdFNP?=
 =?utf-8?B?MFY2MjhsRUVSZFRVM3d6eExFaCtRY3Y1TUZVN0RUNm53QzBqUHJ6MjJldGx2?=
 =?utf-8?B?Y0JZaTY3ZDBIV2VUM2ZDRW9WZTU3dDc2YjJLVXREZ1lMTEJQWjRGS2gwTVMr?=
 =?utf-8?B?ekxMdWtqeUQ2bExiUldyZElGVnVOL2dPU2kxNjU1cFhGVkZBZk43SDVWNURw?=
 =?utf-8?B?ZzFwQWpmUVVuc0dQelk1b29PMkVsakVhNm5ob1E4NVIvMWd4cDZpL0d6MHdG?=
 =?utf-8?B?NDdPV0RNd1dDVnVXbEFKUUlWYWFTVzBOUytwcENnVDRjRzRaWURWRE5Sa1pH?=
 =?utf-8?B?NFlSKzJVNzZvRWFBTU5VMjlDNmVFdzMrQW15YTRoajVaMHhBemErMWt6QU8x?=
 =?utf-8?B?YllrWkNLWnpycEVDMTFTeU9VODRUZWVhQVlxNUphaHZIZmZQeVlrRTFyVUZR?=
 =?utf-8?B?Y1pyNXk3eUpiRExNSTlEdm9TbUdmSnF6cVVPamU5RFJ3U3MvY1AvbE01dmFy?=
 =?utf-8?B?NGZNMlVZUXhJWEtNS3k3d0JqWGsva0RRaFlObmlkQjdhcVpWZ0hQSEVZeWl1?=
 =?utf-8?B?TlpLYVRKbzErT2dJRFNzRkFKc3hnbDlBeC8rRmhRdXh1R09IMHVlR0dnaG4x?=
 =?utf-8?B?c2c0QlVFNTlScXhJVmdOa3VuUzIrYW9sMXJXbFNuc0pqTC95SzFwQ2ZGb1A2?=
 =?utf-8?B?YTBDSTFXMUJxOHVMUFYzdjQ2ZlVKQnA2eWhRMko5UXROWHdHOVNZSzUydHRC?=
 =?utf-8?B?Q0piMFlCdFh3ci84NERQcGRIaTkvSHNzaFZrSDJFengxbzgzaHI0S3R6SUJs?=
 =?utf-8?B?ZHF2U1ZnUXpLTUhuZzFlODBLMndVb2F3OFhGSzBlZGppNkF1Uk9VSnlmU213?=
 =?utf-8?B?dTRiaDVYaHUybFJnQTlBb2dvWno3YVRTeGNFd2pUSThpbWp5a2xYamU4ckgv?=
 =?utf-8?B?OG5EVGlxUGxscnhrTW04b2RQSXBZbG00V1o4d05JSGVVLzRxWVlpU1ZHRlJZ?=
 =?utf-8?B?YlEvVGRWVVF6UXFLS1h6dTJWaFlHOXhuUGZrZkJHOHByWWRlWEk3RGV3YUpL?=
 =?utf-8?B?Y2F2QmMxaTdsNmdmcHRjem5nUFhKcUdpUTJjYnhHVi9NbFZseGlEdTQyMTRk?=
 =?utf-8?B?ZEF6SkVyQ0VsT2xGRUw5cGd3bFVBVHh1cEdKcmhnSnlaWUNtTXVISE1xaUp2?=
 =?utf-8?B?RmwycVNlc1hYSnJIYlFvTkgyOG9GSWFEU2xicXNmMlpTRTBheTRqRU1qK2Ft?=
 =?utf-8?B?TXR1NDc3S1JpcXkrTlhobnBKMzdSVjFyenNmSkYyL3NDQVZ3MTVIRytoUmcy?=
 =?utf-8?B?dGk1MEV0WGFBM1R0TTR1VHFtazNPR08xbzhsOGpsZ1VhRURiaUFoODVZZmVH?=
 =?utf-8?B?SlRndzRqdTlleFlaUDZuelMyZk9HVkRVYVh2MTkxWmVmUmNpWmRmSzJsNnlM?=
 =?utf-8?B?REY2SmsxTzdFaGJpVXUxYlNhNU5WR1FlZm5yVHlPb3pIR2V4Wlp1bHd3SzVT?=
 =?utf-8?B?NlhyaE82TTloK00wcmdvc0EySFlHaXo5UngxTDdaMFNOR1BLL3p3aEhrSkc3?=
 =?utf-8?B?RFJhUHgwRW45UTFEREdYdktUYWpNK3ZGY1E4UGJ1OUhPc0J1SlNFS1JCZkhx?=
 =?utf-8?B?U0x4eDN6VG56ZWhJdndHVkhhVDUrd3RPM0FmLzF3bVZLQnMyQWRTanJ2bEpr?=
 =?utf-8?B?L0hTUExrN2RWK1N6R3FFSTFlbjhPaE5CK2NUcGdiVGhtWFpPc3dGRkEyL0Qx?=
 =?utf-8?B?ZXpqLzlxanhJSkNMUWNMd000UjJkUS9HR2NuRVhJTVFTYmJyQjM5alV5YzZY?=
 =?utf-8?B?aTdyRUdieTVpeGJSdmd4MHRQZFhIbHBldjBLYmxRNStQVjFMQ3h3ck9JR1o0?=
 =?utf-8?B?dzFhUWRHd084L2VaRDFVZWEzRXBHL0k0eFFhR0UrMjh5cGY0STRtVGlLQUNW?=
 =?utf-8?B?UnlFSkNpTExOdkNpWU5KTmhvQzJxQTZlWEh3d1psYmRBTXEzUXFNZmV5T3Vo?=
 =?utf-8?Q?7WkTPoX+5OPXmiGQ=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 203d60f2-71c9-4cc2-7e3c-08da26aeb9ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 11:28:31.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cStnQfNbkBx/PdMTfOnMvUSx1GynVe7suhNCbuMxOfltess+QYn2FuH6dprY3A3lSSQ+BhNOyyfRxmtgofv0tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5529

On Fri, Apr 22, 2022 at 06:49:57PM +0000, Andrew Cooper wrote:
> On 31/03/2022 10:27, Roger Pau Monne wrote:
> > Hello,
> >
> > The following series implements support for MSR_VIRT_SPEC_CTRL
> > (VIRT_SSBD) on different AMD CPU families.
> >
> > Note that the support is added backwards, starting with the newer CPUs
> > that support MSR_SPEC_CTRL and moving to the older ones either using
> > MSR_VIRT_SPEC_CTRL or the SSBD bit in LS_CFG.
> >
> > Xen is still free to use it's own SSBD setting, as the selection is
> > context switched on vm{entry,exit}.
> >
> > On Zen2 and later, SPEC_CTRL.SSBD exists and should be used in
> > preference to VIRT_SPEC_CTRL.SSBD.  However, for migration
> > compatibility, Xen offers VIRT_SSBD to guests (in the max CPUID policy,
> > not default) implemented in terms of SPEC_CTRL.SSBD.
> >
> > On Fam15h thru Zen1, Xen exposes VIRT_SSBD to guests by default to
> > abstract away the model and/or hypervisor specific differences in
> > MSR_LS_CFG/MSR_VIRT_SPEC_CTRL.
> >
> > Note that if the hardware itself does offer VIRT_SSBD (ie: very likely
> > when running virtualized on < Zen2 hardware) and not AMD_SSBD Xen will
> > allow untrapped access to MSR_VIRT_SPEC_CTRL for HVM guests.
> >
> > So the implementation of VIRT_SSBD exposed to HVM guests will use one of
> > the following underlying mechanisms, in the preference order listed
> > below:
> >
> >  * SPEC_CTRL.SSBD. (patch 1)
> >  * VIRT_SPEC_CTRL.SSBD (untrapped). (patch 2).
> >  * Non-architectural way using LS_CFG. (patch 3)
> >
> > This has survived a XenRT basic set of tests on AMD machines.
> 
> Sorry for the mixed feedback, but some is applicable across multiple
> patches.
> 
> First, it is important to know why MSR_VIRT_SPEC_CTRL exists, because
> that informs what is, and is not, sensible to do with it.
> 
> It exists to be a FMS-invariant abstraction of the DE_CFG interface,
> emulated by the hypervisor.  At the time, we experimented with emulating
> MSR_SPEC_CTRL directly, but the results were unusable slow (legacy IBRS
> causing a vmexit on every syscall/interrupt entry&exit) so
> MSR_VIRT_SPEC_CTRL is also an explicit statement that it is an expensive
> operation and shouldn't be used frequently.
> 
> In practice, this means "only for very very important processes, and not
> to be used more frequently than process context switch".  Also, there is
> no hardware which implements MSR_VIRT_SPEC_CTRL, nor will there be.
> 
> Patch 2 has added an extra two vmexits around each vmexit, in an effort

No, it adds just one extra unconditional vmexit, the wrmsr is
conditional to the value in the guest and Xen differing, and it's not
unconditionally executed.

> to let L2 vmexit to L0 rather than L1 for what is likely to be 0 times
> in an L1 timeslice.  It's not a credible optimisation, for something
> which isn't a production usecase.  Yes - nested virt does exist, and is
> useful for dev, but noone runs a fully fat server virt hypervisor at L1
> in production if they care in the slightest about performance.  Either
> way, patch 2 is premature optimisation with a massive complexity cost.

OK, so your recommendation is to trap writes to VIRT_SPEC_CTRL so the
unconditional rdmsr on vmexit is avoided at the cost of taking a
vmexit on all writes to VIRT_SPEC_CTRL, that's indeed fine.

> 
> Furthermore, writes to LS_CFG are also incredibly expensive, even if
> you're not changing any bits.  The AMD recommended algorithm
> specifically avoids rewriting it with the same value as before.

Writes to LS_CFG will only happen if the guest and Xen selection of
SSBD differ, as the guest value is cached.

> Another thing is that Xen shouldn't touch LS_CFG like this if there is
> any hint of a hypervisor on the system.  If there is a hypervisor and it
> doesn't offer VIRT_SPEC_CTRL, trying to play with LS_CFG isn't going to
> make the situation any better.

I would assume that no hypervisor will offer LS_CFG support for
setting SSBD if the guest shouldn't use it, and hence set_legacy_ssbd
will already return false.

> As to the CPUID bit handling, on consideration of the whole series, it
> wants to be "!" only.  ! is there to indicate "something complicated is
> going on with this bit", and life is too short to try and get the
> derivation logic right with both implicit and explicit conditions. 
> Leave it without an s/S (so no auto propagation from the host policy),
> and set it in the max policy for LS_CFG || VIRT_SPEC_CTRL || SPEC_CTRL,
> and set it in the default policy for LS_CFG || VIRT_SPEC_CTRL, which
> will be far clearer to follow.

OK, as both Jan and you agree that using just '!' is fine I can work
with that.

> For `struct ssbd_core`, the name isn't great.  It's more
> ssbd_ls_cfg/state.  Also, each array element wants 64 byte alignment,
> because that's the only way to avoid atomic cacheline pingpong from the
> spinlocks.  Also, the accessors need to be raw, because GIF=0 context is
> weird and working around checklock with irqsave variants is not a clever
> move.  It is not safe to printk()/bug/etc from GIF=0 context, so logic
> needs to be kept to an absolute bare minimum.

Sorry I'm a bit dense today, but I don't seem to be able to find any
raw accessors for our spinlock implementation. _spin_lock_cb will
unconditionally call check_lock and there doesn't seem to be a way to
bypass the checks if lock debugging is enabled.  Am I missing
something?

Thanks, Roger.

