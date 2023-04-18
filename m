Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957CE6E66E1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 16:15:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522933.812595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pom6q-0002WF-4h; Tue, 18 Apr 2023 14:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522933.812595; Tue, 18 Apr 2023 14:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pom6q-0002Tt-1c; Tue, 18 Apr 2023 14:15:04 +0000
Received: by outflank-mailman (input) for mailman id 522933;
 Tue, 18 Apr 2023 14:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUq5=AJ=citrix.com=prvs=465f4c9e2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pom6p-0002Tn-8A
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 14:15:03 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 678552c2-ddf3-11ed-b21f-6b7b168915f2;
 Tue, 18 Apr 2023 16:15:01 +0200 (CEST)
Received: from mail-dm6nam12lp2170.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 10:14:59 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by MW4PR03MB6443.namprd03.prod.outlook.com (2603:10b6:303:122::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 14:14:57 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::48bb:fedd:a394:9f39%5]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 14:14:57 +0000
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
X-Inumbo-ID: 678552c2-ddf3-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681827301;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=GotnlFM9qrukBsZi1IP8oU3vONNWmAYOaty+glrG1Jo=;
  b=D4e5sjq68/DMNudUXWYWXXRJYxoteR/pNrNP/JLopqmmC5Wds6hqvPCm
   +3psw0kaEdhC3Vw6vKb73nOR4Dz0SE+4mVx1XC3v1/1R4iuImuiWLrFDb
   LMpEASwgHH14Et2ZbD4nyVavsqCkmcaHJUyZ1ZS/7fSu/o+zeFDYJgG+u
   Y=;
X-IronPort-RemoteIP: 104.47.59.170
X-IronPort-MID: 105999568
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:UmPCc6rQXFNM0v4xzbknqfwNBFpeBmI+ZBIvgKrLsJaIsI4StFCzt
 garIBmPPPzbZjP0fd5xaNjl9k5QvcCBn9I1Sws4rSEzQyhA8JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCzilNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXADoNXBSn2+2X+7GmEcdcqc0PEtPPDLpK7xmMzRmBZRonabbqZvyQoPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jemraYWNEjCJbZw9ckKwv
 GXJ8n6/GhgHHNee1SCE4jSngeqncSbTAdpPRezpq6A66LGV7mgdUhwcS2Lhm9ykhm+ncd9dF
 GYI9wN7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgc/iTQsSAIE55zvpd81hxeWFNJ7Svfq1pvyBC36x
 C2MoG4mnbIPgMUX1qK9u1fanzaroZuPRQkwjunKYl+YAspCTNbNT+SVBZLzt56s8K7xooG9g
 UU5
IronPort-HdrOrdr: A9a23:RLaMNKmgH2uKqmFMVP3OfDuMrZjpDfLv3DAbv31ZSRFFG/Fw9/
 rCoB19726RtN9xYgBEpTnkAsO9qBznmqKdjbN+AV7AZniFhILLFuFfBOLZqlWNJ8SXzIVgPM
 xbAstD4bPLbGSTjazBkXSF+9RL+qj6zEiq792usEuEVWtRGsZdB58SMHfhLqVxLjM2Y6YRJd
 6nyedsgSGvQngTZtTTPAh+YwCSz+e77a4PeHQ9dmYa1DU=
X-Talos-CUID: =?us-ascii?q?9a23=3A6crN/WgYeuTijfAYH9aEbYmeqTJueH3vyFOMLG6?=
 =?us-ascii?q?DCnsyZo26QHOu4odUqp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A2/Q7Zg3oa3dBoufoJgwbPLl2QjUj56r0CUoTqM8?=
 =?us-ascii?q?8ntSIFDVaNjWipii6a9py?=
X-IronPort-AV: E=Sophos;i="5.99,207,1677560400"; 
   d="scan'208";a="105999568"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U28vIQqkB/2JUOxtlde5/DKuEjXYh0ckFK37v6OTpQpjLgyqKDqvLdTl1qRgMio0J3USR9fG7FnBdB9uyy0bbRzdzZ0trhvrARQOtid+ATr2mx1t6Zl+7Ng93HWq/jrFa5QSdvxBB54MetXZBsznYMBil5hEdUnZwC1xA+6H7/9ZU9u9/2EheySgFpzD4DidL5rxrM5oXTyZ5Q1uvQmkU0y3LgFsPyuMV//LxnMccRUbHRAq6X8g9DP2v1BnlRizZ9u5jw5BwJAZSPdCOkgRtg5RBqUwyPBA86qImyW81onJWOF1eU926+2n+zRhNovQYWEwUjQ9+SJPXDtOLm6tdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iajh/4buaGwggkintFP9KUyTMsoP4KFgsTOOytx99xw=;
 b=VGhtUaEdwzVNbxpPKBwEMyPb9HxpnyjbmnQw9cqk1T9x1dpvrex23wc5aLYZtk6cSXusYHERu1xDjwF5NNOttzvoG484P2ZVV9MknwesPiSeyVpdfgm0Eu5477YltmRuYyOfsGyMQ4JdymYYmi81qAAM/z7OuHuQ0z/7RtbeuID+GvX7mv0yC05SSjK4wU/+Z6RfGbnxmYarZotbm5XZvRZ8ZViWxLgIjSQQrGTxDY5PoouHJxSmJB5LtUtdd0h4T40fn5tBkJidKWB/xOb4yEJIv+L3FZVFp4tYVkSB83yzVWYyMENG9EPXe4uRSsl2H91eRa9sAZiO0BVAoY/lWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iajh/4buaGwggkintFP9KUyTMsoP4KFgsTOOytx99xw=;
 b=drkubDVRHd91dUUXwWpj7ppa/imNluzlmhCRYzxjhkw/JSVGKMLxhm+7KTFRx48u89FmhAYCeFEFswEiLJpFxNIx6iFReI553238BdrKE/s/tKZd6SewH38Z30V1OxxA8ZRT9xRW3CP0yvJF9PIDj35wSM6SZWgYNBMpVc1ULgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 18 Apr 2023 16:14:51 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/livepatch: enable livepatching assembly source files
Message-ID: <ZD6l2wcK00O7nSlS@Air-de-Roger>
References: <20230418092458.15253-1-roger.pau@citrix.com>
 <fc9085f6-25b7-b94f-e7d3-ebc1d6283d73@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc9085f6-25b7-b94f-e7d3-ebc1d6283d73@citrix.com>
X-ClientProxiedBy: LO4P265CA0067.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::17) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|MW4PR03MB6443:EE_
X-MS-Office365-Filtering-Correlation-Id: e1678d72-51eb-4fe5-a579-08db401749dd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	a+1eYKkXxBW4kTFatI4Csc9kBO2tH0Za5SB31ORMXsSsX4XDl+AxqpC/Q51ZdwAnCzOkyUroXNnD/zOeA+8UNeM5uZd+fqdDKQvLiblmIOFnlzbYh/GUixv8ISqCv5bgsa3exTCQswfeW9N+F1WLuEHIU/LoQnpnrcbka38qIZk3suW9fD0V6PePb8+Ab8JjAJxsqPFzqgmh4CjgOOh3U1wMjh02Sw5TlhzaqY81Y4quUFMCaiDZCeiWnVEwDlbBi9gA9cXjxmaM7Grv/xkN7HlLHx731OS6hGP6XdXCEP579xUd5KKpF4WtmzUgRbp/F/OUAXCoaZlI0BHjFcWJ8fZseJEuxps0Io1XeF/1e+DoHZflF/mLmrtir9Jngayq/93Vr132IHCCkpqapxKpfjb7tPncR0EUMv3dWAjyAfL7u0vYTY0owmHih24boj6VrGM/3rncF+L4LNQ/CARuA/KryZwv1dPUmxa/43HiyQRH1Iupu/QzrMFeSoaBlwTAyiK/ka2Pmy18rpxaYFIYoTKKi12VI+qYXaF30OSMTEKYC2EyCA5pxrgIWzZwHyiD
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(136003)(396003)(39860400002)(376002)(346002)(366004)(451199021)(4326008)(66946007)(316002)(6636002)(478600001)(54906003)(66556008)(66476007)(6666004)(6486002)(26005)(2906002)(33716001)(41300700001)(8936002)(6862004)(5660300002)(8676002)(38100700002)(86362001)(85182001)(9686003)(83380400001)(53546011)(6512007)(186003)(6506007)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlBWN01UZWI1WmpJWHZ5Q1J3d255RzZtN25XNEFkZlNPYVc4a3ZUbUVqdkov?=
 =?utf-8?B?NW81MmZIWnZKSm05aUNySTk5cmhxcDRwUjJYRnh5UzhsL0w0VmV2T3JnTE14?=
 =?utf-8?B?RW9kcmw2K3BUSWN5RWVWVE8vMjk5Nm5wd0wxWDhNWFVNdUx2b2c3YWZDMm1Z?=
 =?utf-8?B?NnBVWXIrb3AydHRhdlZNclpzNm81bXBvcGNlVjdWVGhRYUJjKzliY093QVVD?=
 =?utf-8?B?K1BPazdqb3dyaDNUakdENU13NnJuWU9YOWEra1FNN2gxdVZpZFpQYzlxN1VZ?=
 =?utf-8?B?MmdWZkJXMDV3Rm9sVjV2M3hGby9LNTNnL2pyd2lJRWVRMkxGazUwU0ZNWU5N?=
 =?utf-8?B?ZmFqN3loY0Z0enVlNGV0ZjdvZDRNc1JQZEJOaVVwR0xGenZBTTBpd3FmRHhj?=
 =?utf-8?B?UldyZU01M2ZPT28vanlPcWF5MThJdGxWTnUvWTJJV1JPV3BZYzIrb05WSU1T?=
 =?utf-8?B?cmdDVVU2bUl2VTQvT0JRNlhpcDUyNjU1TVVNNlFnbEo2VUFjcndyZm1kaDFY?=
 =?utf-8?B?ZXBydTVXNzJpTGtTUnE3eHJBcHppR3p6K0hEZW1DclBwWm5mWHFlY0IvNDFY?=
 =?utf-8?B?eDVVbnBtalNWaGZpaDVQL092ZHJFNFlyRGI0YVBxVDJXYkc0d0RBWHE0NEpG?=
 =?utf-8?B?bUpuV29CQXJncVBuaHp1TkFmTXo2ekUxUWVpaUZTVHIrNWQ1SHlFUWt1eFE0?=
 =?utf-8?B?S3NHbUZ4RDltc0VZenU0a3lQNEFmL1JJbFJiWWNIZlJYd3FWNVp5enFsRUpX?=
 =?utf-8?B?cGpwRWFxRmxuMDVmY2N4WkhGQ0hxZkY4ZTdnOFB5WEdwTWo3OWJyMUV5dUhj?=
 =?utf-8?B?blVMcGxIN0F3bGdQZGwvYmRGM0h5WlJoM0pVSzZuVEFlTGJaeDJvTjdsZGJt?=
 =?utf-8?B?K21hd0lTeWlNaFZtWmxGQzhmSGJRYkJvYXpZZGY1QXZWODZDd2M4azk4cTJS?=
 =?utf-8?B?WU5NNVAxRldUMTMyU2tRVi85QkhUbE5JUVgzbUNMSkJ1cncxSW9GRnZHcVhx?=
 =?utf-8?B?V3V0MHZLbTF3TGdDbFZEMHNWOWJ4akRIWDF6NG91MWI3bTlrYTBZenBVQmRD?=
 =?utf-8?B?WDEzNVBhYTJTdTlsKzUwY3EwajFxN0lYa2MrKzVWVjV3bU1PMVd3M05qU3pH?=
 =?utf-8?B?Z2hFN3Rqa1BmeDNlU0hCN1VLS1Y0NVJZaDNoL1FaT3V2UHdhTXF6U0JuaXV4?=
 =?utf-8?B?cUhhMGs1aUxXZVpSN3BHalFSRlVuYzBuTUd1VG5WODN6bkNxeXN4YVNKV05w?=
 =?utf-8?B?b0YraHFsZWlaREdmcFBiNENSK2RIYW14aFFadm5PYmhkcHhNMHU1YlZMb0FR?=
 =?utf-8?B?ckd4VG1NMFFvdWlvTG1YTVB3ZHUwQUxEVDZBYTJzMlJPVU5BNWY1V3RhelhO?=
 =?utf-8?B?YlBJSWgrV2xkK0wwMkJjOWZ6MUZmM0VMWHlqbEpNbWJkOWhPT1Q2ekluWmxB?=
 =?utf-8?B?QUI5QkFLa2lDN3JvTnFyRDQxeTRBWGlzSjdpeHg1bSsvUnN1ZGdNMWVsVmdX?=
 =?utf-8?B?bFBrbGl2YWJENUk4UHMrMkdsc1VGWXFkL3NFbjlOMWhvbjdHQkVwdnA2VWFu?=
 =?utf-8?B?cURlUE5PYXhTWWlKVHEzRWRLK1ZkemJWbStYa2c0VUMxclBEVk9TRW9PeHJa?=
 =?utf-8?B?dkdlSkdKNHQ4SjJ1L25FZitVUm0yeFpTVk9URThnZkszL1UzSXY2aXNhS3hI?=
 =?utf-8?B?Z3lOWkFBU3U0Y0I3T3pNYyszM1VKWUxabGdRdkNZb2drdlRnMkFRbzBZZzdP?=
 =?utf-8?B?Ly9ENVhubnF1S3N2MTI0cDFLa0FxczB4RTdJRVJwdkF3K1RhcG9sOVdOZ0J4?=
 =?utf-8?B?TnlWSHVMRUFvMXlGZFh6alNVbFFWQnUvN0FSWGlvSzZvUytwY0tVWmlsdW5W?=
 =?utf-8?B?cERKZDFJREdVK1BDNjhUbitzVGRzcXhDTmpWQjZrekw3WHBZbURLUm9ueldl?=
 =?utf-8?B?cmNJeGlkckdlaEI4eVdTUjJSTS9yU0g5bmFjamFpam9peXJmTlpMbzJiYU1D?=
 =?utf-8?B?RkIzYzZGRTlIaHBPdWdEcEtnZXFCcUtsd2dIRzA2UHcwenYreTF6cU9CeFVM?=
 =?utf-8?B?NldDTG1FR0lQazYrQ3AvVkV0VlhNQS8vYVlvYUV5cGxBNDNCL2oyN1NBUDAz?=
 =?utf-8?Q?7+2WaPegcmzZUSeCaOkg2jWdj?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	EYWBRNOK5K/KcRGvbg+us28La55O+50yajr7rdMPopTp57X5uj8nmlaHuxZdZMNkW00ne6uwCRTitqkIlUE5mP6SX9LhTp7D3l/fqA8QJHhE2Lfhue088yxch8qI6+VAhh2fCp4xH32Cb0bq27UkFhmSCqdeGKPGSV88i4TQikiDFGpiFdm9RLmgAsErJsRK+U7YDV0/IABSatLyf1UJvxwnMVWsWwpyKTDSCuvTQecISe8j8wK26WWh0p7mFewSrC16r03LmWmEnmJa8SgDTHYGJ8lGfqU1FE8FoIX405WtWOFCro4MfPiFqHamgigJj/MaNb0m+l/WcCBaCszgMxgVeF4mIj8e4IM0UqneQiA7xqAAsgJRoHm2ftWnRJ2eEbILdWvuDey53zlcqQkS1Ltwy6SX7EePrnbX8agXk0DtHOmHtY2cDjpZ51sACKodI0aUtkvX9/joK34p0+m+0vMmyu8/76fZiS7zDSKBH/WWScnTnWK2w7EYC524jCwSbT0aARiW5CAaCR4/5q4SG+AuB53703FOY23G7zGaTVLYlwqaKvJyXs4VincZeFdSCU8axYpfeiMpBTpmYV4Riwp5MPZqvQZPMOZ3Ioef8zokOAYVqasXBY59rbmgYIsDCcVYufLFczqP+REzdQDCXqJK4a5vDxW1tl4iJqzGxqUUZdnEjpwn8boPCOmSqz5EjxsSm08XpyO//doSkv4Qkh4/PvGxI4yPkOFh1UVPMGKeBe8EpaNS2Ptan4PFCygI1ahy9AfVd6EKsYMrU5xveeja8GpkHWFaTQg4Edv6+HeB3k23Btxjg/g8AJTztXsN
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1678d72-51eb-4fe5-a579-08db401749dd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 14:14:57.3592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hIiwCoJi4Orz4Pe9OtsEb5d5zte/DI9lZDLGSjA9NTT90a1GXl7yBwSqF2N9GX7HLpQVEmeQJ+QcrLCOZf4qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6443

On Tue, Apr 18, 2023 at 01:17:55PM +0100, Andrew Cooper wrote:
> On 18/04/2023 10:24 am, Roger Pau Monne wrote:
> 
> > diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
> > index 7675a59ff057..c204634910c4 100644
> > --- a/xen/arch/x86/x86_64/entry.S
> > +++ b/xen/arch/x86/x86_64/entry.S
> > @@ -660,7 +660,7 @@ ENTRY(early_page_fault)
> >  
> >          ALIGN
> >  /* No special register assumptions. */
> > -restore_all_xen:
> > +START_LP(restore_all_xen)
> >          /*
> >           * Check whether we need to switch to the per-CPU page tables, in
> >           * case we return to late PV exit code (from an NMI or #MC).
> > @@ -677,6 +677,7 @@ UNLIKELY_END(exit_cr3)
> >  
> >          RESTORE_ALL adj=8
> >          iretq
> > +END_LP(restore_all_xen)
> 
> 
> While it's useful to have a concrete idea of what is necessary to fix
> all of this, I do not wish to put in markers like this.  This isn't
> about livepatching - it's about getting sane ELF metadata.

Right, Jan has expressed a similar opinion.

> This is why I had Jane work on using the Linux macros.  They account for
> *all* interesting ELF metadata, as well as taking care of things like
> the global function alignment settings, CFI patching space, etc.

I don't see much issue in using the Linux macros, if we agree we want
those.  Some of those would likely be unused, do we want to import it
wholesale, or just introduce the ones required?  Initially I might
just introduce SYM_FUNC_START{,_LOCAL}() and SYM_FUNC_END().

> Putting functions in separate sections should be hidden in the normal
> SYM_FUNC_START(), and dependent on CONFIG_SPLIT_SECTIONS behind the
> scenes seeing as we have that as a option already.

Sure.

Thanks, Roger.

