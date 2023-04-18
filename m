Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B40A6E6B24
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 19:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523017.812746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1popAn-0005Ri-72; Tue, 18 Apr 2023 17:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523017.812746; Tue, 18 Apr 2023 17:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1popAn-0005PA-3v; Tue, 18 Apr 2023 17:31:21 +0000
Received: by outflank-mailman (input) for mailman id 523017;
 Tue, 18 Apr 2023 17:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1popAl-0005P4-9F
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 17:31:19 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1b0e980-de0e-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 19:31:16 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 13:31:07 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB5902.namprd03.prod.outlook.com (2603:10b6:a03:2da::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 17:31:05 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 17:31:05 +0000
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
X-Inumbo-ID: d1b0e980-de0e-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681839076;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fqTLQ8QMx/L0Df/mejP/A+c7F0UDtXJOlbscrTKeTKs=;
  b=JCCJbP4wMF1eAflvwSdGlvw0WeTtVLYyrTAN+bIH1AL+icP4Uaas1Du3
   nqu+vn2xBaLcFaeT5uSUftrHP9mxQq+QtauzSp2U4OIJ+rhlbD4HjSVNX
   Uf0qfnSlWi+ShRkuIEzJ925P6bC23w37lW9juqvNTw5t9x1UtqebcF+Lz
   Y=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 105336779
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LsBDYqOaWOzGRWDvrR1glsFynXyQoLVcMsEvi/4bfWQNrUon12ADn
 zdNX2mEbP+MMTD1ft9yPYzk/RsGvcPXy4c3Hgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tE5wxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vlTUWVkq
 /EjEjlTPxaondiR5eqnVvY506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX6gA9xNS+zQGvhCnXLI2HcTITstBF68n8S2h1aMBv90J
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQN4sudIyRDcq/
 kSUhN6vDjtq2JWKTVqN+7HSqim9UQAWKmkYbCNCUgoB4PHkuog4ih+JRdFmeJNZlfXwEDD0h
 jqM/C43guxKidZRjvvru1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nU/MBRaI3hxI2U2ss=
IronPort-HdrOrdr: A9a23:aZ6q+KHqD9gEYnnbpLqEzseALOsnbusQ8zAXPhZKOGZom+ij5r
 mTdZMgpHnJYVcqKRYdcLW7UpVoLkmslqKdjbNwAV7AZniDhILLFvAB0WK4+UyZJ8SWzIc0vp
 uIGJIObeEYY2Iase/KpCGlDtA6zMCD4MmT9JzjJrRWIT2CqZsM0+60MGmm+4RNKjV7OQ==
X-Talos-CUID: =?us-ascii?q?9a23=3A6yUu0Gke73mUM90WLsx1IhTH4svXOWL5nHP6fUK?=
 =?us-ascii?q?DM283Gbu+U2W33ft4j9U7zg=3D=3D?=
X-Talos-MUID: 9a23:3FWnFQqx/Cz9ykKBAW8ezyxNb9lz442IMxEIlqs7tMScB3FdEDjI2Q==
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105336779"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WpzWBp2UoOVlVnUvaX6/QXVy1rLJjOjXMBgKF1ol1mjTl452hUcM9VOvGHYNEt8HafAJNs3Pj6QLSpoZYGetz/D633zWOds3ePo0VMVatjE9ALN4JyOQ0jk3jJO374ZaaHybghVGXyBA6aZz1Uu6JxC2Dx3CGYHxZVFRYBSDekIj84fCtSLEZb11Wq5Ht0i3GrgO6/e+nPbBwNK62HB4prN5Lg3uLZs1vf1Shd/ReS6PnBZxSD1er+xAWdkywzUWegqNss05cQJe/vUoE87/A8GdTINRpN2oAVyyg2wpMkbAqjzqCIdFHKxmuhlF7vSqVXdOf2tfUUOGE5Iupyo41A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbRp9Mx95LV5ej9oSFLZYhqDm13n7JL2CcAFETtf5rE=;
 b=izlvzej05pfxzfrtQobTTmzLM4lkYAG42cQsVwAhLOV+7eygQRcYNdta1z/rwfIlq5pR7q8OeJs/E7CsCyHEG4IsIHgb0Bm+GNO7KEohyDmH5IquDAP2hwHjJXliWm00Jj+BBUOekng/RfTS/QBDCFwrzTITjVyHCkTkfXeKlSPFTItzhYzO+Nk4uq1ziOm40LW33QFgQSJxbjEG4JeANKHIK0H8S3nwFEwwa5RodxRyJmcZcJ5Vtdwv2aazXE2CVjPSt7LTJ8kyLx7RcYBmW85rSNpX1fm4xiNqd+QBKWwbs0a2rTTc1M5btcI/QIC8QePKPFRnCjikUQ9/BMCjOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbRp9Mx95LV5ej9oSFLZYhqDm13n7JL2CcAFETtf5rE=;
 b=xU7q6IpV1HPD2OOXUFP/whAs7oKImh9bYZmtLOSu5XQNFqY/viKZlMCLWJpcc52dmn4j+2R2HKkvjBp8e9ywrh5qsj1AUtN6oopkRpLuN14fuv1RSQAMwxjSPZiD8BdeEwvz5OJtMkXdFK1Zkz3WN7Fu9O2GPlrwh929A2+p6rE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c2693ac0-4f6a-83ae-c477-75b3f05b938a@citrix.com>
Date: Tue, 18 Apr 2023 18:30:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20230418111032.487587-1-andrew.cooper3@citrix.com>
In-Reply-To: <20230418111032.487587-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 03d07541-ce9c-4995-081a-08db4032afe7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FYR1uXU8sKBkkFSBuse9gc/0s2gUkKRbW2Xbloese1bXwxy8LRoyjGAYKYM2jBjrkMqLhNa8T1Be00MXqFp+1xTZGpklxYOFtfGlrb8BfJ8TfkWr89gsg5Yg8IOCfVX3dKBA5QbkvFdg3GVORoMAwSs9+I4j8bivsBuHh67KQ2Y+FFd4uf1Si/ft65lMtfuHp+zEQSbTg8I4zjnzzNGarrZ9CrLWUtqCxWS+89t2ULUakN4aemJfiUV2DXq3GgR5+RtojvhsU2vSq6WXIJnoKTJTGURHJbtFJa86B3aVrASGOwSIpVyqMrLwFXZA6t4Y/uQP1htZlrVogW7CojNaod9y8cvJ90tNpv5UWOHBSeXcn0Qv/2/4fCMMp1vALa+/hgIW1r3SK8qvalUISvbJumVG54OD69dskseuhE7Zlrt+T/IOb2C+Z8MUUcj/+HObLPZEwchkLBweWEYdnt2plzSEwItMgg6vL9V0gHPeqQyUSQ7UALbMbH0cQeIoaVHgd6uoOPQA6hlLhRDmdHPKg1b3ahnERagLYe8u9wtMRA0qeY43gaF5oQJsXDTs93eckqEGXckPcn9dd5cXNKCroV7quHc+tFHWdEV3Van9dWZbuhMLEWapbGwwMKyKM016NghHuDjEe9iFsyQC95j4yg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(451199021)(8936002)(36756003)(38100700002)(8676002)(2906002)(86362001)(31696002)(5660300002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(107886003)(2616005)(6512007)(53546011)(66946007)(6506007)(66476007)(26005)(41300700001)(82960400001)(316002)(83380400001)(6916009)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWlQSkFrVXJqVjk1bHJpT2hIYm40QUdyazlQMUt0ZlQ5QlI1djYyU0UwZFJL?=
 =?utf-8?B?S3F3VnJRRWd1M2lnNE5GSjB4ZW5TaGRvZWxHcVRoTTgrdFJ3Z1o3Z2czVFFh?=
 =?utf-8?B?Q1VYb2Y2aDdxZWtQaldhaFQ0MVNEWnYycE1LZHZDbmlrdVRJZDFZTDhMNkE4?=
 =?utf-8?B?NE55ZzhkL09HanJyR1VLUk1SSVEwYVkvYVVzeTM5bk00b3VZSzc4SFpIU0s5?=
 =?utf-8?B?dW04VER6UXpuY09Nbm94bXllZmgvTEYwb09SUXNaS0pFLzN5WnAzZFliM21q?=
 =?utf-8?B?QWxLYmg5Mk1mbDdGVjk4azlEbWI2dUw2Y09JUzJQNEtkMXJyNlRMS3V4WWNq?=
 =?utf-8?B?V1hoTUh1bEczRVVHZUFZZHdSZzFFVW9yaTNIQkd6OU0ycHRNVWFuQUM1T0RN?=
 =?utf-8?B?MHQ1UGJoWXY0OUFidjMyOEJJQmZoUDdDWkw3VlY0Z2lDTGQ3Tkc5L21Gclpy?=
 =?utf-8?B?WmVQRGlydVJuY3VmekFFbXV1cDIvZ2Q2VWZhWDhTYjZyNTJheDErVzY3ZU1L?=
 =?utf-8?B?V1BoT0tUUkdESm9HdnJsVkJuWnNiOGp3eHJyZysxYjlLSGN3ZWdVMWlWalRV?=
 =?utf-8?B?OFI0bGpDbWFvTENsK1Nna1NZMFM2Rk1oTGpVZk95eTZDNHlmL0RpNUx5aVZ4?=
 =?utf-8?B?TlJobkorZkVLQzdpTWI0SlZFUVJTcmpzTTBZeGZLa3NUQU1jUXRHbmZVTDZv?=
 =?utf-8?B?ci93N1ovYlZlRjB4bllzajFwOFF1SlBHeC9XbXJGa1hwR2NKRnZ2UGhGK0xD?=
 =?utf-8?B?TWdRWnV6OEMwR0R2VkdMNGtXei9ZSmdjcXFKTnhuVGNJMlhQb3NoSHBvdXpl?=
 =?utf-8?B?U1NrNVhFRkt1ZVdrS2lHWTJMNmdZWUJPVW5ZRCs2djAzN3lUcGNhSVdiaXB4?=
 =?utf-8?B?QjdBUTg2NE5tVGRkWURRa3NYWXIrd0lVWEl3L2hVdStkbXF5TkdEVFhSZFBm?=
 =?utf-8?B?YWlCdFRUVDZyb3RTdHJXM3E5T2xnTnJtRnhlWjFvYnZjOGRpR0FiSnpzTFd6?=
 =?utf-8?B?SW42NFRJbWxVK3FqQUFlWXRYUnROUEJIRU1sWW1pSjVhY3J5enljeHlHSjlk?=
 =?utf-8?B?ZHd4a0hXZkYwNFQ4dWk3VGN6YVVNd25iOHcxbC9KODRUc2ZZK3BwK1FPTVNo?=
 =?utf-8?B?N2ViRHR0SmllVTF3eHhwMzNZaGEyaHhwUmlMUzF6UnVCNHowbHVlTEFSaHlS?=
 =?utf-8?B?dHpzY3lBc0F4SG0xc2NMankxUUprK045Rm5yeTlEb1hSTHJFRUQ2cTBCQnZv?=
 =?utf-8?B?WVRmY28zMit1RmRzQUsycXU1NFFZRks1SUdtTzNtd2dZc3hndkdwTGRWQTk3?=
 =?utf-8?B?VE9NTWdmTWVUQ05SNnRpSUgyVVZxQ0ZBL3kyTURSWDV2RDJ4MDY2aUQrYkRt?=
 =?utf-8?B?SFZsMlN1QUwzNjZxSlhZVkRMWHVLeFBVZlJ5ZkFuNlJEQmFNTUc1dUhETU5v?=
 =?utf-8?B?dmdiRFcvdnoxMlNIK2hTYk4yTWZhZ09JRjduNWo0a3UrM0M1WFAxNlBhV0pF?=
 =?utf-8?B?VWZKWS9XOUJtWnhrbHp3WkpTMTVjMHVYOEZ6TWlzcElKTjRtUVVCTWkwY3RD?=
 =?utf-8?B?dGNxVTVLb2hFSDJJOGNPWlRXcklMR2R0bUVTR3Vtb2xBUGUvMGNxcEtFOXp0?=
 =?utf-8?B?L1RlUDF4MGhGYnhnTjhUeUlRbjVaOEhvWTF5MzBwUCswM2c5TWp0eitCZGJL?=
 =?utf-8?B?V2xMTFdydEI4T3pvb0pENGd4REFyUUNIYUY2SWFXRmZlSzBOL1Jub0VqRjYw?=
 =?utf-8?B?dTUzVVZzZzJuTVZncUZnRHlOcEhSLzhVY09sbFFtQitGVkUyYjNrT0NiaXJp?=
 =?utf-8?B?UXZPSGw4dGRMRmR1dmMrbUNVc1lEN2Zyald4L04rdHY4clgwVHBsdUI2V01M?=
 =?utf-8?B?MjI4OEQ3bFpFRVZiYnUrREQ0bkdkNmhyZmpGaGhvUGpROFdJR0V3aUNzQko5?=
 =?utf-8?B?Nk5aN3crRkRmVG9qbENGNFFGTjZMd0N2SFM3TEVRQit6T3JRenZKeW9wZlRL?=
 =?utf-8?B?SE0xMmtWS3ZKV2tZc2pkd1lUVXVkRDlWa3NNZWIvbldKcjExN2drM1lMSmVR?=
 =?utf-8?B?NnU5dHFMZFNCK2Vwb0lUT01VUjA5TDliK2RkRkJXZ1g5cTJBK2lMcTczK2dX?=
 =?utf-8?B?bHlERGR6RFc0bTNQQkpSYXhaZWhpNlEvN2V4YTU0YkxPNExtdnJwNzFqaEVa?=
 =?utf-8?B?NUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YG6p3qa3nv+P8ekJ7Wl2rL0cwbjTiAr78VWMk50FADhnS5tZK8JkJdodsOBaKce4XyX4nc5iEv/AYFiYOWnuXn61+hfx8Oowqu+nQhklZJcQ3Fu5XT0XR2bqTSwytv2sIU3Bf/XzY584xnkznlLcDbZnajw+WG3XByZWY5Qt9gRe50YhZdjMWWT407kW2NXltRdfzelrUWkZ+sCYf4ofD/tBLhg2wInjNyVrl6ExDoi1Px/oEzKp+xpdzClggVmvCBNTb02HnVLZunfduPe5R1wD33hhqD4e4CtYSX0Aranfi7DXDMNWSA/eAt/IP6hy7NQ9OsH5+Yu2PJ5gbbiu3H/LI88gThGwZNpAHYjWN0WrLSRXF341aHGGg2i1lorzAJS37Pc4/JiJ7xphVayzKk1DWwCBGfYdz2XrtYRpNS2tIABwz73xI95jB+JHgodlK+ZwmqA/uIUDOxxwFTfBoeoKo3159Tu/YX7RrIguzOUFJJzcez3WXYLrSApMzGAzu7Qqk5D4h1x2375tHEFCdmSg83gCULUEor5ptNwJNqqimvgSeWybFYO4zg8geXeAPJrjxGuPs6f3OizltTxydUpVifjK9QvXIEcIkpTp7Yng0N/AoXCEn/DvTKYVvonBRw/R3WSXdlm6cUkUiby1aIxeGHcZm5AqPEkNJ+Y9De736D5fTvuwePY2ny7hlLfgQZ+ziG5r5IfiDVowFqKZ+w0SavkTocMDhYT8IXECZAoKxwF2Np+DusR0LtsNUS1CgGwuKIycEK+v8alGtWF3gl+kOnJfubOGYr07qFi37TC/WDgRSWjqFI/pm1GDZBTeE1IFz5voCd0N3PrjsihXE+TjgFWrnOXsUjcxpiPvb0o=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d07541-ce9c-4995-081a-08db4032afe7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 17:31:04.9977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JioxwLT3Zn20JvYe4wtvsITZyIZWKnp84LxsWwVotpv/cmal+XRzmSODKJPL5bRQi/OW0RMPpdzbYHzpDL1NPglDH6JirX14ltdj9jBCYVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5902

On 18/04/2023 12:10 pm, Andrew Cooper wrote:
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index 36a07ef77eae..98529215ddec 100644
> @@ -5879,6 +5880,75 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>      return modify_xen_mappings(s, e, _PAGE_NONE);
>  }
>  
> +/*
> + * Similar to modify_xen_mappings(), but used by the alternatives and
> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
> + * responsibility of the caller, and *MUST* not be introduced here.
> + *
> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
> + * Must be called with present flags, and over present mappings.
> + * Must be called on leaf page boundaries, i.e. s and e must not be in the
> + * middle of a superpage.
> + */
> +void init_or_livepatch modify_xen_mappings_lite(
> +    unsigned long s, unsigned long e, unsigned int _nf)
> +{
> +    unsigned long v = s, fm, nf;
> +
> +    /* Set of valid PTE bits which may be altered. */
> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
> +    fm = put_pte_flags(FLAGS_MASK);
> +    nf = put_pte_flags(_nf & FLAGS_MASK);
> +#undef FLAGS_MASK
> +
> +    ASSERT(nf & _PAGE_PRESENT);
> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
> +
> +    while ( v < e )
> +    {
> +        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
> +        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
> +        unsigned int l2f = l2e_get_flags(l2e);
> +
> +        ASSERT(l2f & _PAGE_PRESENT);
> +
> +        if ( l2e_get_flags(l2e) & _PAGE_PSE )
> +        {
> +            ASSERT(l1_table_offset(v) == 0);
> +            ASSERT(e - v >= (1UL << L2_PAGETABLE_SHIFT));

On second thoughts, no.  This has just triggered in my final sanity
testing before pushing.

Currently debugging.

~Andrew

