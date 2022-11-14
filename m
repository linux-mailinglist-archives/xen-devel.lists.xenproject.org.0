Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D21F628110
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 14:17:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443368.697899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouZJg-0001Lo-Mz; Mon, 14 Nov 2022 13:16:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443368.697899; Mon, 14 Nov 2022 13:16:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouZJg-0001JP-K7; Mon, 14 Nov 2022 13:16:00 +0000
Received: by outflank-mailman (input) for mailman id 443368;
 Mon, 14 Nov 2022 13:16:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JxMm=3O=citrix.com=prvs=310c1b068=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ouZJg-0001JJ-1Q
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 13:16:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78fc5141-641e-11ed-91b6-6bf2151ebd3b;
 Mon, 14 Nov 2022 14:15:58 +0100 (CET)
Received: from mail-bn8nam04lp2044.outbound.protection.outlook.com (HELO
 NAM04-BN8-obe.outbound.protection.outlook.com) ([104.47.74.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Nov 2022 08:15:54 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB5773.namprd03.prod.outlook.com (2603:10b6:a03:2db::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Mon, 14 Nov
 2022 13:15:52 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::2393:22c1:7766:5caa%5]) with mapi id 15.20.5813.016; Mon, 14 Nov 2022
 13:15:51 +0000
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
X-Inumbo-ID: 78fc5141-641e-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1668431758;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=9ZYr6+Lo9tDzaLW4FGiKqdSBkBqqUuYei0FlhK+kDG4=;
  b=XuTFo6YUS5kMu3yF7RxUsYxqFfyfqkWFniRXsSBl63EdiwxbKIbNsqNZ
   siClHsrW1nUBEXWuGQwHgRqllEppNTIrx4IdJSqVb+bGk97AFb4x2i8k4
   IhHTzfLwHqKIjQXBxvIM66xOcMeTrG8aGTRkeiMvQ/Jd9Gy/vSrMLHvBc
   E=;
X-IronPort-RemoteIP: 104.47.74.44
X-IronPort-MID: 84784970
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:bgIWiKMDphtRlS7vrR1RlsFynXyQoLVcMsEvi/4bfWQNrUpz1zYDy
 GJLW2zUP/rYazGhc99zbo208UxTu5eBmIM1Ggto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5wBmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vRHHnB85
 /0/EzoqfxGGhO6/x7SyQ8A506zPLOGzVG8ekldJ6GmFSNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+vZxvzS7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLVri382r6QxUsXXqpPU6Ce2aRqpGTMx3QDBUUxaHflgPq23xvWt9V3b
 hZ8FjAVhao4+VGvT9L9dwalu3PCtRkZM/JwHusg+Ueyw6zbyw+DAy4PSTspQMQvqcseVTEsk
 FiTkLvBGjhHoLCTD3WH+d+8ry60fy4cLmYAZCoNZQoD/9Tn5oo0i3rnTdt9Eajzktz8Hxnxx
 SyHqG41gLB7pd4G0eC38E7Khxqop4PVVUgl6wPPRGWn4whlIom/aOSVBUPz6P9BKMOTSAmHt
 X1cx8yGtrhSUdeKiTCHR/gLEPex/fGZPTbAgFlpWZ486zCq/H3ldodViN1jGHpU3g8/UWeBS
 CfuVcl5vfe/4FPCgXdLXr+M
IronPort-HdrOrdr: A9a23:TcoCoq/RqmPxiZ/jeC1uk+G/dr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81nOdkTN9VLXJOlA1G8z44/HbnpPvZhALQzYh9Qm1lDutrJLqDhSC2R8acjVXhZMv63
 LMnQDV7riq96jT8G6Q60bjq7Bt3PfxwNpKA8KBzuATNzXXkw6tIKhxRrGYuzgxgee3rHInis
 PFrRsMN9l6r1nRYma2ix3w3BSI6kdl11bSjXujxVfzq83wQzw3T+JHmIJiaxPcr24tpst13q
 5n13+Q88M/N2KKoA3No/zzEz16nEu9pnQv1cYVknxkSIMbLJtct5YW8k95GIoJWAj69IckOu
 9zC9y03ocfTXqqK1Ti+kV/yt2lWXo+Wj+AX0g5o8SQlwNbmXhopnFosPA3rzMlztYQWpNE7+
 PLPuBDj7dVVPIbaqp7GaMoXda3Inale2OMDEuiZXDcUI0XMXPErJD6pJ8v4vuxRZAOxJwu3L
 zcTVJjs3IocU6GM7zB4HRyyGGPfIyBZ0Wu9ikHjKIJ/4EUBYCbfhFrcWpe0/dJ+J4kc4nms/
 XaAuMiPxasFxqoJW9z5XyPZ3BjEwhhbCQrgKdLZ7uvmLO9FmS4jJ2sTN/jYJzQLB0DZkTTRl
 M+YRmbHrQz0qnsYA61vCTs
X-IronPort-AV: E=Sophos;i="5.96,161,1665460800"; 
   d="scan'208";a="84784970"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Grn4UxJG8L7goysYETDVxSJfYy3LGc81DAiFSHF7wU12yQBeXz3rjaaUc8+yjXGVb/WdUyIj9v611MQln2kB/Ar7l2ayG4A6tmSU3jp/bD4jaHL6wEFlJDbZG99r1h/87/+RnIaa6V5JGmXcCe3XYgxTOhUJzlfc5/nydENsC7S5dAIQwZrfnj5yWD1ayVTKuYLF/TatNwxWybHKTZElpOK7MhP2br5AsAveSoOSc9zVozCSuCycQLdJmZtAlntYdqQBAIXhRBo2px09/wmGOvV6zNrIYgVoBBNzjWma5MfflHtLwzC3KgBDzsjtr7GvcAQ37pbUhQvRgbdtWaedGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9S3OqI265xwlmtbBZgc0vnpQZ4HAew4TlLAgf6CY90k=;
 b=H2JuPoOrdlnl4YX5UnMyL6t5wH4z2QzTEMf9UkgkNYBtZ4uOCGZlMxnbeCm0Rdxvc+s3h6LUudHbzgZybJRw7mitk1reaulbt4I96yYxEG7+OAK0Gh+1P5rzJl+kYGU5kVk0aUNgbGPizNfCHPodKt0/erPgfIvVCaDS9sDTRDw3qnu9osYVVGXAoQYL8lcD23qdGc8g2kMMCfJOFNvJjCN8EmdKLtBATnAQDz+mXkN4K2d45jbdWLxtDQQKPdMg0V2oFBl20t6hSLP3ObZzcDe6D8zhKA1Jk9fCZ2i62q4HEKKFqnwFOfM9oZqNkgl8bX9fTRuM8ZEfvHGuxt504Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9S3OqI265xwlmtbBZgc0vnpQZ4HAew4TlLAgf6CY90k=;
 b=YubJZel3cLL4coYmZRBWygO9jX0QzmyA3YNiCdSLNpodCs6+aJMuuZuJCGq17C8fVmJL2W7Q1yMGSh9ShOoc5+9OIjpLxweDNNp8VvPuQhr2MHOFdQLHutii03NTC5scnqYBajXvrGIAx4H2/op+hFS5T0btne+LeNoDhzUiIlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 14 Nov 2022 14:15:46 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Henry.Wang@arm.com" <Henry.Wang@arm.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH for-4.17 v2] hvm/apic: repurpose the reporting of the
 APIC assist options
Message-ID: <Y3I/gpTiHeEupOJC@Air-de-Roger>
References: <20221104161815.38007-1-roger.pau@citrix.com>
 <69841767-ccc4-5eeb-6e9c-d59dfb197ea5@citrix.com>
 <8e52a065-0141-f75c-03e8-e9ceb18a0aa1@suse.com>
 <4d0edf44-bb7c-85d9-0890-79c999428ef6@citrix.com>
 <1051eec8-8074-39e8-299d-a540d12bc997@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1051eec8-8074-39e8-299d-a540d12bc997@citrix.com>
X-ClientProxiedBy: LO4P265CA0167.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::12) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB5773:EE_
X-MS-Office365-Filtering-Correlation-Id: 43619981-8254-4c6a-7a2c-08dac6425a80
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y2DlkdPfOPPYRaDUqVftcLmo0OtxuCf0LM8w88HQh9+2UtcJnZNZjbWyxlNybXkEy3eCSd9VbWpnCjZBDEYEye3ujrD3QwcCkOtXzrUBPQuB+97PNTgTee7hhhLjUlA/qGFejeWvzXDb/3EKarP0ck3DtgbU1MgUMpdaaxb7xa7SZmYIiXTQJ7MnSzxxRA5mt08Q1DxDspq7cHTRKI/Te380w5rLljumyR9vYFeDsLwKllm1VMY35fRCkFC1Q8Wb1TVuaT3Pq51Xtq5bOhMpvbe1ePLXlpudVZdDPps+zSTJWbIPHj/1r99Wnf3a1hOrHYRsB1aNLgdlioEZ5eznZ4BMgP2jhPoJFE2sqbXxM8uK7WyCUNTy4ax8ccief3JzlLurePCs6BC6EVFxMnqgv/WNkhm/HzLfPpaQXYKMVs1d2m0KtX7Iof9LpPElf3YQeuOKkBuMSSVcvA2LIvCPfdvvfXfr3Tc2dC8BVxiivQ4RWzJqu+MR5jQi2467zttlXVeEnjS0ehYToEoNjr24uLLnnRU9EgPLz0tBCPFDFnZg2ZPvinkKKA/jGuITP94QFKJ80TlziAu7KDWJcWgTvS1znjvo9Nu0LoMVnNyTE9mmc7kthYCxNjikQg3ipc4piyeIDlOzkRI28vKqMt1RuXTTF/KjSE5MESty4xXaTaJ6yK2WDAiLx7XFAdq7MvoKZEOyERiTRQSeqrR2e4JuTQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199015)(6512007)(9686003)(26005)(54906003)(6636002)(186003)(66556008)(66476007)(8676002)(85182001)(66946007)(2906002)(316002)(4326008)(86362001)(82960400001)(6666004)(33716001)(6506007)(6486002)(83380400001)(5660300002)(478600001)(41300700001)(53546011)(8936002)(6862004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXg5aDgwNDlIQWFWZkJtMm1rbWsrcGI1RHpERWhEVjlNeVBuYlMwbWJwSmJl?=
 =?utf-8?B?LzVvaUttYlBURzdBNWNnOGk2VDNGOHhFeFlESTBmU3VrL0RyeDhrYlpzVVJP?=
 =?utf-8?B?dnVBNElad2FOeEJtWDhpdGFKTHMwSDFuS2tvWHg4V09sRGlRRzlSZ2tUMXhT?=
 =?utf-8?B?Z20rR2ovQWZBWkFuV2RDeTFPREQ2S21mWFAyaFl1bk1IRnlTSWVsT3JFaEZW?=
 =?utf-8?B?T1l1SXJoVVVoOFFya2NyWms4WFhpMmVsTStkcExNZnI4Y1lDVXFaRjBkdVhl?=
 =?utf-8?B?cEExMnJOWTFjZEQ4VTRUU1dyaU1sckVpYWZlNEU1MmR3cWxnZzloRjAyc1dn?=
 =?utf-8?B?ajJLN2lIdXVqNUlzNTRncHp1TlRTc2dyR2lsZ3BheUMzaDNmZndBVm5Xb1ky?=
 =?utf-8?B?OUtBazlIVit6THZGbjlkOTVYR3FsK1RtN092bE1TZmZwenZDTHZyZmpsWE8y?=
 =?utf-8?B?K2ZCNG9qQWlUYnhqVEN4SXA0QWU4NE1DOXk2dXhSZDVvTlhvNmdpc29XY040?=
 =?utf-8?B?aXl2V3lla1g3azVueCtIeEx1RlN0dXJjYWI0UkFjbk44YU0vTlZnWHlENzBS?=
 =?utf-8?B?VG1WaDU3ZWFiU21xdXNFWlJwSVF5aDA0VVVNb1VBeStEVUtjUnlLOE5QM0p4?=
 =?utf-8?B?c3EvWVZKcXBBMlRaNVNDaTBTV1JvOHYxeXY2Q3phNmhQNWxnam9TZUhDQi9G?=
 =?utf-8?B?UXlvV0NHQTU0Nk1RdThvR0NGRHVVTTdXL0lBcnFpaGk0WlJBU0FqczlNVThw?=
 =?utf-8?B?dG81RmpBNzFoL3g2QnQzazFDckUxWUx4V2lZT3NIWkxwQjBGcnJXa0Y0SEdx?=
 =?utf-8?B?SE1rc0xhN01RWDFNbTgvZkVQSFoyc051azZDUVpxYUEvRFhaSWhxc244UXV0?=
 =?utf-8?B?UmlaaTBWZzR2VXp5Wkx0ZzBsNThIVzczQkxlQnR2UnY3K29CMG1yZHNuWkR4?=
 =?utf-8?B?Qm9EcC9aTFlKN05UZVl6UEZiNm5ibU9SMnNuYVFJUVdzZXlqVzZOUlVlbGhz?=
 =?utf-8?B?RkdCY0V0OTJROUtXeDVJSGpjVnBZbVc0b2xBYXRqSjdWU0RBMGNlZFB0MFVD?=
 =?utf-8?B?Z1lFa3BFOFZVT3BlejBsbmRrOXJjYWRJRHdPRHVRcFNzaDZsTmt2V05LTlNC?=
 =?utf-8?B?TGpEUkVSTWtTRDBJeVE4SE5rMFY5ZGw1dTNRenlQNm9JelR2eDBYNXpjSEl4?=
 =?utf-8?B?T2owWi94Rm9CdStDa3NwSFNPeUZmVEZWYjJwNXdESStEYVdSUGNOV2RnNUVh?=
 =?utf-8?B?TUtXZzNzV0RyeDlJUXZJcldDUXkrU3FUcUlMNStaOE4yaVQ2UWQ0bmUreVlp?=
 =?utf-8?B?ckl4QnJwK25VeldYYmZXZTFBM3g5dUw5NDNFZGVuVXozQUdSTmFvL2wrVDlp?=
 =?utf-8?B?V044eHk0b2ZDUWV4T1ZnbnUzd09oT2Z2YUc4Q3hzOENhbklkbDU2aUNQU0NF?=
 =?utf-8?B?aG9IVTF3cFBnZTltN2w2ZEFsZnczVlJlaUpnd0kvZTRLeWFxNC9YLzVOcGZV?=
 =?utf-8?B?dzVqMzA0TGJNZkxzTHlMZ1FDVnlmaHFjL1lWU3QxS1pZdUZTRURLWU03U2NU?=
 =?utf-8?B?Y0VrcThTdStaVTRZa0V0RGRlc2FWWkZueVNtWTkwSlNseSt6V2xBQ1ZrZk9l?=
 =?utf-8?B?QXgvNHpzaE9YODllSnk3M2RBb1JsbDgxNllSN2FSQUo1bXVMQUNZMUlhQ2lQ?=
 =?utf-8?B?NTVLZEM2bDVKT1dtenREWG52eTFYSXk4NjM2cDlpNWsxQ2RqQmhDU1dEVUNL?=
 =?utf-8?B?TUxsV3FXTm15Vmo2bHVWTW5vYWJqT1ltTFZwaHJaRk1TeklzeU9FeDIvK1JQ?=
 =?utf-8?B?Y2RuSXdFLy9tSGx4c3p0OXFZSGFQOTZOL2ViUHR4YUxMdDB2b3dlWHovY1N6?=
 =?utf-8?B?M2pkOEhxeHVjRVJCY0NaOFFpS0tRQ1Y4ejdaZm5yWjY0Z0QvSWVHV2htdGU4?=
 =?utf-8?B?b1l3Q2FLOFNTSDhPWjc2MmJRZXBpdWxsb3pnN1g3Mk00RUliUlNMUFFkRE9I?=
 =?utf-8?B?Q3A5b2NDZXcrSVJQa2ZYQVVYN0dXQUNLZnd2TWZYT0JGaGRjYS8ycmU1RHpp?=
 =?utf-8?B?bE1CVHMweHVUTHByOG44dWhsNmFuNnRwTHhuSEt6YTFuQTJoNE1lcWNLL3oz?=
 =?utf-8?Q?rKg3qYBf5JEbdQ2xAeP0mU6WQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qt18qbMk06qZL9kEa9F/CniaiqMXpfXw127Ehwf4EyDVg70TCZCH6JAjvQxNf45CNeNseYyhXW+KusOiInjk8qpe1JbBFgMMB1dq+811UhS0LYDsfy+pFxLuPzRxuvMGsqUqj2+dzzXng/TvcUJo23CoVXWCZ8iSsX+FHrzoNFzefRO3OXoalU62i6XI0pSEeRVX2FAhX2+lN4HeTGP/6n4cg/a3Y1Atp3GSNCBKSJKc8ELUZ1x9BziXeYUP6pDSvb9TEkOKu0VSW25hnVUPhKs1P0kUgMZXUToifVAF9CVuqeHCvs9EEHAMhWz1fnQvUg9QGuTzN+Q/VIGfNaFjfpOfEdrTZ3Ph2YYu/shHEhEZ/x4Wdx0X1czqaxolpTS4fHakXymYthKctvhwy5VggDgEQNEyAYLuvTmWmojb0ZUwROsROmpgQBTD7r2cNEYGdMoiOW3QRe6GY+FhoFuKdpn0IwmypWoaY9aPj0j+3vAkd+P4OljRpMlNfZO87+/rB1VCadOqjTNP+O14xrLGHism5Ux3VUI8tQyyz0EqalQAG9ieHFS1lXw9Knv5WwKEbtueBFNlkqOLT5/9CmBIbjQZyUyGzp9elob5Czz4VBTD4w9xmpWpRSxS2ZDfr5P1krj/s7+XXRcDbgc1fyh/pUMm4lIvQeqF4+474nmleoS4WypomeupNLyptGedDQn6NZYYr9P+n+Yz7N2O7AYvwlb1Kf4rJrPlNjkfECQ0wHx2yqxPuGDlfkQtWhFYSfskt8piBHRBfvlNhvvqnsbeBw1nLdgZoKnU2VomWC+ytXpgBo1lZSIE4NOmOUTtb3TDBt2INkWAJjYk1pciyVkqWdx/7grmgu3TUuT8wn9F7U8Cm1g5wo4qnuJJuxHWDyzBcCY+/MQyqdWWYCy/0DIYKdFx3DZE462HaJp1T9lL6qs=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43619981-8254-4c6a-7a2c-08dac6425a80
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 13:15:51.8450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sTa0pNehX/Pa1iKQskKuknqXtyy9lNIx8QmHrj2HX4whxyTqTZu2IuwB1MXvvcDvExiXwMgY8D2mEomdrBJPiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5773

On Fri, Nov 11, 2022 at 05:47:02PM +0000, Andrew Cooper wrote:
> On 11/11/2022 17:35, Andrew Cooper wrote:
> > On 11/11/2022 07:45, Jan Beulich wrote:
> >> On 10.11.2022 23:47, Andrew Cooper wrote:
> >>> On 04/11/2022 16:18, Roger Pau Monne wrote:
> >>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
> >>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> >>>> @@ -197,7 +197,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
> >>>>          res->a = CPUID4A_RELAX_TIMER_INT;
> >>>>          if ( viridian_feature_mask(d) & HVMPV_hcall_remote_tlb_flush )
> >>>>              res->a |= CPUID4A_HCALL_REMOTE_TLB_FLUSH;
> >>>> -        if ( !cpu_has_vmx_apic_reg_virt )
> >>>> +        if ( !has_assisted_xapic(d) )
> >>>>              res->a |= CPUID4A_MSR_BASED_APIC;
> >>> This check is broken before and after.  It needs to be keyed on
> >>> virtualised interrupt delivery, not register acceleration.
> >> To me this connection you suggest looks entirely unobvious, so would
> >> you mind expanding as to why you're thinking so? The hint to the guest
> >> here is related to how it would best access certain registers (aiui),
> >> which to me looks orthogonal to how interrupt delivery works.
> > I refer you again to the diagram.  (For everyone else on xen-devel, I
> > put this together when fixing XSA-412 because Intel's APIC acceleration
> > controls are entirely unintuitive.)
> >
> > It is "virtual interrupt delivery" which controls EOI/ICR acceleration,
> > and not "apic register virtualisation".  There's a decade worth of
> > hardware where this logic is an anti-optimsiation, by telling windows to
> > use a VMExit-ing mechanism even when microcode would have avoided the
> > VMExit.
> >
> > It is not by accident that "virtual interrupt delivery", introduced in
> > IvyBridge, is exactly the missing registers (on top of "use TPR Shadow"
> > which is even older) to make windows performance less bad.
> 
> Sorry, sent too early.
> 
> This also firmly highlights why the API/ABI is broken. 

I'm not seeing how you are making this connection: the context here is
strictly about a Viridian hint which Xen has been wrongly reporting,
but has nothing to do with the APIC assist API/ABI stuff.  It was
wrong before the introduction of APIC assist, and it's also wrong
after.

Also see my other reply - I'm dubious whether this hint is useful for
any Windows version that supports x2APIC (which seems to be >= Windows
Server 2008), because we expose x2APIC to guests regardless of whether
the underlying platform APIC supports such mode.

Thanks, Roger.

