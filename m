Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A37733570
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 18:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550309.859307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAC0H-0006dw-6K; Fri, 16 Jun 2023 16:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550309.859307; Fri, 16 Jun 2023 16:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qAC0H-0006bT-2w; Fri, 16 Jun 2023 16:08:49 +0000
Received: by outflank-mailman (input) for mailman id 550309;
 Fri, 16 Jun 2023 16:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4sU=CE=citrix.com=prvs=524b4a1dd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qAC0F-0006bN-Gj
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 16:08:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1015ac96-0c60-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 18:08:43 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Jun 2023 12:08:36 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5052.namprd03.prod.outlook.com (2603:10b6:5:1f2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 16:08:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6500.029; Fri, 16 Jun 2023
 16:08:30 +0000
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
X-Inumbo-ID: 1015ac96-0c60-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686931724;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XcrUm6zFccncdK8W5vds6X7HaE8nBIvjaXpviGg7bmM=;
  b=VQ7yVFbDtT8rUHAD1c4oT8Yk7AfFw+DugnuSDoWC1LyiNgeggLqxya5g
   a092uquhEUoQZSaSKu4+6fFq4qtRgy96JNQ0ybCleKlp27wJRnW3jv9X7
   tbDDhD1NGAd0KHQco0hoC2bEFHpi+dhYz3tFDcsYLZXD61oa4TasWq8Zk
   k=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 111836639
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Ptk+rqDCbyCDuhVW//riw5YqxClBgxIJ4kV8jS/XYbTApG5w0zNWm
 GFNW2CHOP2KZGvxKt5waY+woR4PuJHdn4NmQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1B4ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwxv5IKlFo9
 6EiBmoVczqnuOKUxuj8Vbw57igjBJGD0II3nFhFlGicJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI9exuvTm7IA9ZidABNPL8fNCQSNoTtUGfv
 m/cpEzyAw0ANczZwj2Amp6prraWxHOgBtxJRdVU8NZ0slGa+mAfVScwdn+hn6f+g3KzC91Af
 hl8Fi0G6PJaGFaQZt75VhOQqXOcsBoRHdZde8U15QaXxaeS7xufAmEcZjVFb8Eq8sQxQFQC1
 FWEgtfoDjxHq6CORDSW8bL8hSO/P20ZIHEPYQcATBAZ+J/zrYcrlBXNQ91/VqmvgbXdGz7qx
 CuRhDMjnLhVhskOv5hX5njCijOo45LPHgg841yOWnr/t10oIom4e4av9F7Xq+5aK5qURUWAu
 35CnNWC6OcJDteGkynlrPgxIYxFLs2taFX06WOD1bF6n9hx0xZPpbxt3Qw=
IronPort-HdrOrdr: A9a23:BOaNX6hxdnf5JJBByFekvpHzunBQXh4ji2hC6mlwRA09TyX5ra
 2TdZUgpHrJYVMqMk3I9uruBEDtex3hHP1OkOss1NWZPDUO0VHARO1fBOPZqAEIcBeOldK1u5
 0AT0B/YueAd2STj6zBkXSF+wBL+qj6zEiq792usEuEVWtRGsVdB58SMHfiLqVxLjM2YqYRJd
 6nyedsgSGvQngTZtTTPAh/YwCSz+e78q4PeHQ9dmca1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3A33V0lGiiINyAAPkXUlXT0fAHMDJuTmXi50f2IRK?=
 =?us-ascii?q?CJzxxVZexdl+y/vkjjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3ATv+DYgw2cRJ8n0GmcfU+KL66QAOaqLqcBEkxnZl?=
 =?us-ascii?q?bge+nETZOZXCUsDnnTZByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,247,1681185600"; 
   d="scan'208";a="111836639"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PyjkNa/JFSh5+pIW6IEFvXBrLctq8VaDki/JU4Q5xltaTPpV+AtKBEkTGhKa14imFv9X3zgoAeIKobUw70ST8fT3ApAvAF9DeeS6y/4rR6AReb/O4ZN10LkDRZ71tFX1SQZNIHne1aNF/qXhWmivqf+7PugjFmwtqqT0uHicj64StZCkAH7DzjWKzWmwPOTGiP2LnSwaEaMSug1EK+jRoUYqWu4uWL4+xh3nnvZn8yVHEBAwh5iRGrhPb2sok5Ni8TZJ46eSVZuZFY030JjSTHSBSU96zkBPtoEIeKP0EY959CzTncoyx5Jqyt5Q26VC7LjdPyeKUSUb89RYvaSg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcrUm6zFccncdK8W5vds6X7HaE8nBIvjaXpviGg7bmM=;
 b=N7iDi7Zk9nvN1rOIwERmMo5XvH0vilt+JIgcysicdAHquU9YB8fqmR0oqpsRPnWclTy0U5AR9WKBLhBCEfh3T7c/IZP7GJkKsRtTiAEtEMYhIHfCd3NrTgsxAEBilgLQVTFvMgyMsHYkQ+UBGcpXnXbn7jaREjmiwLtn5CFIhgPf505atFKHeHHKeBnT2NDU7bMd0eY8KAA+9Wc6DTvVBmRMsqz6mNIuvDkt8JT9FiucXbXT+2maF0d1zzzN9gl9qbbbpMAWr4zwxslehzLdTAZz+FsfZh0cqk3Tr0R725HVC9PraSS04QnJ7A9vYAuTvkwRjBbQRUttALiHLYXI/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcrUm6zFccncdK8W5vds6X7HaE8nBIvjaXpviGg7bmM=;
 b=VAbkxxNqsuP8cTCCLjnJoSQaCecR23wVgyH/hLxazF/vVyug7GWAk4m9+T2tYl0nmE1r7sIOAXdCUX8UzmROvmkAjEF6uF5tW9PEBTSpGhasv14bLixFpq1ANhL7v29Fzth7Qh/u4M+6A1eZCDN1xYJ6tBs1THlItKe6cOBXN2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <cab85336-c49f-8993-89ae-a7132c46c0d6@citrix.com>
Date: Fri, 16 Jun 2023 17:08:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xentrace buffer size, maxcpus and online cpus
Content-Language: en-GB
To: Olaf Hering <olaf@aepfle.de>, George Dunlap <george.dunlap@cloud.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>
References: <20230530095859.60a3e4ea.olaf@aepfle.de>
 <578d341d-0c54-de64-73e7-1dfc7e5d7584@suse.com>
 <20230530220613.4c4da5cc.olaf@aepfle.de>
 <1b99e58d-338c-02af-eeab-00d691337d00@suse.com>
 <20230616134708.6b3c6964.olaf@aepfle.de>
 <b50a8e23-f3fc-bdb9-5a76-780d2a4a7aa3@suse.com>
 <CA+zSX=Y6yrkA0RM0FAM7Cjv2f-UP8FvMUsoRXbMAxP+fNNC79g@mail.gmail.com>
 <20230616173717.3f264151.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230616173717.3f264151.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0256.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5052:EE_
X-MS-Office365-Filtering-Correlation-Id: 28f6d725-924d-41b7-9fb0-08db6e83ece5
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m2AZj0T4Q4g4zkAerSbfU/aFv9QmiT6cjXPfAQUk1CjmXuJHHBj3MTB9qoGF1/LgwQF7mkAoIyM+uW0GByyKtmBVrkm0EDG6YPRsEscHIqsWug3tRAkFjcu2QU50Vr4OMpm2XXH/ZoNewvJ9cpFLLWl/QHfgNZSqzUvGnCD+EseuD9LWB6vupG75lw58t+tnwx4mGcC37E7jiw0oYlvSqtzTP3xVcNsKHFzKA/8uJ7ybYZwaFfYsZeUX2tvZyWY34mekTJJfgO10N1cVqZlKVCJ/gfnvWFaAPWMGFa2lvJ+ftlwckukHopF0Dkp63e5tayOPIW0S03GGgbVwnTg49ZC50saxRhlJpnSEyXb915PSq7yVQtShaYrHZ4ylCFsEfhTSMeg3tEu8FeqZWrDJq3g4XwaiYKPvQwBwaXif+8ngnqf6qb5/2z6Du8rrRmam/3eWhJM3KKmKEqXbpWhR4QdpajeWVVju8e0DlYXQjJxusbGtOwsBf9kdIUP6HkpWy9h7jYGwGiJoHwPLbjKmGOd2Rku6uAhV/DP7RgbCM/2Ml3ebLxmqAUHUADgR2u0duillE5yEeUgUM9aFyVxYyDTDHWzLzJSBaGUwkX6ACZnommwuSITkuqxYWXsRG+25dki38PZAz/roU5QE4hCUGQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(451199021)(38100700002)(2616005)(82960400001)(83380400001)(2906002)(36756003)(8936002)(41300700001)(6486002)(8676002)(316002)(6666004)(5660300002)(110136005)(54906003)(31686004)(4326008)(66556008)(66946007)(478600001)(66476007)(86362001)(53546011)(6506007)(186003)(107886003)(6512007)(31696002)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UExFajA1M3pRRjg2dndNTlFOOVpaSnZuZXV0S3piSVgwSFdKNHNxc25TWm5o?=
 =?utf-8?B?eHZFQ3JidXRkUC9OeWhBN1hiNXpaYm9CeWtNRDlJbHBFOExnTG80S3EwaCtx?=
 =?utf-8?B?QjlYaEFQL0V0RURZYUlRYXl5dGx3QkkxSkJhVThQV3BRNFpIZW0wZ3RnMnhE?=
 =?utf-8?B?Z1U5ZENyRExXMjhFM2VIVEVia2VxTStsaVZBaytGa3I4K0xhNDRlVlh6b1RP?=
 =?utf-8?B?Y3dQK3NiQVpwanBYS1paREw1ZEx4NEtES3A5djYzeWZIcCtVMDF0ZDBSUXMv?=
 =?utf-8?B?aGorTG5VMUhDOWFTWU05L2Fkb3g3RDJTb281ZnN5VVlxRFpSQ0c1b0o0ZFMx?=
 =?utf-8?B?Q0duUElZVCs1cVNoMlcwWUkxUUtIMVdqTGViWEhHQ2s3djNJZHQ4M2FIdzhD?=
 =?utf-8?B?eXRzRnZSc1dMa01iNkZob3NwV0VLUUxjSURMNzZqd1V3OFdaeHRqVm9XVFVo?=
 =?utf-8?B?MXhhdVhmU1JGc3BGNDdja1RpWTl4N0RGYWRJQitSUDZkOEkydXA0N3d4RVZm?=
 =?utf-8?B?VTJlbkJaOGpoOXovYkV2NVJaSU1nMGtjd1hMUU9RRVBndUcrenBXQnZmMzJO?=
 =?utf-8?B?em5FeWVTR3VmQkZmcXNaY25vbWZLSGx3WDMvQ0hLaFV0WEFlWGVhWi9HbVE0?=
 =?utf-8?B?MUR1NHg2RkhPSkFsNjZkQnE5cUJLSTJnNWlGL2tNS1o4bGgrRVg2SlBRZWI3?=
 =?utf-8?B?dnN4MTZBSkt1Q2lucExweDExd3pFL1Q3Y29jMGZYdEZZbkxITEVBb0dsdUFF?=
 =?utf-8?B?NHJZZGVXMG0wOHJnbEZWS0JGTUt6WlZDRURINHF0VEhNVzlYOGlGcXlzWlFX?=
 =?utf-8?B?S0w3Ui9rc1RsQ005ZmprcW53d2xSTnUzRGd3bzhUTjFCOUIzT0xuL1hNb3VN?=
 =?utf-8?B?REZwTEZOS3FjbGlVYUZJdTgxQ0g3TTU1dUZ0R1NMYVNRd3J4ZllhalVqMEpj?=
 =?utf-8?B?UTg4aHZwaWRaQU5VQ2VyOHJwbXJTeEI3OHNTNC9NYjc4VFlFNDgrMXdFZWtW?=
 =?utf-8?B?aXh3T1NNY2JhaUtiemFJdm1lem9GWlhZTnBhRlA0THJNdENiWE9HbXJiMUVh?=
 =?utf-8?B?WXlzTGNja0dhNmlRT05jL25oWHZPTklIb2xxRHVWbUJ1ZFhwUmJCTG9WQitu?=
 =?utf-8?B?am5KSUt0VHNydWtBSFVCdkUxcFQyZHR3ZmUvZzQ4NElzRWVnQmZlUnVnbWZ6?=
 =?utf-8?B?Rnc5SCt0R0gwVGk4QzFiRTFrak9nbVdoTnFFcENTdExwZFZuRzNqekxFUDhS?=
 =?utf-8?B?QW11aXgzeldRRDN3Q2dMeG1KSFg3RjJ6T0tqRXBjRmhoKzErNVNRL3lqejhl?=
 =?utf-8?B?TERZUU9vTWxZRm1qU2VHeDZUT2IvaUt2WWY0a2htbVNPVVFnNGhTN0hmSGhv?=
 =?utf-8?B?SVZqTXBMMTR3bU1YdjJIVlVHWTJZR2hsTWZ1ZlBTR0VMTHRaeXdrVDI1UlN1?=
 =?utf-8?B?VjkramZDaU1lS05ESmhPREE1bDdrZDhhVGkzb0ErODVYM0lVK2pUWUMwUnVR?=
 =?utf-8?B?dVExNElmWWlPc1JjMFNUeFZFU2Ixa2o2KzRkUEZUdmJNYmRzajVrMW5scFEx?=
 =?utf-8?B?VVN0TjUvZk1PaDFiYlhwU0FzVlpSdm9OR3hoalcxWjV5Y05xd2JLWm5Bd1U1?=
 =?utf-8?B?RCthMTFmSG5PSUd0STZleXM4SHk4Sis2NXpoMXNFbmxaT0pDZ1d2RVAvNGpq?=
 =?utf-8?B?WTZVelhhbTZsNEpFUW5jamErVzNVSmtpK1JhRHFpWlFyeFVGaTVGOGJ5UTNL?=
 =?utf-8?B?MDF1WCtyTlFPS1BLbUhWOWtNRFRYaTZkRGoyeUpDN3FyNkRxU0Z3Q0k3VlRj?=
 =?utf-8?B?NzM0aWpralJRL3pYQmIvNFZTaWZLZzhrbEFrR0dLOVZxY1Q3MXZqb0ZlZGRW?=
 =?utf-8?B?cU1XbzdGcXUwNzNNOFBjUkNUdlc5ZHRqYWh6d3NFS2FnWU4vT1NWY0ZYbXE4?=
 =?utf-8?B?UnBtSlZuOUQrN3d3Q1Ztdi9BZ2V5b0xibTFwYTJpYk5La2x2K3JlbEhzTit4?=
 =?utf-8?B?ODdiSTJ0UGppM2lZYTRVTy9VR01meFJFQ25qS3h6UVc4SjBHcTdhUElOZkpa?=
 =?utf-8?B?SWpWazdBQnlkQ29rSWd3Vk1yMXc0b29GQ1VVdzZBZzNaaW50QTMxOWhOdG5y?=
 =?utf-8?B?KzJjNVhzQVIrSUJLcnp3NnpaYjd0VGRUSDZKZU1ERlF3U0dOeVlJY091SVVl?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YlzNWfs2VkAwLpVhyyfTHcBFosG9E8w0H70gi/WLUbGlLhqAgCNXsBleYyXQmuPJcbj33zokY87M636j0BBf71bNrSTLlunQWeCpzfgNFD2XFUatmdyVsDHrkC98fVVnMTPM61t3M9deznXRc1KrMlfCzBQqnwhMzoy0gwduFVviyEjHgkUwtcXhwpqeE4TKIVx8aOvWedsEpZmDq4PqFv9kIGA00eNPneyMqwyzonC/S/dLaD2KSndpJACo50b+ffldkXfMWRkloIiqCtjSrt/LCmnNG4NSYZ89aQtkZ1Z0EKJqsKHqkj/Mi8MFuEMUea5h2Oveko8hwiswUlxh/RNQB922/OVO18w1XBUcO6zPjyoFC4v68TlzV2utQThIvf5d9yJAoOwbHE7UWpQU9YV0QOeKmV5dJL1GP96OQoYBj7w6mi76aXYE0pqee/1nRa+ihT5iQ7s9TDT+nml3SDqchLx8T/FRCFWiEKeGwXjcESOIq9FUDa+hMPuIPmGyIR7TNQhP3WeWX3A6A3XQJTgZNLuBBB6sD28jh+UMnocuHFTlKd1WyuHeYTPFo+VpKUCTDoRfKSDHAeOqidfmdvJWjKSJNA/AyR7iheKXUiOFL/PLxir2Zgas98UTD7hRxxbt86OkXEfz+5GuXXLZShOyig78/+Ya56utD45RET/tUKBpmB6BvgymeildbAh+4KUMSPvmNbe0JX34Y7lq4Cx2nL6faltxheICcdDUwaNBMFsEETJ+2mN6JGKW0NLUFai18AaFbC70e542FNWrVHctq8Nl57nElUmiXR0x4jlTbTRU3XdwvQKXU6QU0M7xoCzgJOxCTICddHvaRxX5sKBCM/EGS/ulgUqmfs3IXrE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28f6d725-924d-41b7-9fb0-08db6e83ece5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 16:08:30.0731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcZfOr7dL6Qxr6HcJcVXkKXKCLY9cH/oye2b8KJ/3R+kOSVhDKQQpysIimQcujMBu4GTWDKNsFEJy6JjUQl+0hTDmaOaVOWRuO6k6sZo7MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5052

On 16/06/2023 4:37 pm, Olaf Hering wrote:
> Fri, 16 Jun 2023 15:22:24 +0100 George Dunlap <george.dunlap@cloud.com>:
>
>> I agree; the clear implication is that with smt=0, you might have
>> num_online_cpus() return 4, but cpuids that look like {1, 3, 5, 7}; so you
>> need the trace buffer array to be of size 8.
> I see. Apparently some remapping is required to map a cpuid to an index
> into the trace buffer metadata.

The xentrace mapping interface is horrible, and makes a lot of
assumptions which date from the early PV-only days.

If you want to improve things, we've got all the building blocks now for
a much more sane interface.

XENMEM_acquire_resource is a new mapping interface with far more sane
semantics which, amongst other things, will work in PVH guests too.

If we specify a new mapping space of type xentrace, using cpu id's as
the sub-index space (see vmtrace as an example), then you'll remove that
entire opencoded mechanism of passing mfns around, as well as reducing
the number of unstable hypercalls that the xentrace infrastructure uses.

I can talk you through it further if you feel up to tackling this.

~Andrew

