Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F064522D7E
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 09:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.326537.549081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nogvE-0001cG-Fr; Wed, 11 May 2022 07:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 326537.549081; Wed, 11 May 2022 07:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nogvE-0001ZN-Ci; Wed, 11 May 2022 07:38:12 +0000
Received: by outflank-mailman (input) for mailman id 326537;
 Wed, 11 May 2022 07:38:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dmv0=VT=citrix.com=prvs=123c0883c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nogvB-0001ZE-Ja
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 07:38:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4aaf9bb8-d0fd-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 09:38:05 +0200 (CEST)
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2022 03:38:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by CY4PR03MB3176.namprd03.prod.outlook.com (2603:10b6:910:59::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 11 May
 2022 07:37:59 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 07:37:59 +0000
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
X-Inumbo-ID: 4aaf9bb8-d0fd-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652254685;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=0h9/SZozefDWWlzVuD+g2CNW7zGaj6DbUvEcRND6JGo=;
  b=gTucyNYE1KV2CSh8FRYYTLY+Fqx2+L0BJkQVYNzNsrUdrE13jhi3cszy
   /4hVrBuSxx8f60B7xHcJvMhng1APrq41xdKEiaxkc+SKk6hRsa9ik35CC
   m1WukilQGq9U3TF14YWK4tV+EAk0Oc95MPaWial2usNTWQEg51YR6RIiu
   o=;
X-IronPort-RemoteIP: 104.47.55.169
X-IronPort-MID: 71058832
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YDVnjahhomchQ0AL7X4SRGvOX161QBEKZh0ujC45NGQN5FlHY01je
 htvUWHSPa2NZmX9etsibIXlpkoB68SEytM2HVRkq3w0Fn8b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M68wIFqtQw24LhXlrU4
 YqaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSR1N6qSmfYBaRJ7Hyt3LZBrxp/1PXfq5KR/z2WeG5ft69NHKRhseKc+qqNwC2wI8
 uEEIjcQaBzFn/ix3L+wVuhrgIIkMdXvO4Qc/HpnyFk1D95/GcyFH/qMuIIehWlh7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9wvN+PpnuDK7IApZ/b/faoP/Z9K2YO523Ua1h
 U/B53bCDURPXDCY4X/fmp62vcfDkCb6cIMUCryj9/RujUGTx2ocExkfXx2wpvzRol6zXZdTJ
 lIZ/gIqrLMu7wq7Q9/lRRq6rXWY+BkGVLJ4FuQg7QiXx6n84gCHB3MFRDpMdNwnssAtQTUgk
 FSOmrvBAidvt7KfTlqT7LqZpyi+fy8PIgc/iTQsSAIE55zpptE1hxeWFNJ7Svfr35vyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLztJ6s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:qC8hha7tNgeyoa0yGwPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,216,1647316800"; 
   d="scan'208";a="71058832"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J6DPeso0XoNlxxzTVcNZ4IRqPB4zpu+83Ws2+mlqup4wlZFWN5+15PZi9UVHiPshuN4qSnupd5qCmp59ksbFAf3nGWYpzJr0blir2jfhYCnZ8pVagLRTZT20Fh5fmhJb1EE5Wpbv+VvbuRuqtedoZ+MXdK6ux6ZEFBcBW5cnkQrU4W8kXc1W4DUa4pooYpUrZnsMqKtSD8BqUhlZKbkn7XTH5cG9Jpbh7ufaGpfDMCO3j4Dr4IN7m3rIl6x/sToDd90iNqS1D2mxhqtLSapySsy3hZ4BVOMJ4ff17kC8gKPNGUPgKDQ/+vT+tRt8pQJPJP/SfB3NAk5ffsWXtJOnGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mG3BJ2lOouiYMf/wKmYraYk0XNuInJnwvHltPzJZYhc=;
 b=HomKU7ups08ugzIVEU3FYt4gMwBNqC/x64Q/gXCoU/RxB0g+nQbECzvq4Xfcccul3Mj3uNWk6VwWjYcCVRhmzc/ta0KBqoxoPJczRD7Y8Ba9BCSGJV39TZs0K8SvgtzLZA+3JxReGzxHN3HqWAiqG2tlwUTqw0wQcwP0Gf0QVNOokVKI9LvBcJlP6Ij/cL4GRYCOtyP2fxDu9/7IpV+cm855V5yu6UfpdIYjic/GH92+X+bTwb7bGbLpDvmmxQksSjEeO3nw76wCKzULWa4WQd7bM7c8NVuLCEH2Yr6wxlv82p9Q8FNP/uREDUpFLHje3+OkCtRkjfP4m2YHrP6cpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mG3BJ2lOouiYMf/wKmYraYk0XNuInJnwvHltPzJZYhc=;
 b=tGVOVSCTq88WC9Yk5VtNALNXpr24AQ8gYJzDhDFe3Wa/ACN5im0VUgkeDFzerJYSzybKtXAjfLH+tlJvb/DC7JYfzZ4UuWTJT2+aZTeeLj5MSLFButPduF3h/MuvX8vYUwroAOBaSI3Q0YjFuy7q8M+5PVxfTJBNPaQUedxBISQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 11 May 2022 09:37:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Mariusz Zaborski <oshogbo@freebsd.org>
Subject: Re: Proposal: use disk sequence numbers to avoid races in blkback
Message-ID: <Yntn0iyB7uAOkcxC@Air-de-Roger>
References: <Yf8h36wj5QWSWEud@itl-email>
 <YgaNeZNSt26oCzbZ@itl-email>
 <YkOgDihJCrtWriDq@itl-email>
 <YnRtFBzfba0OYldx@itl-email>
 <YnpFLJwxBSqbshw/@Air-de-Roger>
 <YnqRX2s87cd6jiJf@itl-email>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnqRX2s87cd6jiJf@itl-email>
X-ClientProxiedBy: LO2P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa0679f5-0644-4eea-eb85-08da33212bcc
X-MS-TrafficTypeDiagnostic: CY4PR03MB3176:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR03MB3176C2884643EE251D916E598FC89@CY4PR03MB3176.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zVfSGN5FYQlV7gDmKmVdhWHMczoMJkmoTV10tAAx5cWNfeqrmeFNcyi0du8DU+rEw7CsbxOemS82UiB50xn23YfruHToJWcqv8+cKTjtzfJTPOhwVlcvWayfKDctvqgAeLGgCPQ6DMk0ys9mAE7Cg18bFhjly8luwp5YPEOM40vPVOsa5tURlxo4PQtZUx8obL7pY4V9WclXMFPiO4CqwnoE3bElyc2TdF9HAoKUBFQOj+83KT8Vh6Zjky6Px+nSDO+I7zWvQQKVtBja63zS36Uyx6QwWDSCwY1+sptmdRjhDpKbu+CSbBi8UEzZe7Itvz8LNQxM10u+PcrOQhJzGpY/vB40fxDTBdfntKe5PAMGKalXhzT91KWZz7hr8r4wumcyiL+pFj/9FD9nVWHIiDQRHZuvpk2ib8uxuykhWNv/rM9x5oXkosoxNqBfkMwGHls1Ma0FiyavA7FSpm5dwIOAjIPDdka6SJKzSoRgMtr4NmpJPKPgrrzqtVMkzFrfvrw2Nsekugn2hVxheQqDL+GIOeO9UbU7qJJJCNNfN/IkfsOzeqKV6aMCpWSO2bBHCXgzKVwHsw1/GXA2P1qXfSePc7adDOVo2rIul3RjXGfYzA6NlNocD3nlQUtxDlrDkj6SznYQ1j5aJJfsSahjgQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(38100700002)(316002)(6486002)(508600001)(86362001)(2906002)(82960400001)(186003)(8936002)(33716001)(6666004)(66556008)(4326008)(66946007)(6512007)(9686003)(26005)(6506007)(8676002)(66476007)(83380400001)(5660300002)(85182001)(6916009)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZKc1JxQUJHUEdtZUI1S1pZd01tK3dYTzFhVHhRL0tOeXlPcVdiZy9GVWUw?=
 =?utf-8?B?Nllib25Ea1NGckRtZTFFYStIWExLMDIzWEpwbjdZanBJSGgydjNrMzNxa0lG?=
 =?utf-8?B?YWVmbzExVUUwK010MGNRcmxVM3VxRTNmbGM3TmJWOUhEektiVFJVYmF3TVV4?=
 =?utf-8?B?SWF1MUZsdi9pRm1tWmlkbWpOZzJiWHZkMENHdVBvVU9xR3o4YkM0OHlLUlBt?=
 =?utf-8?B?blZDSm40WVdUNVBxN3lWWUU3bkJQQVZ0aWdYc09yV3dTR2piajMyUnBGZ21F?=
 =?utf-8?B?ajI4cEJCV0g3QWNXNndCR3RRcUlyWVhtWnRzYk5SOTQxQklOdjZCQ1ZVcEM1?=
 =?utf-8?B?TWMvWERDZmlLMkRndjZjeGZpcW1rcnZFbGcxT0VSb0FqdlRMaVprWFh6WVNM?=
 =?utf-8?B?YXg1K3lsazAxMDllcmFhWllhTU8zVy9Pc1VnRUI0SG9EWEtZcFNWbyt0SWx6?=
 =?utf-8?B?bm1ESDFPMmZWZEZQdmxVb3BuYUlmSEhOVlk0LzNNSzI4NFlnN0tDdHIrLzJH?=
 =?utf-8?B?c0VLS3dQNVJLVU1JVXJBaXhWcWpkUVFRbEdMMVpXbU9CUzBsWTlUV2dRMTFR?=
 =?utf-8?B?VFZXNVR0bnB1bDUzSXZtOVJiaDlzZVp1NVJoVU9NZzV1K2tKd3hJQ1pjYVpD?=
 =?utf-8?B?MjJLL01obThVWWR6bXZFbmxLbVI1MDZkcnpsR1E2WmRPcndHRllPbklCdDhy?=
 =?utf-8?B?RXBVdzllUWxhTHNzSWxadVdJRC96SXVmQ1RUQXpvQ1l1Lzg0dDd2R21LRmtl?=
 =?utf-8?B?VzdIS21xK3hORDl3dTloUjAreXhEd1pjcVdENkJJbXkvOEh4eE1ESXVvWXB1?=
 =?utf-8?B?ai8vUm9wZkl1cGVqU2hSVmY4SVJZMWJYVFBML3hWQW10aGk4dlZrN0w0TWVN?=
 =?utf-8?B?SU9ZWVpjTG5aZjFNOGxUNFY1eVJEczRtMUpLdkJHd2pIa2tscFg0UUlZRFRL?=
 =?utf-8?B?c0JnWVY3c01pdG5MTUpieFd4MHd2cENuaUtXckpEMDlsS2dpcXdSTDhOM1VP?=
 =?utf-8?B?UnFoUnR5dytzR2g1MWtGSy9iWVZGd1hiVjhidFE0M3RMcEpYMUJjRHVST0Jy?=
 =?utf-8?B?L0pTS2VzcU9DTnF1ODFHVkxKRkRmL0RzdWFhZWMzWTRuUWpDNU5Kdk44UUI3?=
 =?utf-8?B?cUt1bU54eDBiVUF6QjkzbUtZNzdRdUlVMVN4Smhxc25pMkNRTzR5dVJQVWM0?=
 =?utf-8?B?MFR6WmpZcmM1dElEamRiYlFHeXYvUk5FcW9TbE1ONzNqMThST0wyQXZLU0V2?=
 =?utf-8?B?M2RYcDFSQXp5aS9hRTc1WUNXcG1GSVpQVlZYZk9iU0ptLzcyTW9NbWhJMk8r?=
 =?utf-8?B?QUR6K2F1blRHaW9Lb3kxc2Q0SVdxSGpLdVRmeU4zM0JVZlp4Qk1aNjJsdEhV?=
 =?utf-8?B?RFlHUzUvaHJMaFpEQTZBN1k0a3V5TkZGU1dkRW5WQXRiakJCeG0vOHM2Q3Ja?=
 =?utf-8?B?YjZGSnBtMWFZVEVwSXlXNnYvVmp2UkVsRnYwbkQxWXR4OEppcXY2MmIwNDFl?=
 =?utf-8?B?UERkWUJYRzRlc2FCY1dQM3lKRHprdGVFTmpVOSt6NUUzSGx6VXVPSzM5bjZL?=
 =?utf-8?B?RWdremR0ZE5zcjFrbCtWbGd4RkMxZjc0cmVmTHU5YTZ0Z2grNlZnMksyZkJ0?=
 =?utf-8?B?QkJyRU1wc0IzWXZtUE5rTCs1aW5ZUkJmaTk4Q0NyN281OWJvWTluTFNWS0lO?=
 =?utf-8?B?cXduVGhGMDJXZXhoS1FKcnJhNmU3RGd5RzJwNUNCemRaZDAvWHFiZHFlc2M1?=
 =?utf-8?B?MWNsMjVyKzIxb0M5ZlpCMUIvckJKa0tORDJ5R3c1WmtleE5ZRTFQbVRWS1Y1?=
 =?utf-8?B?VXlSU1VVOGc5MTBJd0tZRE03QzZ3b0FMUEk1cjBFQkpMN25jMDlQREg3WXZ6?=
 =?utf-8?B?Z25acDk3WDNkWmZOaFVielZEZ3lEZ0U1akpXSkpxdWlUNkNMSjdVUFhxbThZ?=
 =?utf-8?B?b1NiRU5pU2RweWxEYjRQR09td2RFalRpK3doeUtzMHB2THZVRVhJNWpmNEsz?=
 =?utf-8?B?TWNmeVErNFRhN2pUS0ZBNU1NWUw5bjF1KzdjSmhRdnJaOEh3KzRIdnF5RFVF?=
 =?utf-8?B?cVRnTGtxQ0hQRWszaklqcFRzTUVlekxiVXUvbGFadkRwZzJ5VkIreFUxb1ZX?=
 =?utf-8?B?OTNiai8vUU51T0YvVlA4NUlqakFRdk9HWlZzWFhEb1p1NVJNSVhmVXhVclo2?=
 =?utf-8?B?czM5ZEpuWHBleC9pc2U4RlJrRjJKa3BEZnFnWWVkQkxnSzg1MlYrS2JaNFVW?=
 =?utf-8?B?ZWRCQTNscFNKdG45Y0pFckpwb0ErWkRFRnlJaVBPRzhLbWd5YnRXZDRZbTVx?=
 =?utf-8?B?QnBsUkxreTJYcUg5eUdYbW4vSlJ6T2hmakZwOGtqZFdkMmVJaUlQQ2RSR25l?=
 =?utf-8?Q?SVVg4Pntr0uB/87M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0679f5-0644-4eea-eb85-08da33212bcc
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 07:37:59.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZy857xGMMhUBRvy4sQY+OxC17ErBiTPhtZb66mMBqOJX6DKaSbfsMtr9ItaYJLWYfavnYnoHbj0kQdqwLxKBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3176

On Tue, May 10, 2022 at 12:22:51PM -0400, Demi Marie Obenour wrote:
> On Tue, May 10, 2022 at 12:57:48PM +0200, Roger Pau Monné wrote:
> > On Thu, May 05, 2022 at 08:30:17PM -0400, Demi Marie Obenour wrote:
> > > Proposal: Check disk sequence numbers in blkback
> > > ================================================
> > > 
> > > Currently, adding block devices to a domain is racy.  libxl writes the
> > > major and minor number of the device to XenStore, but it does not keep
> > > the block device open until blkback has opened it.  This creates a race
> > > condition, as it is possible for the device to be destroyed and another
> > > device allocated with the same major and minor numbers.  Loop devices
> > > are the most obvious example, since /dev/loop0 can be reused again and
> > > again, but the same problem can also happen with device-mapper devices.
> > > If the major and minor numbers are reused before blkback has attached to
> > > the device, blkback will pass the wrong device to the domain, with
> > > obvious security consequences.
> > > 
> > > Other programs on Linux have the same problem, and a solution was
> > > committed upstream in the form of disk sequence numbers.  A disk
> > > sequence number, or diskseq, is a 64-bit unsigned monotonically
> > > increasing counter.  The combination of a major and minor number and a
> > > disk sequence number uniquely identifies a block device for the entire
> > > uptime of the system.
> > 
> > Seems fine to me, this is just an extra check to make sure the block
> > device opened by blkback is the one that user space intended.  I would
> > see diskseq as a kind of checksum.
> 
> Ideally, diskseq would be the primary means of identifying a device, but
> that isn’t an option without more substantial changes, sadly.
> 
> > > I propose that blkback check for an unsigned 64-bit hexadecimal XenStore
> > > entry named “diskseq”.  If the entry exists, blkback checks that the
> > > number stored there matches the disk sequence number of the device.  If
> > > it does not exist, the check is skipped.  If reading the entry fails for
> > > any other reason, the entry is malformed, or if the sequence number is
> > > wrong, blkback refuses to export the device.
> > > 
> > > The toolstack changes are more involved for two reasons:
> > > 
> > > 1. To ensure that loop devices are not leaked if the toolstack crashes,
> > >    they must be created with the delete-on-close flag set.  This
> > >    requires that the toolstack hold the device open until blkback has
> > >    acquired a handle to it.
> > 
> > Does this work with loop devices?  I would expect that you need to
> > issue a losetup call to detach the device.
> 
> That is what the autoclear flag is for.  It will cause the device to be
> destroyed by the kernel as soon as the last handle to it has been
> closed.  This is why the toolstack needs to hold a file descriptor to
> the device.

What would happen if the backend closes the device (because the
connection is torn down) and then try to open it again (because the
guest has triggered a reconnection)?

> > Even more, the loop device is created by the block script, but there's
> > also a window between the block script execution and the toolstack
> > knowing about the device, which could also allow for a leak?
> 
> For this to work, either the toolstack or block script will need to open
> the file and perform loop(4) ioctls to assign the file descriptor to a
> loop device.  This cannot be done by a shell script, so I plan on using
> a C program to perform these tasks.  In Qubes OS, I expect this program
> to replace the block script entirely, as performance is critical and
> flexibility less so.  For upstream, I recommend having the block script
> be a script that calls this C program.

block scripts can be plain binary executables, so I think it would be
fine for libxl to just call the executable directly.

> > > 2. For block devices that are opened by path, the toolstack needs to
> > >    ensure that the device it has opened is actually the device it
> > >    intended to open.  This requires device-specific verification of the
> > >    open file descriptor.  This is not needed for regular files, as the
> > >    LOOP_CONFIGURE ioctl is called on an existing loop device and sets
> > >    its backing file.
> > > 
> > > The first is fairly easy in C.  It can be accomplished by means of a
> > > XenStore watch on the “status” entry.  Once that watch fires, blkback
> > > has opened the device, so the toolstack can safely close its file
> > > descriptor.
> > 
> > Does the toolstack really need to close the device?  What harm does it
> > do to keep the handle open until the domain is destroyed?
> 
> This would cause no harm, but it also would not help either, so I do not
> see any advantages to doing it.

Well, seems more complex because you need more synchronization between
blkback and the toolstack in order to detect when blkback has opened
the device.  If this is not strictly required I would rather avoid it:
more complexity just leads to more errors.

> > What about disk hotplug?  Which entity will keep the device opened in
> > that case?  Is xl block-attach going to block until the device
> > switches to the connected state?
> 
> Whichever program opens the file will need to do this.  

This is not trivial to implement with xl, as `xl block-attach` is a
short-lived command that just populates the xenstore entries for the
to be attached device, runs the hotplug script and exits after that.
I'm not sure we would want to change `xl block-attach` behavior to
wait until the backend has opened the device.

> This could be
> the program that is using libxl or the block script that libxl invokes.
> I am not familiar with xl block-attach as Qubes OS uses a custom wrapper
> around libvirt.
> 
> > > The second is significantly more difficult.  It requires the block
> > > script to be aware of at least device-mapper devices and LVM2 logical
> > > volumes.  The general technique is common to all block devices: obtain
> > > the sequence number (via the BLKGETDISKSEQ() ioctl) and its major and
> > > minor numbers (via fstat()).  Then open /sys/dev/block/MAJOR:MINOR to
> > > get a directory file descriptor, and use openat(2) and read(2) to get
> > > various sysfs attributes.  Finally, read the diskseq sysfs attribute and
> > > check that it matches the sequence number from BLKGETDISKSEQ().
> > > Alternatively, one can use device-specific methods, such as
> > > device-mapper ioctls.
> > > 
> > > Device-mapper devices can be detected via the ‘dm/name’ sysfs attribute,
> > > which must match the name under ‘/dev/mapper/’.  If the name is of the
> > > form ‘/dev/X/Y’, and the ‘dm/uuid’ attribute starts with the literal
> > > string “LVM-”, then the expected ‘dm/name’ attribute should be found by
> > > doubling all ‘-’ characters in X and Y, and then joining X and Y with
> > > another ‘-’.  This accounts for LVM2 logical volumes.  Alternatively,
> > > one can use device-mapper ioctls to both check if a device is a
> > > device-mapper device, and to obtain its name and UUID.  I plan on going
> > > with the latter route.
> > 
> > Likely a stupid remark, but needs obviously needs to be kept to Linux
> > only.
> 
> Indeed so.  I have CC’d Mariusz Zaborski to check if FreeBSD needs any
> similar changes.

So you know Mariusz, small world I guess, I've been to quite some BSD
conferences with him.  Hope you are doing fine Mariusz, long time no
see due to the covid mess.

FreeBSD blkback doesn't use loop devices because the kernel has an
interface to read files (so blkback can open raw files directly), so
I think this is all unneeded.

My comment was mostly iff this is implemented it needs to be contained
to Linux specific files (ie: libxl_linux.c).

Thanks, Roger.

