Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBE5F2E93
	for <lists+xen-devel@lfdr.de>; Mon,  3 Oct 2022 12:03:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.414800.659195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofIGj-0004Ng-OU; Mon, 03 Oct 2022 10:01:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 414800.659195; Mon, 03 Oct 2022 10:01:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofIGj-0004L5-L6; Mon, 03 Oct 2022 10:01:49 +0000
Received: by outflank-mailman (input) for mailman id 414800;
 Mon, 03 Oct 2022 10:01:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zoY7=2E=citrix.com=prvs=2684d4d0d=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ofIGi-0004Kz-2a
 for xen-devel@lists.xenproject.org; Mon, 03 Oct 2022 10:01:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60419a69-4302-11ed-9375-c1cf23e5d27e;
 Mon, 03 Oct 2022 12:01:42 +0200 (CEST)
Received: from mail-dm6nam04lp2047.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Oct 2022 06:01:38 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA0PR03MB5561.namprd03.prod.outlook.com (2603:10b6:806:bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 3 Oct
 2022 10:01:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.028; Mon, 3 Oct 2022
 10:01:36 +0000
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
X-Inumbo-ID: 60419a69-4302-11ed-9375-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664791302;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=V/GDoceBNcvErv+mop6ozWhndyuwrzfH1EsNijPs3Bs=;
  b=XnOqoAj/C3hBecJ84FPko8nSHFM4Md0TgxIiWr0Gfv/hhRaQfssAlqTu
   3yEoxY6gh4dHOxc5uur6vq8kHCu6/TgfG+Y6vPWkdxpE8+d7xrkDKRzI1
   eux21lG3UDwyTirPHZ/Gj+c3X8ALiwO3fjmX9r63RndPnEVbrlJLxRvlb
   w=;
X-IronPort-RemoteIP: 104.47.73.47
X-IronPort-MID: 81829358
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wpscd6khErqu/3PyLYLw8TLo5gxLJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJNXW/TOP+JY2emLtkiOYqxp0hTvZTUz9dgT1c5/n1gFCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6UqicUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS83uDgNyo4GlC5wRmPqgS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfXm9n7
 fFIMzoxYDvTusyZ37PnbbdliZF2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6Pk2Sd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iL11rWexn6rMG4UPO2V0/NP22aP/288UwI7ZFzg+cuYrnfrDrqzL
 GRRoELCt5Ma+EGuT/H8WQO5u3+OuhMAW9tWHPY+4QvLwa3Riy6JC25BQjNfZdgOsM4tWSdsx
 lKPh8nuBzFkrPuSU3313rWeoC62OCMVBXQffiJCRgwAi/HmqZs2hwjCTf5iFrC0ldz/HTzsw
 zGMozM6jr9VhskOv5hX5njCijOo45TMEAg8412LWnr/tl8mIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF7n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:Se+IsKOgaMF+C8BcTyT155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jztSWatN/eYgBEpTmlAtj5fZq8z+8N3WB1B9uftWbd2FdAQLsSjrcKhgeQYBEWldQtqZ
 uIEZIOb+EYZGIS5aia3OD7KadH/DDuytHUuQ609QYIcegFUdAD0+8vYTzraHGeCTM2cqYRJd
 653I5qtjCgcXMYYoCSAWQEZfHKo5numIj9aRALKhY74E3W5AnYoYLSIly95FMzQjlPybAt/S
 zslBH43Lyqt7WexgXH32HewpxKkJ/Ky8dFBuaLls8JQw+c/DqAVcBEYfmvrTo1qOag5BIDl8
 TNmQ4pO4BJ53bYbgiO0GnQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMnZ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvtn+9KK1wUx4S1bpXXt
 WHVKrnlbdrmBKhHjvkV1BUsZCRti9ZJGbHfqAA0vbloAS+0koJjHfw//Zv70voxKhNNKWs2N
 60TJiAtIs+O/P+PpgNcNspcI+QNlHnZy7qHSa7HWnHfZt3S04l7aSHqIkI2A==
X-IronPort-AV: E=Sophos;i="5.93,365,1654574400"; 
   d="scan'208";a="81829358"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HmvROMxynk68SByMS3SBLLC9sQwg0nCXd3QpUXxWKxtvhpfi+x2peF32/9PyS41h9uQNOfWU2PafTn4qTuNWlspn/Yqabmi7Z+Va8DUMxtWIs2hLVog0/xtQE7qvCcZcFufZntIjDYgmNcmP57Xgfv7/TjSUpIZGEwmxDtQdUJLVj8D/AgX2I/NLYc2sHXoLSjPkz/LXQInLiVYxAEDyHC32GgRSHGzLtJV4RoN6vcuGIVICFtJkp3ZZ4cWTHoMKeupaIux8VmLtbLFDBmU6rcsVVjpwgDUrZfGD7RATijRWVYgiRVHP/hXY0bfteJxSaOp/+9bNZJpj8S8Bj0valw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pPMRIbOzXmorty30qTqxzLTymVeMQTiurG3jYHFjYO4=;
 b=fP7LL/iYAj8zRnkWGNXGUIFXehYWZmnhbizrvWLCwW7x24Sbc0ZUzy+8po2tmsH1o9T0SgpdzEFuWOO2ARyQ6l3dlUGRLPBjvx+zFPwCmNYE6pnUKBITy62wsqHJKKAvQlgz2hOJuVD9VkBIJa4CqBYxRjwgDRqlx9BUX3Mr4Ac1cOFN1k4L/gSCcG/3TIh+azgEt12FU+G3kRM+6poeDkGBLOXmlJE6Xt8PaFsw+lEMFJrXwvUQJNZRR4/q1F3AY7tDhHwRhkDI/I9wWR4YCgpNNPAmlNQazJbWmM1RbdwyGe+Z/itdJVxgjGm49fWOxrG5MYmkTEUTSrt5DZIKwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pPMRIbOzXmorty30qTqxzLTymVeMQTiurG3jYHFjYO4=;
 b=GSuw5ZrGnsPw7Aj3LrTBcyl+s+823DBOdxR9wfgAo5lt9423xh/Os8x3SHGn2R0D+OSbJYzXF18NmIX/rwe7igL13DT/LEHSYbosVOLdtpu8Ej5sQf/paMZ4QEoIpGxTjEcKk6Z3nnEZwWR3hoJnMc1keec0wcCVItgOH5CDGC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 3 Oct 2022 12:01:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Use EfiACPIReclaimMemory for ESRT
Message-ID: <Yzqy+c+jmI8xwEBD@MacBook-Air-de-Roger.local>
References: <2561c7fc38d9b4d17cb0205fec49b941894cfcc0.1664570575.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2561c7fc38d9b4d17cb0205fec49b941894cfcc0.1664570575.git.demi@invisiblethingslab.com>
X-ClientProxiedBy: PAZP264CA0199.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:237::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA0PR03MB5561:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea7f849-ba68-43a2-ca9a-08daa526425e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5X4TRnlSqi+RlzuC1u/hNP1lm8k6evzeG5qJQMo1d7bSfjFZ/6sgP6aKEg7MVoizh3L0SwlZP8aX6avwX+ceSfhnRpEqgxBK1jGOTnX2Y0cT5oqihxD4SYzNAFHmbLPrIu2DyuhWcqZSSciC8Oaur4XazEsv7mvLL0aQAP1pgKZR6GPiOwf1bW4p3BblRAdgQrFgipexkZBf2uLbnVPp06JUjIfeCLB5h36OmlRxKXqhhb4VUB0LIQTsLtLViXy3AuQsSH+6ExwRMgpxU7tM3X3fCc0yIMWDUOOL/jgNeTygi8YuCLPeJZqG8EigjBNkNoWII++X0VPm7gApQ3idnUiK0uWOWPxtUbtmnyaRirRJIoa5ftLtbbZ6NKurU+6BjO7YqvJtVJlPikmvCx8orCYLDODA8KmS1KACIqUHTbLC2Nb+CoXpZjwbDuS0p5kXE2n/M63RoiyzKu1zksrOH2mg57Shs1Wy6JxIsV0/xVlKzrtiIDaDp/8IaRims4CeJJaXuCJ6ThI1DhTy2t7fwAtYr0ftpVBaKsPufiOKfgSHYy5Vu9r4E3Bgx+GU/y4L2dxo4mWR1ZtsEvSwbvUr0QNmCCZWuyqYdamWivX7mrVHnG76+1YuBKLvAp7GymjOEHbjTKIP7nYzVnj2WQIkseC4au1xEM9Rtns7iUugXh4+iNNv7E84c90ZlzyodYCbWErmhNlSfjvxItbgvkdwrw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(136003)(376002)(39860400002)(396003)(451199015)(9686003)(26005)(6512007)(6506007)(86362001)(4744005)(8676002)(54906003)(4326008)(316002)(82960400001)(38100700002)(85182001)(6916009)(186003)(83380400001)(478600001)(6666004)(6486002)(2906002)(5660300002)(66946007)(66556008)(66476007)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkFjeHlaWE8vdVJSOGtkL05tRENTOTVPQXBRWXhmN05tUlpIMTZwV1U5SzM5?=
 =?utf-8?B?NGtXazU5UktSZDNQcUt6VFdmbU83a3V1S0tCZ2FrK1VEOE5ld2NZMnJEZWRm?=
 =?utf-8?B?eFVrV213UXpzV21MYkJEaEw2MCtKSmo4VVlPSnFmVFhhN0laS3A4bnZCTS9R?=
 =?utf-8?B?OEZhZnZYMmNUanoyazBGbzBuY2ZRdHpraVNib1dvemQ5NFU5UHRVK2ZVdUY4?=
 =?utf-8?B?QVpuTEVLV3l5aVYwRXQzMVFnMjhsVXZIeGxJb1JQUExMYXhUemhWRURldnBU?=
 =?utf-8?B?L3VOVnZxTDNRWHU4eWFEZWlxc0p3UlRsVG45OS9VcnEreGdiMkdRU3R4a0pR?=
 =?utf-8?B?eUZaaFNPNHpQUlU1ekpLWEFLTzBkYVY1NjFjaDRrSW1TcHNHcm1XcnF6U21n?=
 =?utf-8?B?cXFCZ0ZLSlVxUDJsVVFBMVRaWi9mdS9FZDBsWUtuL0xrZk1KbXVFc0J3OEw0?=
 =?utf-8?B?cUFFTFdYQVNpMkdONHEyakZDakxmUDZ4RmtoLzVDZTVYOTVSc0NubyszRDVO?=
 =?utf-8?B?UWdwV3Ezdy9lV0RQU1JPeHExcmhKZWp4b2lpL2xGOVBNT2ZpV2ZFTXpsZkg2?=
 =?utf-8?B?UERLYTVySnUrQUtQY3A4bXp1bU9pamk5QTIwVk9wakczblVIbE1tWkt4WDFp?=
 =?utf-8?B?V0oyMlFubEpKZUNQUGdCa3pRTnp1RFZNRkg5R0NFYWVlMjc5eGhWRXMzVTgy?=
 =?utf-8?B?V25SN0hYWHU5NE1qa282YUpYWU9WZ2hiQ0dsUnF5T0gwSmlBenV0N3NBRXRZ?=
 =?utf-8?B?MjVPbkxHLy9QUXMwQ2ZwMitET28rdUExMkoweWkrSHRaRXM5dkJjQTRRN0k0?=
 =?utf-8?B?SnBTME52UUlYbmlLSGx5VlE2aWJzU3Jwc3c4Z1V2N2ZqZlJsOUlCcmtCM2d2?=
 =?utf-8?B?cWE2a3B6d1ZNS3V2bXNrYmRXdmlHNlpqcUtrOFBzamRkK0hYMVBCMnA2QVRy?=
 =?utf-8?B?aUhBaEVVajEybTFBVTZqaHF1aWI2RHBXaEhmaFUxTUpacUxqRkF2cnFYSjdW?=
 =?utf-8?B?dFJQRm5KT05WVW0vZWZaUzNRL0sveXpROW1qWEJxdThQY2Uramc3ZlJpUEFP?=
 =?utf-8?B?NHI2NDIxU3F6U2JNQ3dYV3ZBenFGelFmaVhaaGJKUWpWK2pIa2NsV05ERWU1?=
 =?utf-8?B?RnFtS203bURzWGRNTjBpeXVVQkNVeXpZYk1pR0kxeS95MlNMSktELzVwbWJx?=
 =?utf-8?B?MnJHaDFDZnpyT1ZKSWRTWmlDaHJpUHlmeWF4OVlPYS96MlE5c1d2Nk84aWxT?=
 =?utf-8?B?SXhhM3dadTJKQTFSMS8rN0hQQzJJNExJaG9LS3VnTURPd0RYaVVJR0NVdFdv?=
 =?utf-8?B?U1FRWTZ1QlJaRERudDdVQUtON1FOL0JCbm1LTDVtZnhhOGdvcnlOVWhHUFhF?=
 =?utf-8?B?T0lhd1hkVkxPQXpHMU9hUXNXWmRWM1dzWkN2M0w5ZEJkS0FGc3hqbGF0ZkQw?=
 =?utf-8?B?SGtGREwwVFlvR1Jjc240YzRkVVZ5WGd3VHN3VnVQWmp1MmszWVNnMGcrTVhn?=
 =?utf-8?B?VzZoYlNZaTNaeHQ5alV0TnVSRnU5ZkZsa0t3ZUp1Zy9hTXUrSmdyS01JREpW?=
 =?utf-8?B?R084VnJTUlZRRUxrQlJ1U3FVSjZKZ1YvMm5ab0tKK1plSjluT1NZRGxxTnpK?=
 =?utf-8?B?NEQ0VjRLSDg5Zk5qcDN1d25kMjRVYzZoWldjdG5pM1RqcFFFN2NFU1lBZHk5?=
 =?utf-8?B?SEVvV1Rtam9XdFNnbnlvWE1RV3p4Yk1OR1Q4YTVTNzdQYnpMdko4Y1lwa08z?=
 =?utf-8?B?YWR1VVRuQml2V3JaUzNEOXFadnU2QlRHYktrZE9hU0s0c21sSVlvMXBvQ3VW?=
 =?utf-8?B?ck4wSTVVd2tnNjB5dHF3TXJMWGkxSXRDY2ZKWDhaaFNoRWp4V3FldFlMYXlQ?=
 =?utf-8?B?bE5XZkFzRFhaS3A4eERXQjBPb0Q0VUwxc3hjaVBZT1NRSUpnYW9Wb2RKTWF3?=
 =?utf-8?B?TDdMdFNaNUxBRTA5eW92OHdPenNQS3IzR0d5REZqNXdvRldFaXNSYXh4WEFP?=
 =?utf-8?B?NHlSU0YvdVVuZlZXQXRURmpBZnlnelZybEIyRzFWelZnRXJxN2ZMM1RyUER5?=
 =?utf-8?B?VVVsSXg3TXVDakRydzlGN1dIc05ZUVF4VUJmcDRUUUNBNGJ5dWJjb2JNTkVn?=
 =?utf-8?Q?9yJGDQUWlNsYhzcu9Pe0vzxfE?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea7f849-ba68-43a2-ca9a-08daa526425e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2022 10:01:36.8601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unhcP+ZC0jGnWOqcVHcXX01M2ZeaF3ww4XK0slluSCiGPx6ffZv3PLGqcMX2rF+gPjlQRwPNyi4AyUrZJbYD3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5561

On Fri, Sep 30, 2022 at 05:02:02PM -0400, Demi Marie Obenour wrote:
> As discussed on xen-devel, using EfiRuntimeServicesData for more than is
> absolutely necessary is a bad idea.

I'm afraid this needs a proper commit message: commit messages need to
be able to stand alone on it's own in most cases, without references
to external sources.  IMO I would add a summary of the thread that
happened on xen-devel: scenario, issue and how it's fixed, and also
provide a link (from lists.xenproject.org) to the conversation thread.

It's also missing a SoB.

Thanks, Roger.

