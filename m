Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF49C65EA5A
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jan 2023 13:04:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.471867.731901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOz5-0000dC-2A; Thu, 05 Jan 2023 12:04:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 471867.731901; Thu, 05 Jan 2023 12:04:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDOz4-0000aG-UE; Thu, 05 Jan 2023 12:04:34 +0000
Received: by outflank-mailman (input) for mailman id 471867;
 Thu, 05 Jan 2023 12:04:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+KT=5C=citrix.com=prvs=36272ec6f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pDOz2-0000GR-KM
 for xen-devel@lists.xenproject.org; Thu, 05 Jan 2023 12:04:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b70698f-8cf1-11ed-91b6-6bf2151ebd3b;
 Thu, 05 Jan 2023 13:04:31 +0100 (CET)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jan 2023 07:04:28 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5295.namprd03.prod.outlook.com (2603:10b6:208:1e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 12:04:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::c679:226f:52fa:4c19%6]) with mapi id 15.20.5944.019; Thu, 5 Jan 2023
 12:04:21 +0000
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
X-Inumbo-ID: 1b70698f-8cf1-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1672920271;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=3ykmsFdGGmg1YLJtWbMR4ZNI61TRCFhCcyqvlK2ivpU=;
  b=ePd4g3rOTR8305ZimjzVPXebsbEdlPvVJ4Td49KNzhDejW7T8GzB8trL
   KpG0UZl1vEocGGu3rgorV8lkyVFa07mZit+UTjXjx2HyVltXXVn0agnol
   gLCfgYjCH+ZVwtaQ15O2YqL2jDUlyiks7VbbkG2elG5/dNELX9MZRiCiq
   Q=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 91298111
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9zD4u6PZFhHXXs3vrR2XlsFynXyQoLVcMsEvi/4bfWQNrUp20TEOm
 jAdWTiBO62NZWunKY12O4m//B9V7ZTUmt9kGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo42tB5gFmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t1dBltTp
 fBEEmxOQTatosaYg7a/W8A506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaDpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eexHmqCNtLTdVU8NZQsniX7EI2OCE6VFCCvfCHqFPnZ45Af
 hl8Fi0G6PJaGFaQZtv3UgC8oXWElgUBQNcWGOo/gCmdx6yR7wuHC2wsSj9adMdgpMIwXSYt1
 FKCg5XuHzMHmKKRYWKQ8PGTtzzaESoIKW4PYwcUQA1D5MPsyLzflTrKR9dnVaSz3tv8HGipx
 yjQ9XZuwbIOkcQMyqO3u0jdhC6hrYTISQhz4RjLWmWi7UVyY4vNi5GU1GU3JM1odO6xJmRtd
 lBd8yRCxIji1a2wqRE=
IronPort-HdrOrdr: A9a23:vXrQQqxj75MPpseGR4QcKrPwIr1zdoMgy1knxilNoH1uHvBw8v
 rEoB1173DJYVoqNk3I++rhBEDwexLhHPdOiOF6UItKNzOW21dAQrsSiLfK8nnNHDD/6/4Y9Y
 oISdkbNDQoNykZsfrH
X-IronPort-AV: E=Sophos;i="5.96,302,1665460800"; 
   d="scan'208";a="91298111"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbTn9W3gGCGXeF2CksLIfEvd1pRokFjoUfqXABsKPJ9P/AY/757YKX9M6iP80NEmyByWoGSnAin0iDCANe7IA4EkzLBWRlPrXzKqIfNrih+eq/iDIIC7q6Noma/i6YbcUBpj9EfRUy58zfzNfAFEsgab3ifXozluOMbWqWn5sqjn78xKMr9CgDuusFAPs9l1qN1Wtf2qAa6Z5uckRbQhVSOALu8gF1rMcVDJJKcHB0TVr2gdq7yfpZRBHluAXwJw9ihGT5jr/NsrDgyf2zMaN69+U8IRcawDeockCtInRKGMAyPoS+y7UOwMYfpEFMVIMJO9FtKl016ppqwZNF/F2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3ykmsFdGGmg1YLJtWbMR4ZNI61TRCFhCcyqvlK2ivpU=;
 b=HcvZ0mdCL5isDDdSPtIZj4DBTMZyPV7/HiOoDr6J8EQR6DPnUjXYwAXJGM6BUDHo+6ovLCFliV+wB4+NeViXq0ebbMr2eNd7uSCHFtQnl/4Wq9oNw7eBcTPvA/esuBYCbQuKAE9Bdw2Iz5M2pAFlStNXZPBhqBlKG1NgxR7jjyLpuCpHPegMou4KaWbY7QMpnHBSw5Kmre4BO6WWk2s7AgvxoWaNcXdbx6QvyAa5ytkUhHqS4mTEgP2SaYOyXIQOJETorkHzl1d/gGsIm6qPoG5xkKdBOOogIR9AtmG2OdlgcfKKnttilMBVFvip5Mlf86KQecSz1mAZ1Npn+NoMVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3ykmsFdGGmg1YLJtWbMR4ZNI61TRCFhCcyqvlK2ivpU=;
 b=MKRJMOXdtGKbOxW+TDzV7g6MpXmIl0ZmEJrJ34O44q+9cbcfJLVkFn+7uwzhiwEqwqvXtnbTqFQeElIay/TnLSdwSdmNFttaZJsLZrKS2q+Zb+f4AVn/RlieC/lRwA8cJkxIaOxlXpX83GJA+UVUcwxY+nTvRZreJurQ/aHHI00=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] x86: idle domains don't have a domain-page mapcache
Thread-Topic: [PATCH] x86: idle domains don't have a domain-page mapcache
Thread-Index: AQHZIPY76jcWuuXMREKwR1wL4WEG2q6PucOA
Date: Thu, 5 Jan 2023 12:04:21 +0000
Message-ID: <330dce2f-ffa4-2f6b-a481-cac53e996255@citrix.com>
References: <139bab3a-fd3e-fec2-b7b4-f63dd9f9439a@suse.com>
In-Reply-To: <139bab3a-fd3e-fec2-b7b4-f63dd9f9439a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR03MB3623:EE_|MN2PR03MB5295:EE_
x-ms-office365-filtering-correlation-id: 7ce8f36c-5f51-4642-fc8c-08daef14fb28
x-ld-processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 yhHvV0+XBIxKkIv9HBgo10+6WtH5CSmUEnL6/n62VlehdvPOhZB9pmfNLWflvLyqE1UaoWLeL6xOdVgh4I0EaJK5KAGoXEMFUEu5Y+vgJ3mQ5JrGG/UIZHMrWVujafVZl6GODD2nUZLFEdSaOLXvo5OsaNZnthHbRbeh1/KlgnWPpzqME0GCogjYN+mxuHXfkYTropurmtjE28jQAC/DGEjULlM3AILGhWObkAvWywToqTcUCV4b2Hf04zHi5cj/W3nYZcoB5qcwh9UuZ9G6xuiidqLNHhpa7pb6lnHIgVrjTXhQmaXEqjSuPn5NM3DLxrCp/YVNGiFDpLbaDfAIdRU+J//7lhbWU1wHwztiQfm/ZJ1blRzjZg3zlBBepSaIbK5qKDVSRZ6TLgm4tdo+5VoSPd/g1R5i36DmjTHuJODlGFzLGksXy2Mvm3Stzq9RWNvLV+c6ABm0dsROo4FzrhqrmH10vSSgVAdPTS+yK6e404xKkkC+xNrdavLD4oPMJegnEnt3DX7+HLnEXFqHucHK32WCeZlnWzoS2DbgTUxVp59CfXegLAkXBXKj1JE3f3ZevElfkO620Yn46x3+lvu5LLpLzEclWzamXhWVGmqZ9zosOxWFrgtapIzcsqENJGJ/YBkFnctVJAzDlobvlyiahq+9weP6bahvRQzGTuc+RkU7ZXdXoQBSvNpp4kwaWL66/gtedDbpV03deAN0GzVqZqAn99lRxaxphtDEbsYZ6pBFg3R8V+qT/uxJQWIoOz9vy5LQyE5qt8obTebIrw==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199015)(64756008)(66476007)(66446008)(76116006)(2616005)(66946007)(66556008)(36756003)(8676002)(91956017)(41300700001)(38070700005)(4326008)(54906003)(316002)(31696002)(2906002)(82960400001)(86362001)(5660300002)(110136005)(38100700002)(83380400001)(31686004)(122000001)(6486002)(8936002)(53546011)(478600001)(71200400001)(6512007)(186003)(26005)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MFREWW9qdlBCWmhOSVBEbzJNeXhKR0hMck1CTjFkL3ZoSUZDUC9UYUxwa25J?=
 =?utf-8?B?MGMybEloRm0xTDN5UzhZRlhCdEYzRW1RWThOdCtwcG45eVNQdE85QnFycGhz?=
 =?utf-8?B?WFMxRENoL0JpaytwdmZUTVVHRVVTbHYyY0FwcFBDUVQ3OWNRczVoelVqV2pq?=
 =?utf-8?B?anpONytRZ1dIV1JqV2NmV24rL2Y5OEtRUFVxMHZsdUJLa1M0OURuT3YzY21a?=
 =?utf-8?B?bnVVWnN0Q1dzaWVBZXBWSXBhYjRkWTBIdEUvVGs0cmVsSXUvN2V6a0Q2bFZJ?=
 =?utf-8?B?bGg0bVhMUTBWc3RvQ2ZnbzFqRW5vRTI3ZHQxcGpqSlBMYzRKMW9xLzRhVzhG?=
 =?utf-8?B?RDlZYlp1WS9hOGZYSnp3RFFkdUgvWnBZdE0wQ2lzUzh4NTNQamFYYlMrZUd3?=
 =?utf-8?B?MEdtbzg4V3RFUkdkQ0U4VENVQmFXTmpEWGdhRDAydEtOTmhXaldGYUo1NmVy?=
 =?utf-8?B?L3E5NHBtK0c5RTB6OElYYUV0NDA1WTlCT1M1WDAyNDluTlVNTFZmd0JQQ0t2?=
 =?utf-8?B?aUhvbWMwQmpXZStIN0ovQ01ZaFlTYVBSblcwUnVuek1QTGRpdWhKdkdYZWNX?=
 =?utf-8?B?bmNmN1dVcnh5eGtlaWRrQythMTN5bU5DeWdkZzR6WS9WckRkeDhRRjhDaGxI?=
 =?utf-8?B?RkdVUnR2OVRPTS9MMFdWNUVCaDBnM2g1aVNMM1RmOWNrazFNaGUwdWRNNHh1?=
 =?utf-8?B?ajdHbzlFWEo5SVV6SEN2NHJXaE1xZXdOVmVFMS9vQ0F2UzNTdnhFcVNTNkVu?=
 =?utf-8?B?ZWttbXpNMGVydWxaTmY0ODhDY3Vud29RZmJ6VmhQSFBEYkxBeVlhWmNnZkJW?=
 =?utf-8?B?RkZtWnE0SGxnMkg0QUxQN05Jck5OdGRXVFUxM3E4TEhPWUVad1BYSGhoNVUz?=
 =?utf-8?B?Y2hYN2p6VDlId1N3cWJremtaUEE0RGJPV0hhOWg3TzE3dzNkaXlvK0tJandh?=
 =?utf-8?B?aUFOcDlRbjhyVGgyVHJrWW56aDQxTmd5ODUzeWdaZDl3RXZyZDdMaTE5S20r?=
 =?utf-8?B?TUluUmZNNC84SWdia1dwWU9vMW1MZDMvc1RmWGpPOWx2MVZ0YlE4Q2hFYnhQ?=
 =?utf-8?B?eXNYbUFIUjB1WStyVVp6d25rMi9Qdk1zYVlrN1ZWbDJFd2pMNWgrS21rQ1pC?=
 =?utf-8?B?RE9YMzB4TWoyL0N1UWt3ckZhV2xPaVVYZmtOS2EzeENLOExwaXg4R1NEMUxP?=
 =?utf-8?B?Zm81Y1FFUS9WZWI4S2pmd3kySm80eHF0VGtDbjNWOHRoRTQ4ZnJpbTRGUDVk?=
 =?utf-8?B?aDVJN0I5eDVjNWFLWXAwMkdMYk4vY3ZXZkpCYjRHSG5zS3hmU25NY051aWEx?=
 =?utf-8?B?ZVlNU1M5aVlJZUJDSkhtSkZOd0VnTnAxVFlCR293NXRYUnloYzNMM2tQVXF1?=
 =?utf-8?B?bENKNjRQR2hoNEtKbElYVWlGQmV3WmlQTmhtVS9Ram9oMlA0MWVUNFdaczJp?=
 =?utf-8?B?SjhuQ2t4WWNrRHh3UUR2OXdxSnJNZGFzblZCb0JZVEtKVHFzSSt1R0tTYnNi?=
 =?utf-8?B?eFZhZ25mODV4Y0ZHclJzRDl6VlluZENKZktMVWtkM0c0VkxTYk53Q0htcldO?=
 =?utf-8?B?WXZONkRjZDI5dTNGWEZCTlAyRkJXVytyamRORGJQOE0veTF2OEIyNmVTVUQ0?=
 =?utf-8?B?UndyV1FMd083cnpJL0pZRWI5Z09BaXBHWmkzQU83MkhVYnpLeEZ5TklPNnJJ?=
 =?utf-8?B?YU5EeXdveHFSMjNkRDlCMXhUdm9icmRGbE16bmpNcjg2NDFJM1lzWW1Wbkxj?=
 =?utf-8?B?UTFxNHl5Y05mdHdJTUZEa2pOdFl2dWI2bmQ0WEtKOUphL2ZsU1VWTDljaC9l?=
 =?utf-8?B?SHBaeFVTUHlDNEJSV1NJUXR3Tm10dlhmOW50WDdaaG5DSTlsWC8veXJScnk1?=
 =?utf-8?B?d3dHbVBiSStXN2syWDgyd3l3VlJHZGVkamlkY215MGl6eUl5QytOOGFpcXVT?=
 =?utf-8?B?ZFpQQkMvYTNQeG5nVG1qSkYxSm9LQ0l2MDFGaHZjbGZ1cE45SWh5Wk9BU05l?=
 =?utf-8?B?a0lKbHdmT1VmNE1ZSU9PRDNUUnM0amxtQ1VDdFUxNEp6REpEaEJSUmhnUWVS?=
 =?utf-8?B?ZEYvVitHS3JzZFlNVm9ldW4rVjJEZWdUSURNL3BYdlRQbmNvOWtUTW1YcWRP?=
 =?utf-8?Q?HikDexVlQaH+IIVRnr/U4gB/V?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD07377E309CC24EBCB4290E5A9D58A9@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	T6d27e3FhXyIDIMKCduoDVv73J+MEKkZTDhndCzJpN+QEIqLVlk+OquL9EFTp7rkcgiZOYx7CRoNZ3c5QevDX7lA5Mnme16vYb0X8tMALattAUA+VhXh3njsG1W6DBqbW2LHpVr2nSNW4R8E7QeKcpdPf14YixsAO5g9La69DO6P6JoniO/4qpq//dRwvPCiBY8zC7Kofj5/dZXV29g/1XcRexScSB7T2psIzfk5rvjD9lwCTXcVRmBGmuzTx1wGQ1EEpTtkAGuq7GLn/pdod/GrRuYVxKPtdg3ba6xIz5s67LdGY6MlfEehceF50tUQENWXdSoyjIcXaIOqSkPW3m26vwquCpD7yZfOeQV8KdWhhoX9aR4IMlmr0f7eMW7rp9kH6+2NwqpmubX2rlPolzxxn68dgB7vhI+ikkVBEQfkS9s5KmEN4rLrp1bpl3L6fX4iTXYgC8qIe0ZQciE/6M1SHXpCh1b2zbsOB9P5y1MCyftFxd82cnG8qnYYE/JKA0wPc57TT8g/N5NGgx24AQil+EyYeT9ww/CTITaej4mqY46HKIcrWV+4XfOVeOuAnp0NqPNCXpJSdhIeLlTXuFMtFa9uMl9UJ+9mBrYHNFh+OWoHNd83oaTXkDiSylSeNKkRorFp3eX6fuXYCHpROXLOA80mAZPyrhN9I8HOhlP2RxLKkeKg2zNcO1gkJEbF66YQkgq3c4aTVhH2sEtCLRHCS5Pzltlu9GjBuCsi5KRK571vDQL95ZFZT/i3zIQYV44PUYzz+wDeDO+/Fr0VJ2Vgiqf1HKrT8122qZ8QTfGWUCSAWF29ki4S2EypOgZe9YdDnPV35TbUFWybtL++wA==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce8f36c-5f51-4642-fc8c-08daef14fb28
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2023 12:04:21.8185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNMyz/g446vbZ4FzMskTda4cDRsUAXKNhkeZdoLbhcaqOodce+/3MCWfIFKdXD9hSDw3OQPgWNwAnp3e8XjkcJHFHvi869eIDiduPRfSWoU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5295

T24gMDUvMDEvMjAyMyAxMTowOSBhbSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IEZpcnN0IGFuZCBm
b3JlbW9zdCBjb3JyZWN0IGEgY29tbWVudCBpbXBseWluZyB0aGUgb3Bwb3NpdGUuIFRoZW4sIHRv
DQo+IG1ha2UgdGhpbmdzIG1vcmUgY2xlYXIgUFYtdnMtSFZNLXdpc2UsIG1vdmUgdGhlIFBWIGNo
ZWNrIGVhcmxpZXIgaW4gdGhlDQo+IGZ1bmN0aW9uLCBtYWtpbmcgaXQgdW5uZWNlc3NhcnkgZm9y
IGJvdGggY2FsbGVycyB0byBwZXJmb3JtIHRoZSBjaGVjaw0KPiBpbmRpdmlkdWFsbHkuIEZpbmFs
bHkgcmV0dXJuIE5VTEwgZnJvbSB0aGUgZnVuY3Rpb24gd2hlbiB1c2luZyB0aGUgaWRsZQ0KPiBk
b21haW4ncyBwYWdlIHRhYmxlcywgYWxsb3dpbmcgYSBkY2FjaGUtPmludXNlIGNoZWNrIHRvIGFs
c28gYmVjb21lIGFuDQo+IGFzc2VydGlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KDQpCeSBhbmQgbGFyZ2UsIEkgdGhpbmsgdGhlc2UgY2hh
bmdlcyBvaywgYnV0IEkgd2FudCB0byBtYWtlIGFuIGFyZ3VtZW50DQpmb3IgZ29pbmcgZnVydGhl
ciByaWdodCBhd2F5Lg0KDQoNCk1vc3Qgb2YgbWFwY2FjaGVfY3VycmVudF92Y3B1KCkgaXMgYSBn
aWFudCBib2RnZSB0byBzdXBwb3J0IHRoZSB3ZWlyZA0KY29udGV4dCBpbiBkb20wX2NvbnN0cnVj
dF9wdigpLCBidXQgd2UgcGF5IHRoZSBwcmljZSB1bmlsYXRlcmFsbHkuDQoNCkJ5IHVwZGF0aW5n
IGN1cnJlbnQgdG9vIGluIHRoYXQgd2VpcmQgY29udGV4dCwgSSB0aGluayB3ZSBjYW4gZHJvcA0K
bWFwY2FjaGVfb3ZlcnJpZGVfY3VycmVudCgpLsKgIEl0J3MgYWxzbyB3b3J0aCBub3RpbmcgdGhh
dCB0aGUgb25seQ0KY2FsbGVycyBhcmUgX19pbml0IHNvIGhhdmluZyB0aGlzX2NwdShvdmVycmlk
ZSkgYXMgcGVyLWNwdSBpcyBhIHdhc3RlLg0KDQpCdXQgSSBhbHNvIHRoaW5rIHdlIGNhbiBkcm9w
IHRoZSBwYWdldGFibGVfaXNfbnVsbCh2LT5hcmNoLmd1ZXN0X3RhYmxlKQ0KcGFydCB0b28uwqAg
SWYgd2UgaGFwcGVuIHRvIGJlIGhhbGYtaWRsZSwgaXQgZG9lc24ndCBtYXR0ZXIgaWYgd2UgdXNl
IHRoZQ0KY3VycmVudCBtYXBjYWNoZSBieSBmb2xsb3dpbmcgY3B1X2luZm8oKS0+Y3VycmVudCBp
bnN0ZWFkLsKgIFRoYXQgc2FpZCwgSQ0KY2FuJ3QgdGhpbmsgb2YgYW55IGNhc2Ugd2hlcmUgd2Ug
Y291bGQgbGVnYWxseSBhY2Nlc3MgdHJhbnNpZW50IG1hcHBpbmdzDQpmcm9tIGFuIGlkbGUgY29u
dGV4dCwgc28gSSdkIGJlIHRlbXB0ZWQgdG8gc2VlIGlmIHdlIGNhbiBzaW1wbHkgZHJvcA0KdGhh
dCBjbGF1c2UuDQoNCg0KT3ZlcmFsbCwgSSB0aGluayB0aGUgbG9naWMgd291bGQgYmVuZWZpdCBm
cm9tIGJlaW5nIGV4cHJlc3NlZCBpbiB0ZXJtcw0Kb2Ygc2hvcnRfZGlyZWN0bWFwLCBqdXN0IGxp
a2UgaW5pdF94ZW5fbDRfc2xvdHMoKS7CoCBUaGF0IGlzIHVsdGltYXRlbHkNCnRoZSBwcm9wZXJ0
eSB0aGF0IHdlIGNhcmUgYWJvdXQsIGFuZCBpdCdzIGFsc28gdGhlIHByb3BlcnR5IHRoYXQgaXMN
CmNoYW5naW5nIGluIHRoZSBlZmZvcnQgdG8gcmVtb3ZlIHRoZSBkaXJlY3RtYXAgZW50aXJlbHku
DQoNCklmIG5vdCBzaG9ydF9kaXJlY3RtYXAsIHRoZW4gYXQgbGVhc3QgaGF2aW5nIHRoZSBwcm9w
ZXJ0eSBleHByZXNzZWQNCmNvbnNpc3RlbnRseSBiZXR3ZWVuIHRoZSB0d28gcGllY2Ugb2YgY29k
ZSwgc2VlaW5nIGFzIGl0IGlzIHRoZSBzYW1lDQpwcm9wZXJ0eS4NCg0KfkFuZHJldw0K

