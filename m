Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6498526201
	for <lists+xen-devel@lfdr.de>; Fri, 13 May 2022 14:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.328457.551469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npUTS-0000zP-LE; Fri, 13 May 2022 12:32:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 328457.551469; Fri, 13 May 2022 12:32:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1npUTS-0000xa-I3; Fri, 13 May 2022 12:32:50 +0000
Received: by outflank-mailman (input) for mailman id 328457;
 Fri, 13 May 2022 12:32:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0acU=VV=citrix.com=prvs=12587a88a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1npUTQ-0000xU-2f
 for xen-devel@lists.xenproject.org; Fri, 13 May 2022 12:32:48 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c99cf52b-d2b8-11ec-aa76-f101dd46aeb6;
 Fri, 13 May 2022 14:32:45 +0200 (CEST)
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 May 2022 08:32:39 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SA0PR03MB5404.namprd03.prod.outlook.com (2603:10b6:806:bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.27; Fri, 13 May
 2022 12:32:36 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5250.014; Fri, 13 May 2022
 12:32:36 +0000
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
X-Inumbo-ID: c99cf52b-d2b8-11ec-aa76-f101dd46aeb6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1652445165;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=LP4MQgq0b3+fAz17OG2p6sw+zH3PQHU0YZXiOEUL8/0=;
  b=A/egOAx2EWb8XWOdx7K82QHtDT4RbKyjmBy/EGT3Y2Brq9gAGRuA9B1e
   WmPzOH0NqIokE4p9g0inmNJhuNarUrJpxu7OMSNQ3Mxqrfk6UhGB0X1GA
   RfmXstU6pk8xtKjcy0CKlO9j/hp3Iva3+FOTkzVXfpvrVEeeTdqa1hfkx
   E=;
X-IronPort-RemoteIP: 104.47.57.173
X-IronPort-MID: 71117023
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OWrZHKPH9weE0zvvrR2ilsFynXyQoLVcMsEvi/4bfWQNrUongzMBz
 GtOWDqFOK7camHxfdsnad6+8kkG6pCHztAxGgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFYMpBsJ00o5wbZk29Uw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z5
 9lun4yLcFkQY/fg288XUwVTFwRUBPgTkFPHCSDXXc276WTjKiKp79AwSUY8MMsf5/p9BnxI+
 boAMjcRYxufhuWwhrWmVu1rgcdlJ87uVG8dkig4kXeFUrB7HtaaHP6iCdxwhV/cguhUGvnTf
 YwBYCdHZxXceRxffFwQDfrSmc/33yCmLGUC8zp5o4Ip+HP64gVy1YG8c9aEYMKQecFbk0qX8
 zeuE2PRR0ty2Mak4SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOTvv2RmkO4HdVFJ
 CQ8+CU0qrMp3Fe2VdS7VBq9yFaGtBMBX9tbE8Uh9RqAjKHT5m6k6nMsSzdAbJkqsZEwTDlzj
 1uRxYq2XnporaGfTm+b+vGMtzSuNCMJLGgEIygZUQ8C5Nqlq4Y25v7Scute/GeOpoWdMVnNL
 /qi9kDSW517YRY36piG
IronPort-HdrOrdr: A9a23:nGzb2a7p4VomdJL2IwPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.91,221,1647316800"; 
   d="scan'208";a="71117023"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUzfg1ka6kG8vmua+fb3uzdMKH5jB0qrdD+kBzuTzc87Je67zh+HcLbwQBB88Er/CKIixBBkugf8wL3ptzs5pHc0zlpW5Ae7vGf5zVwyQT4Q8MijcoYKvnsK/wfJBYwZQspXS/zsaqS7JT4uxGp267gI9RdmFNIxLGL8D0a/UrL9JgVOebPrfBvYxWQw3ZbVGNMeSbibrVI8ysEanjCAVsS9qlMQE8cle3rb1o4K+kiBODU7b3avfntDTc5iRiI+Fz8t00nrCgtkPdZXuYTafP8Dg4nfYSV5/NMMFHzZnzUDGTBCULALJunG139HSdazrVR4wUYN7mxOAMXei3QQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iEa3rG66BGk+Kc8prOOuBxOgEguZjAo0hFGK7M2byQ=;
 b=KyZoLum9oR/9ZUmNxNmObQrlbbEfOu0h4CNsvq0As4cFEZP03HevTuwue9b537sr2i/jIemcO5oWsvY7PQslfAxCwGl1ncND2R3hKstPtA3G5jjTBJd93Loo7PkTlHsLzcdQROhTtyySaQGUxCfyh0lQMDh32GwY9xGJLyf99enLmi6dvJTwHsNh7Ttfr2BSLTGxXiZTt2RymNYHaLNfmdv0jQMgvXYqaL9MlSjFZMMuTuMMDTAcqoXicK3Cm/AzUS9xXCGR4K8hbKJk9FXcAUJBejlILS5p533OORR/bFQCtiCRyTKLeqqblVnZi2nt9y/UsMl3Xb88Gl8gs3UAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iEa3rG66BGk+Kc8prOOuBxOgEguZjAo0hFGK7M2byQ=;
 b=VfBP14pBQiOeljTNBl0Hc6v3fsXWIcsvZTvT9pHp2XXs240ViSntUaA2fQ6nsUevj5AGC8/lLmpe/gTbBl5DBbS+JvQOs8lu7oLJlGBDflYbFAXK/kwYpA3Glutf3DJvEUOapZplX7GJUwPnKaVlJMbJEhSKsAB99D9YNpqIgps=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 13 May 2022 14:32:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] x86/cpuid: expose MCDT_NO to guests
Message-ID: <Yn5Ph19NgTWcsVQT@Air-de-Roger>
References: <20220513103500.3671-1-roger.pau@citrix.com>
 <20220513103500.3671-2-roger.pau@citrix.com>
 <15d66a71-33d5-c866-e57b-be0f42d1ce5b@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15d66a71-33d5-c866-e57b-be0f42d1ce5b@citrix.com>
X-ClientProxiedBy: PAZP264CA0039.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62b49e66-4454-4544-cca4-08da34dca944
X-MS-TrafficTypeDiagnostic: SA0PR03MB5404:EE_
X-Microsoft-Antispam-PRVS:
	<SA0PR03MB540445B5B7AA9BC81D6925508FCA9@SA0PR03MB5404.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pVcBzbnGeED2kzooueYriMVavOvFzWi1f7aFAOeAI4IWA9JiJudd0E06tLJKzm4gRxAHfBLXD0nZjh3OBwe5c5QlTJ5dDvDM12nHz+9jEe0RBxVMjIUf0LY0jMA6Nhz23u4QGk22ecGngGKsr3sq4o/aGJ2e5GkM8m9fMbozL//T28AWYRcOnNUKbaPodA2ylV3Y9EZcvVStm1UlqWvolBoujVPOzjfaQJjca/TkNxOiI6c2tT3iA+39MgqcAGY5xPoPW0SVpoBzNetS0xt8Ogv+R+9vQrfTogqvPe3H1zTvWGeLBNRJg4yrrOy0LDt0/TcVPF1gYn3QiYKqs1Zp1P7/9YwM57oJ161e1nrZKoinaUmsrkYkBf7HUASlKgROpjEoQIGNLBhKAOGGd2al2jiFzXGECU2JpOrONeZ+3MAkBhCuKx+fH5hX1ufjhl/e7O/uwopDX5zb5YsVv107jIPIrJNjWNVhyjs7D14WYTG/fMgim3hDs0ecUX/MmhGov9Rc5NFr4rLNcjhnOSYaFe5XfELTEmNCMlOKq8p/QpX2ZqZs6v1xh5px+GhbAELVHmen3yE6juD0Z1EwU4hozdGaj+1v8gT+DxNe4dqcCEvTJCvmhNZQ/KX+avU7jP17VKUp2sTd4ssiFdzmNbWIDA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(38100700002)(316002)(4744005)(2906002)(6666004)(85182001)(33716001)(82960400001)(54906003)(6636002)(508600001)(6486002)(6862004)(66946007)(4326008)(8936002)(66556008)(8676002)(5660300002)(66476007)(186003)(9686003)(6512007)(26005)(53546011)(86362001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1RvSGV1WHUvVXdPNWNmdzQ0cFZJNTNNYVg3V3RuTG40UW1XTTNoNTdFeFgr?=
 =?utf-8?B?a0EvUmpQMndOQURPekJZWi9wNFUrMjRQWS9makVQdHQ3TUdLUmtoVGlxbjFG?=
 =?utf-8?B?akg3aVEraHR1L1R3ZGFzN0hoakMydXoxVVlKV05NNTh5QzdxWlQ3ZVVqd3Q4?=
 =?utf-8?B?U25JMlhQZTFUdUplYzZuKy82MTVKYkdJRStQaXhpdWxUQXQ2djBSOFptSWNj?=
 =?utf-8?B?aGM3dFAvOUFQQ3JqVlBjTEZiT0tKaWVSbm1HVHNsN2NCU2pTMExXMWVZVjlH?=
 =?utf-8?B?RjhhemFkQ0lLVEtvWTlFaWZXN0pVMVdoVHpPWGZGcmh6aTR3L1phajMrS2Zk?=
 =?utf-8?B?RVl1Y1kwWUlFcCtJcUlHZm40a25XUVVFOUdPcHFOdzJXV0RYSHJtNm1FQXJI?=
 =?utf-8?B?RGsyNU53WUU4bUZHWk10MHd3dC9mVWVGbi9DN3RRZHExbjdEdDVPWkc3WEw1?=
 =?utf-8?B?MlFvVnZMUFd4N3JCMmZkOFlUcExGZ0tScTBFcUs3d1R4ejJjVlozcTBIaXpR?=
 =?utf-8?B?c2E1eEJzUndhWGdhYzhiOG5YWVg3UkV0TFVQK3doTVg3L0o5VlFvcDRTK2l5?=
 =?utf-8?B?L2ZNVDU4WXdWN0FKbUh6Nm5ZKzBpVUxzN3hQbysvVGR3WWJnM3BzUHd1d2FB?=
 =?utf-8?B?cDE4NC9xcnpaOW5RcGlzZ0pJMkhNSEt6U0hVOHhtZVZYNUdyMVdoUVFrdUJl?=
 =?utf-8?B?RldLeXlpdFdLK1RtU0t3aW5TZVNJeit3b2pvcmUzcnBHTGJrdGh6SHNKL1lX?=
 =?utf-8?B?MEI5VUd0VldjeEpEQzFlTUlpNnJyUjZodDVUQ0k0eXpsSVExemtPVGRSM01O?=
 =?utf-8?B?Q3Q4RWFaMUNRU3Zjd3lJRFpmbDlDK1pLS0NIY2pMMkh1L2xKVXRydU9TbENl?=
 =?utf-8?B?NEVaMDNYTUtEc1p5U09iOHpSK3FLMUdaeTlzMTlmWThVYlJ5OUlhbmtrM2FD?=
 =?utf-8?B?empDdXFqVzdhaG5MbWVPeDZlS0RmdmdaREtEMXFDUjF1QnFzdkpObEJiTjJm?=
 =?utf-8?B?a2h4cjJycW54cytsL3UrQndCd3UrdnljU1hnMm1aQTJWVlJZWmNLZGo0Umly?=
 =?utf-8?B?SEhxQkNPTXlDWHJXck4zVHBoS05RMHdlemZEM09scWQ5akN2VkpXMmc3NjJQ?=
 =?utf-8?B?OHJxZ0FsU1JqbmZ5Z2JpVXZOVE5SK1Q1OHFCMC9NZmJ2MkZhSDNCdG1hY0Zm?=
 =?utf-8?B?SVdsWEUvbTNPeHlxLzFDdk90Y2RYOG5ibEJhS01RU2xkd0FPeTI2RFhmMERn?=
 =?utf-8?B?Vjg2SEgyZW05OHlFSllIOFFXeTh3Mjl6U01LRWRiUkF0U3VwcDM5dzIwV0cy?=
 =?utf-8?B?Rk1KOGZzYTN6TFRGQkl3WFBCUzBGY29YR3VUSHZGYzNhMmtIMjZ5UHVvZW5p?=
 =?utf-8?B?RDZTYWR6dGNuRk1FTkx0MlZ1czF6bHl1MHRYcnkzTUZxSEk4SzJpOFhwY3Nq?=
 =?utf-8?B?L0J4Z0FGUXdVcjBXeVA2L1F4QWhZa2c2c1R1RXdYdkJZR1U5eVBzRHhsbWVj?=
 =?utf-8?B?TlNISTUxU2xveDBPY3BqbnMrQmNiT2FmSkJqK1VFbFl0OE8ra1JOUVZWTks5?=
 =?utf-8?B?Mm9nRUUrR2ZnRDB4NGpWaHg0OG5YQnZ3NE1YUG5RaHhjVjQ4WExsQ2NvcjR5?=
 =?utf-8?B?ZWp4NFFZajZLNi9xVzhFY0p5ZkRrVjBGOW1oSDNZSEZqaTRaUG82Rjg5WkhW?=
 =?utf-8?B?NE9UcmVGc1dxR3A2TVFqMGp6eXEzQkxYZ3ErSUVzUU5FdG42aGZKYmRtbWdP?=
 =?utf-8?B?WW00UytsdUNkRk9RZjFnbEZCZUx6RlBTbkZ3N3VKd29PS0hVZnh4Y25GcjJ6?=
 =?utf-8?B?RFliWDRUUWhOK0RheVFoMlYwOGlqSWVFTWFuQVNlWTVXVkwxTlUyYm41aDBK?=
 =?utf-8?B?TEZJUHB3TU5nZGttT0l2anBINkVzczlCUGJERTRtQWhoTHd0b2lxdUx4b2xL?=
 =?utf-8?B?ZFliTThSVCtqRzVndndqU1ZOa3FseGdhTlpwTlFYTG5Nck92MEtKMnhrUi91?=
 =?utf-8?B?bzdHRWRQLzlvWlBWRnFxeUxMWW15OG1HQjZoWkNEVDVKbUxyNHRXNWdGTHAv?=
 =?utf-8?B?VUMySUJyU0xwemY1ZVpVZWFQUTl4WUhZdDFmZHprVEgrRFl6R2NrU0xTZlhv?=
 =?utf-8?B?Lzh2Um9QSloydFVGQjlFSHJZcFZ3ZHFVWnlOalBiWVFJcHdmZlNIendpRDRM?=
 =?utf-8?B?NiszNUtWbkNIV2NsV3pWSWp2NGVCR0RZNnBsUmZ2b0FRZXlpU2hnaHhXV01X?=
 =?utf-8?B?YWtoM2VydzVRM3BPSFNnOENxTWtBZWhIU1VrU3Z6V0Y1KzJFaXNIbWpHUjU3?=
 =?utf-8?B?RVVDWFg1WURZbVlYcWRXNktzRGJJTFAzRXdleGUvN0RXbnJjOUdsaHQwN1lQ?=
 =?utf-8?Q?XET8IiH5VVucDYKI=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b49e66-4454-4544-cca4-08da34dca944
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 12:32:36.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQZxO5wIcN/mFVohwBbWDzbtvu54nWtzTL+EMMNOfB0tR52kxzUBe4knBrqifqozRSnu58tlNFGsC0IVeek3RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5404

On Fri, May 13, 2022 at 11:06:01AM +0000, Andrew Cooper wrote:
> On 13/05/2022 11:34, Roger Pau Monne wrote:
> > diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
> > index d462f9e421..697ee38270 100644
> > --- a/tools/libs/light/libxl_cpuid.c
> > +++ b/tools/libs/light/libxl_cpuid.c
> > @@ -235,6 +235,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
> >          {"fsrcs",        0x00000007,  1, CPUID_REG_EAX, 12,  1},
> >  
> >          {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
> > +        {"mcdt_no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
> 
> I think we're wanting to prefer "mcdt-no".  Can be fixed on commit.

I've asked myself whether to use - or _, went with _ because that's
the exact name on the manuals (minus the lowercase).

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm fine if you want to adjust to - on commit.

Thanks, Roger.

