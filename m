Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2D37A0644
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 15:40:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602288.938765 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmZo-0000T0-Td; Thu, 14 Sep 2023 13:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602288.938765; Thu, 14 Sep 2023 13:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgmZo-0000QN-Q8; Thu, 14 Sep 2023 13:40:12 +0000
Received: by outflank-mailman (input) for mailman id 602288;
 Thu, 14 Sep 2023 13:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J3lF=E6=citrix.com=prvs=61487cf85=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qgmZn-0000P4-By
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 13:40:11 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 367dc04f-5304-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 15:40:07 +0200 (CEST)
Received: from mail-bn8nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Sep 2023 09:39:57 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5322.namprd03.prod.outlook.com (2603:10b6:5:247::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.19; Thu, 14 Sep
 2023 13:39:55 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::cfc3:da2b:a0d3:e744%4]) with mapi id 15.20.6792.020; Thu, 14 Sep 2023
 13:39:55 +0000
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
X-Inumbo-ID: 367dc04f-5304-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1694698807;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=Jc5Vc1kWjSsJnO2N2aM7UUELEvWD6lvqsQ1PX/CbBPc=;
  b=Y2H+/gvR28OT3gXFcIwbRJANj8jHwKodCnE6iNgHgUgP/P0xWZIkKGLb
   XkVroxGzs/Pe9DOS3QIKOL/TzZWZdjtWybHokVM/laDkhoIP5sFSCJ8Ch
   m58VCUDkrW6QEv/OiXOpCoel1nELxk6DtMS5KM1Eehc2Nn9iLivEH4Zbg
   A=;
X-CSE-ConnectionGUID: cQ7BxeSgTO6LrkvA/1Rf1w==
X-CSE-MsgGUID: n7H0zcVfToi5gPgqGHy/NQ==
X-IronPort-RemoteIP: 104.47.55.173
X-IronPort-MID: 121898609
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:8cJ4cqok1A+qvcTTlrZONDdpDtZeBmIlZBIvgKrLsJaIsI4StFCzt
 garIBmAO/rYNmH1KdEga9u+oUIEvMLUyYBkGwI6/C0zQn4V85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbOCYmYpA1Y8FE/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKq04GlwUmAWP6gR5wePziVNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADs0MTqTitm5/JXlbvNvmO1kdfPlZZxK7xmMzRmBZRonabbqZvyQoPV+jHI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeWraYWOEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdhLROzoqKY76LGV7mpMKEUEXmW1nf6410GGVMtwC
 11T3BN7+MDe82TuFLERRSaQonSJoxodUNp4CPAh5UeGza+8yxmdLngJSHhGctNOnNQxQTEs2
 3eOh97vDydj9rqPRhq15rqS6D+/JyURBWsDfjMfCxsI5cH5p4M+hQ6JScxseJNZlfXwEDD0h
 jqM/C43guxJidZRjvrgu1fanziru57FCBYv4RnaVX6k6QU/Y5O5Y4uv6h7Q6vMowJulc2Rtd
 UMsw6C2hN3ix7nXzERhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:owzrRKGM5fWaEHqDpLqE18eALOsnbusQ8zAXPo5KOGVom62j5r
 iTdZEgvyMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzRHZATBjTVQ3+xO/DBPys6Vuds=
X-Talos-CUID: =?us-ascii?q?9a23=3A+S++i2pnYdyQyhBSrV7m6nDmUcscLVfNwUzfH2j?=
 =?us-ascii?q?mLXxqVpTSEGWeobwxxg=3D=3D?=
X-Talos-MUID: 9a23:F/G+EwQT6lypn1fdRXTq2xE6JsxW7ZipCR0CqZoflOmVcgpJbmI=
X-IronPort-AV: E=Sophos;i="6.02,146,1688443200"; 
   d="scan'208";a="121898609"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcwKgIoP7VuVu8lCLIHKDuoJ74zBSudXM58UUIpSZAqZTR4QesWFuK2flX3PsJovfKo+9I/Qp8ca+qDXKIdA38te+IgXaJc/tU1go4Ccd2YZX94G9bpHi+CHvrnzZLDnzfE/EKxY7z2gQtat0TDDBnmYFtto6keMWXrrk8jT4CkKq7EnR1+tiN+nUhitmoQT2Wyjwy8UXxxaQXDUjN0LnbP08H6wqcV/lNZX3096vWlaCpqHCk1f3s+VrwfEJncMRmlRauTMCitJBIjSTzryY6gkguLzhwuhSZC4d1uUdoYROEwrG0I/YgLbhuGLnT9csunf94a3mvWP1ib0yg/d0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTdcss+sCU2l/qJ8aznC7WhZQ7oNyMt7z3sJdla2ll0=;
 b=AML36a2nvsbhmcOQ/lwVQ5hREfG8/Y6Ruy8MSiksd6vTDa6MoaG97dVgapimfl+vZGmh42OdBeri2M36CATPretktAaIe2VsDsSXiU8vJoGzmJrMpZ3JA0cYiAZCAnitVuqKkR1AFLPKxnyaoRDp7RR94tpnOQnxSu2ujKc2acXPX5y7o9OkAaTqv76ixxjfb2ZFKiLU42Rqum41Nkkkjej0jl5Bg8SWj2YNM9WoaPIbakkwadCX/iTf+RQ4xGyJqiJrdVGbCkBjN7R4ndlWrN75/563AWVBPpGt7Me79fQicu9xhLd86S/a3ZwBbIJN6jEPCmoNlTaSWUCufaCZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTdcss+sCU2l/qJ8aznC7WhZQ7oNyMt7z3sJdla2ll0=;
 b=NmC7X/7ULV6R4s4e2+poam4jOE21/KWw9tj7oj/oMX0v7D49fjKugd4vEgfucYYgfyyuuWFLhC4EJj6ITZeWNB4gBExW8VVxZwRoNlIHcj9H6eVjrea2kwck+D6kanbBeJ+SOHj6nLOA2uo8viUXss1iZng+Xxxvmd7L/J0VTac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 14 Sep 2023 15:39:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	=?utf-8?Q?Sol=C3=A8ne?= Rapenne <solene@openbsd.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/amd: do not expose HWCR.TscFreqSel to guests
Message-ID: <ZQMNJfmoOmIIp7GD@MacBook-MacBook-Pro-de-Roger.local>
References: <20230913145220.11334-1-roger.pau@citrix.com>
 <e2fe16de-cb08-4a0b-adfe-95da6c86ea16@suse.com>
 <ZQL-p3LJX7WfwCtC@MacBook-MacBook-Pro-de-Roger.local>
 <e8859459-53dd-aa02-b776-ba4052c7ffff@suse.com>
 <ZQMDOwGGNJVnjFEm@MacBook-MacBook-Pro-de-Roger.local>
 <8b791d74-636e-6f79-2918-4bceda1905e0@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b791d74-636e-6f79-2918-4bceda1905e0@suse.com>
X-ClientProxiedBy: LO2P265CA0467.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::23) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 298809b6-45a3-450c-b270-08dbb5281472
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xGaGMibR1Qie+fkVQ3ndjAzvqWBvQ7ZSdfvuBTxyDRc4PHEtjnWTHiITNra5y9hmAtXXPTHf1wof98Igq8ImeJr2uVI0z2gvyc51dEiTFsc5XuCWVULvkVJ3QyxX2MGWZ8m1kF5NcdCrZwpba53Y0+eLqsdhf4We0/P/udidxDl4gXtvIEKc1r9GNaWWZI9hhHo208zSGewAAIbSbh4U1uc2+woBfG+PfOqZjAtuDrTpw3DlWLD9nQCuwVIoKCzy0v0a8uSe+nyAGjV+3yxQCcQPVmt+nBy3UxMPosKaZ3lotxSbaf8swas9Bv05HsfnH5lhRuz9+QXymQOhu7gpuUdyN3uEytaTEJmkBj1xkfh2nRKolN4860r4BL7qAftIJFneZMjpvo/ixNe96rJfRJcFBU5VKX5RSnp0HYQ/PVAQZmR3jjK5civ8ivX+maekr6AvnpYsJb27nhHoEPt1fHiayfeY5WIjPy1G7jLVhUq1YvbrYCVyCAsISyerw0iZPDnucljXWRqqZbzXJgrNsqak4HjnZBnqbLbPj2QU0evRPY2DhASkghFrU1+LdnKr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(376002)(39860400002)(346002)(136003)(1800799009)(451199024)(186009)(53546011)(26005)(6512007)(6506007)(9686003)(478600001)(6486002)(6666004)(83380400001)(5660300002)(2906002)(8936002)(4326008)(66556008)(6916009)(66946007)(54906003)(66476007)(41300700001)(316002)(8676002)(86362001)(38100700002)(82960400001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGJXTTlya0dYbHdHZEpLOGs4azRqUXlwMXF4Q1JpckkxSVpJVmlqV2JEL3oy?=
 =?utf-8?B?aU9yNGVLT3dhOTY2M3ZSUitRYlNtMTVUOXJkUm40WjJ3S2VYaTF6UmhNU1k2?=
 =?utf-8?B?YXZOTTNOSFhzbHVUMFVnZnVwalRzREE5elFhQ0tERm1qVWV0R1lwWU15S3Uy?=
 =?utf-8?B?eHBDbWRjMUxyUG9tTnJkaUZmNVpqUmFNMmNNTXhvMEpkNjRoNDhXMGh5bmU3?=
 =?utf-8?B?WjRGSlExSGFRQzNJaWprOEpqWTJUQm51b1hpOW1zZFJTRU05WmE0QjFLR3NP?=
 =?utf-8?B?dUR6NU9oc0JERTAvbGJhMDNjcUNDTk5CUkxPQmVWb3g0OGV6MTJ4R0pzb1F4?=
 =?utf-8?B?bzhoN0FXV2o4OW15MThjZ1U0a05MY3g5di9GWWR4L0VacDVjL2ZqaUZPWFBS?=
 =?utf-8?B?cG91NTJ5MEs2ZGZXRGgybFUyM0ZqcDJibTdueDlQVkNjTVMrTi82UTNhRVl2?=
 =?utf-8?B?ancwOUs4MkVrdFYzVVV3ZytmQ3NiRThCdW1pc1VXL0dSTDE0ZU5acTFFbVJJ?=
 =?utf-8?B?OGpYa0p4WEhrTlBBV1dxT29ZZ2pJd1pIRXFjYzhSRXNJUnJqYWczZHFFRHJT?=
 =?utf-8?B?L1N4cmJUZy9GNzRBTVZkSjdqdjNrWG1uV1F4dnhGalVXZVJWNkFuYUFvMkZ2?=
 =?utf-8?B?WE1NWndpUzdKUzlFajdMNHV4YzBIeWRLQzA3M0lPTlJJOWc1d2FtNE1MQVp5?=
 =?utf-8?B?a3RISXZFaElabUdiNTl2aDVDTE5VS3ZSZytmWGJZTDhNSG43WDhnQ01nMUp2?=
 =?utf-8?B?VkdIOEhDOE1HTWhaVmhXWWJkY3ZwbDF2MjRLemlpaVBwWml0YTYzRjRJSGpx?=
 =?utf-8?B?QUx2enREQjF6ZUxHOG5tOWM1RGRWRnhBaTNqSjh4M3hlSEl6L2xZTUswRmJi?=
 =?utf-8?B?OVNnL3pxaTB5TWdYbVR4M2VpenJDbXhVRHFtOHFZU0FDY3pXUWhsdVJnZkR5?=
 =?utf-8?B?T1pRbVpNc1hNUkNhaVpZZ3N3MVczSnhOVmxnQkgwTVpyRitqUEhWWkdHNE5r?=
 =?utf-8?B?elNhb3VGb1NvcGNUOTVOUGllZHRSWk9JNWVQTXIzbkQ0TVc5WW56RGZNZ3hx?=
 =?utf-8?B?K2l3eElDSHVNalZVRG9RdWlHMFcwSWZQTXk4RjVpRHQ4aDdhdlp5UUhFVDRV?=
 =?utf-8?B?cklzdFZqVzRoUlQwb2V4VlpjWlRtUitpdEpaL2taTnRLb0tRb2FwNzZURTNX?=
 =?utf-8?B?ODZQa2wzODZpT1NJMHBWSVJZaHJLcG5MTWdVdUFwcUgxOThVaFlhSm85WkQ3?=
 =?utf-8?B?YUZqenU3dGJRWjJXZFdxN2RLU1dTTlRHRU1WYXJ2UVlqZzBTOUlIL3Fia254?=
 =?utf-8?B?THJ3TGYvSnJlRnBKRVdNRnR0aXBEU2hwaDhKYVlMNUcycVpWK0VwVU13T25r?=
 =?utf-8?B?N3UzNTZEY2paa2xEWXRpVGlCWldFVWJZLzM2R0p6NnRLejV6QzJOVVcyVDl5?=
 =?utf-8?B?NWVSaFFXK3hEYnFrMitpUFB2TXU3Q0xHVDRmZ01Fc0ZhWldtMnEwQjZWeXEy?=
 =?utf-8?B?L0xGYmhMVlVzTXBmemJGa0Q3QVE5UmtUMWlmek5xdUxKSlBLYUZhRlNXL0gv?=
 =?utf-8?B?UDlkTmxJbk1aK3MxZ1NXUVZoUEZYTGtVdXR2Y1ZSTzhBTndnRERvc2s2NVlV?=
 =?utf-8?B?Tkl3UldZL2d6ZXhFdkk4aVA0VmRacWZVZzMxOFZBU1VlblhtaHdkWmY5R3dD?=
 =?utf-8?B?bGMzQ3Vld2lJQUNyZFg5NzRqTXBUQ3VPMk56c1lzeER3RURxT3p5NjMwM1FU?=
 =?utf-8?B?cTJNOHVSL2FSK0g0SjlTRFJOZmd4aGhLUWtiMHhFekptbHBEaDNZUFFBRWtW?=
 =?utf-8?B?dE40YWRQR29SQUNvNzNWTW1RQzRLZU0zQ3pwVzZUNXcvL0p2Qm0vaUtFSlJY?=
 =?utf-8?B?L3RVb0x0NjlDaDBBalVTdzRQM2Z3a0k1Y0RHeEpjMlMyeXN4dGZWdmd2bEN3?=
 =?utf-8?B?NUp4WWVtbm1hSjZqKzlZMVB1S2RXdFBzbFZJanBEZGdTUFhwOUxQVitpT09I?=
 =?utf-8?B?UUVNM25ZcmJnaWNvOVVpZVNYcStMWGJyOGhZR0VacDZVajd5WThFMEkvcGN3?=
 =?utf-8?B?Q0FNSVFaczFoRUtpYk9uSHdUM1RleWRoN2tldDNuN3dVYzhDRGttNEV3ZjNr?=
 =?utf-8?B?VnZWSloyc29QRk9KWGFyZmd3L1JYbTdsN2l5Q2JvWFd0dUtLdCt3NmcwRFJ3?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9FTdkooK1mNdtjHeM+ijyOOVIK/mj6g6W1T7+SGN5SnjsD+b6FYTRnb8P6kPoPDsYhD3fw9Jewzd1IvgmEK78rK1ulk+CwRt98MWTe53jodTw001LEuNOuv/XgMWVD/wTG72sgmSZvB7rZfTJ+5JLg3qr/mi074h/Ts7AXwAwj1LS3Bj532QZxG4q7Dvw1NZrkEMwkgrSz8hK4Ty1SxTI+aXXRXyITZssaz2igRfdbTQOGFNAZQU5W5mwlWJTKqq1rrLAgPXmCacDzfhaaxNGRRpDhfLWN2Wz/bbaJbwLV4/x/XhpRFamX/nEOqPVGGwt/z0/5uVePjf/L/9w0uXT1jlYhCNLP2GroI+9IdhvfwkiszYWyYi5gRIJIeYAZZxd/zSrVlODZeeZrlN9XqtRj4On5Wpjzn9JiAPTOGgcXrVf/uDWzhSLujD7VQXQAw2oZoa5rmDTokndFx1odPzG1jGh6tm9lnpXLXBlgg0rCTzp2wIUiNo4l+sAuwJuJM+wxk57LHJs7f9UPZlIvf+lWPQpNpyFre+PwzOjEG+UZ5BkYwPjDDXQiWh2i5bqdTBDoL6rOsDAAFt33NQpHyJvSVrkJ9fIlWYxC3oXwwLFPgEmaJkE/x34EDY9PD3eXTyNeYJSgXv4u7fWTA1sLZ+Z83sY2yGGIZzERTh0+k6ev5+ouOa+AkdOKLRABwZK1K22eozoJzEcN1AaoQvr0iZ2gKBbYnhzHwJQ6BW8RqBKQPlj5a0nlZ1GkZ5LjO/mFoeVrUrMhkwpumLtaDUulBoAqT5AU8sQ5AaZnJldLzN3o9N65058pjdMp5cn1ZfydJELQj2bUg39948CtgDf4SIK8snsAwKM/24xbb9KR7R2dw=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 298809b6-45a3-450c-b270-08dbb5281472
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 13:39:55.1425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tPw63MgYGputkin1h5ic2wC3ofRWWNRGG1S7/5zOMVEOBJiclAL+0JfXZCw+2QY6xV1ENFq60Tq32amwQTsWeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5322

On Thu, Sep 14, 2023 at 03:16:40PM +0200, Jan Beulich wrote:
> On 14.09.2023 14:57, Roger Pau Monné wrote:
> > On Thu, Sep 14, 2023 at 02:49:45PM +0200, Jan Beulich wrote:
> >> On 14.09.2023 14:37, Roger Pau Monné wrote:
> >>> On Thu, Sep 14, 2023 at 07:52:33AM +0200, Jan Beulich wrote:
> >>>> On 13.09.2023 16:52, Roger Pau Monne wrote:
> >>>>> OpenBSD 7.3 will unconditionally access HWCR if the TSC is reported as
> >>>>> Invariant, and it will then attempt to also unconditionally access PSTATE0 if
> >>>>> HWCR.TscFreqSel is set (currently the case on Xen).
> >>>>>
> >>>>> The relation between HWCR.TscFreqSel and PSTATE0 is not clearly written down in
> >>>>> the PPR, but it's natural for OSes to attempt to fetch the P0 frequency if the
> >>>>> TSC increments at the P0 frequency.
> >>>>>
> >>>>> Exposing PSTATEn (PSTATE0 at least) with all zeroes is not a suitable solution
> >>>>> because the PstateEn bit is read-write, and OSes could legitimately attempt to
> >>>>> set PstateEn=1 which Xen couldn't handle.
> >>>>>
> >>>>> In order to fix expose an empty HWCR, which is an architectural MSR and so must
> >>>>> be accessible.
> >>>>>
> >>>>> Note it was not safe to expose the TscFreqSel bit because it is not
> >>>>> architectural, and could change meaning between models.
> >>>>
> >>>> This imo wants (or even needs) extending to address the aspect of then
> >>>> exposing, on newer families, a r/o bit with the wrong value.
> >>>
> >>> We could always be exposing bits with the wrong values on newer
> >>> (unreleased?) families, I'm not sure why it needs explicit mentioning
> >>> here.
> >>
> >> Hmm, yes, that's one way to look at things. Yet exposing plain zero is
> >> pretty clearly not within spec here,
> > 
> > As I understand it, the fact that HWCR.TscFreqSel is read-only doesn't
> > exclude the possibility of it changing using other means (iow: we
> > should consider that a write to a different register could have the
> > side effect of toggling the bit).
> > 
> > The PPR I'm reading doesn't mention that the bit must be 1, just that
> > it's 1 on reset and read-only.
> 
> Sure; the PPR being incomplete doesn't help here. My interpretation, based
> on the bit having been r/w in earlier families, is that AMD wanted to retain
> its meaning without allowing it to be configurable anymore. Possibly a sign
> of it remaining so going forward.

What about:

"Note it was not safe to expose the TscFreqSel bit because it is not
architectural, and could change meaning between models.  Since HWCR
contains both architectural and non-architectural bits, going forward
care must be taken to assert the exposed value is correct on newer
CPU families."

Thanks, Roger.

