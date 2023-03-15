Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EACB96BB9CB
	for <lists+xen-devel@lfdr.de>; Wed, 15 Mar 2023 17:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510143.787322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcU7D-0005vS-Q1; Wed, 15 Mar 2023 16:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510143.787322; Wed, 15 Mar 2023 16:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcU7D-0005t5-N7; Wed, 15 Mar 2023 16:36:39 +0000
Received: by outflank-mailman (input) for mailman id 510143;
 Wed, 15 Mar 2023 16:36:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CVd2=7H=citrix.com=prvs=431d4e183=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pcU7D-0005sx-4z
 for xen-devel@lists.xenproject.org; Wed, 15 Mar 2023 16:36:39 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88455304-c34f-11ed-b464-930f4c7d94ae;
 Wed, 15 Mar 2023 17:36:36 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 15 Mar 2023 12:36:02 -0400
Received: from PH0PR03MB6368.namprd03.prod.outlook.com (2603:10b6:510:aa::21)
 by BL1PR03MB6181.namprd03.prod.outlook.com (2603:10b6:208:30b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Wed, 15 Mar
 2023 16:36:00 +0000
Received: from PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034]) by PH0PR03MB6368.namprd03.prod.outlook.com
 ([fe80::4fdc:e60c:b790:d034%5]) with mapi id 15.20.6178.019; Wed, 15 Mar 2023
 16:35:59 +0000
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
X-Inumbo-ID: 88455304-c34f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678898196;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4x4DgfYJIVPt5VoKMs0GQUY/aHSAZzKA7Dc307Y9wqo=;
  b=WasZjIsfEJQK2XsCT267wwy6HYFM+xV1tBpJOO2v0DtD8cSi3hSNebVB
   uDxmtkw/qp8EjvpSFSanPkozuGTd+PDanY1Cd78vzg3q5MHMcB9kFHwJQ
   hvQA5BH3/7sqjQTbyF1wKEroe7Y6YI4KUagKZ+MoiVGdNX2Xiptg3iVSt
   Y=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 101397520
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:NWu6bKir4EVzdcsfvYprIeG2X161CBAKZh0ujC45NGQN5FlHY01je
 htvWG2EOv/YMTfzfYx/a43j8R9UuZeAx4NhSAJkqiw2FHsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waDzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRfKSAsPhOYv9uP65KkT+tOrJsBC5bkadZ3VnFIlVk1DN4AaLWaG+Dgw4Ad2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilMpluG1bbI5efTTLSlRtlyfq
 W/cuXzwHzkRNcCFyCrD+XWp7gPKtXqjAdlDS+DirpaGhnWLgUEqMEcoC2G9vP+XpWCxRYtjI
 kktr39GQa8asRbDosPGdwexsTiEoxcaVPJZFuF84waIooLW6QuEAmkPThZadccr8sQxQFQCz
 USVltnkAThutry9Sn+H8LqQ6zSoNkA9PWIEICMJUwYBy93iu50oyALCSM55F6y4hcGzHiv/q
 xiDqCUujrMfgNRN26im9lDKmRqlo5SPRQkwji3cXnik9R94bYjjZIul71nUxf9FIMCSSVzpl
 EMYlteX9vxILZCJmCGHWuwLEJmg4vrDOzrZ6XZlAoMz/jCq93m8dKhf5Th/IAFiNcNsUT/uZ
 kDXtAIIop9ONX2lRaZyb8S6DMFC5ar9EdXsEOLUZ9xBSpF0eEmM+yQGTWyRxmHklg4Hkaw5E
 Z6efYCnCnNyNEh85D+/RuNY27l0wCk7nDvXXcqil0nh1qeCbnmIT7tDKEGJcu0y8KKDpkPS7
 spbMMyJjR5YVYUSfxXqzGLaFnhSRVBTOHw8g5MPHgJfCmKKwF0cNsI=
IronPort-HdrOrdr: A9a23:cjc+MalnD8jISCinCjVQQqBmIxzpDfLo3DAbv31ZSRFFG/Fw9/
 rCoB17726QtN91YhsdcL+7V5VoLUmzyXcX2/hyAV7BZmnbUQKTRekP0WKL+Vbd8kbFh41gPM
 lbEpSXCLfLfCJHZcSR2njELz73quP3jJxBho3lvghQpRkBUdAF0+/gYDzranGfQmN9dP0EPa
 vZ3OVrjRy6d08aa8yqb0N1JNQq97Xw5fTbiQdtPW9f1DWz
X-IronPort-AV: E=Sophos;i="5.98,262,1673931600"; 
   d="scan'208";a="101397520"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVa7FFqU1b+tD3T+S+fUbe6IBiXuB5CWbb7/jaKzIKDvsaU9tAxF7C/NxIKXsLstZFUS+FgxV9cGC2WD/58Fk0dOi+vvoBlTspZFB0TkEULu/iD1X2pv0ugJ7lpAp63bQ0XqU6+Mb7TTKXw402hMVd1IurXabwpU+SRpIHTgW8O62IG/8QK/pcDFAcDo/Y74ENpdK03D6PZYF4JG6uHKdNI8XDqcxweVHDGp2jZZMl7iKMUgI44pWY9y14zJjI3vN5iwOLMEz6e0eZCaSobitK6asyQZrS8th4udxNuOWp/Ale9cMDPuapJkWnTZvayeONxWv4emcs5u3we2FgyU3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7PFXXZInkYNt0+FeBk+Da9MFGAphwlmvDAKkgx+XhA=;
 b=R4gsJw3/eKzu8vTskiNwkZwEaXqvrMXg98hqfBZty+h0hky7KlT78cZZ/e5Y3H/jcvui+FFDVLb8Ad6VdNUlTSlNzRw0w9AZH9lS6Rq7RXMo+GElD5A7WQ9WtvSKmHag5uV5aqpFzDmmf76QK8jxKX6L0E5B8xI4UPlKCxZyewtEPmuULur4t9I6SAft1wE2NUwEpINpfSxSD4OpPcakyeuYqRb9mvpl3DKwbKVNxOeQz72+qWgR1CVdJiD3Af8mrxNPX6tXRC/gzOJxJy7W6/RXBpndIdoCozqxytNH4U5wOXxWM3ZgTRlK9o9wGSBob6zeDODesmybJcBHCQOMRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7PFXXZInkYNt0+FeBk+Da9MFGAphwlmvDAKkgx+XhA=;
 b=GPJNk0cHYwL3MFMneJsKTFKWiEWYoe0uLVFE22Fj3IBky2+fGX/jax8nrcIfhMn4g/AwZrX80tbJqcipBZ2Viw1+mjq0frFQhSCnOxER++6Ej/aCq0xiEcPR5WXg55yonmCQCwLvrYi2kc7jDZu10fsl44Yw9gx2ddd6XnnU1tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 15 Mar 2023 17:35:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Huang Rui <ray.huang@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Honglei Huang <honglei1.huang@amd.com>,
	Julia Zhang <julia.zhang@amd.com>,
	Chen Jiqian <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 6/6] tools/libs/light: pci: translate irq to gsi
Message-ID: <ZBHz7PpUbKM69Xxe@Air-de-Roger>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-7-ray.huang@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230312075455.450187-7-ray.huang@amd.com>
X-ClientProxiedBy: BN9PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:408:ff::11) To PH0PR03MB6368.namprd03.prod.outlook.com
 (2603:10b6:510:aa::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6368:EE_|BL1PR03MB6181:EE_
X-MS-Office365-Filtering-Correlation-Id: d87e7249-119d-42e8-cd64-08db25735bcf
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dh3AgbMhmC41rAKhjnF5zBfV5ifJWq1iqk0AdVDnrRGpB3uq3rlOwwO6xoGDykfuVYNXkgJ6wGiFfJ2ECkW6pZ5Ge4C0Z1XnFvzrmLF4ETofa5zO30rPtEf84x+9BRuX9EuTFEe7AQwZrpNOcQnPbuH5aHA26nvxVHhovRzlOcQxGVOZptdzvIymczxYuGYGIubwLXW2h5hXgQHyz9WQxxhRsVer7RVAuUCHAUbNdxJ8/ykkLYWhubfhqkYekVO/91NjUoGjQHjBVkV8lkJRsS6Z7PTjorSiCyjhOqS17BVeyKbLrFHkzOxA2LWdfLDgvqEGHTYbVaoemISvwpGnTHVP9QvNx/FMGSeocaZvugzOUxTwWFrQSoQtyDgP3rTQH/mJn22RPq8xfWXClkwogdYH1pPW3FRaMx991lLcId28XYG8xPlU7dvYsRWXSvm4gW5Ur9VfQkVaDYYncRwnA94Ji8emRkxOc44iTScp2yAg6uYuejr3MrLcIfObYwqqqKr/HJU3RND0QydI/rFHw6YB9QgAWgsjgwyueeHDHxlPikzaURBk0Xid0nYW/EFdc5+9j80gN/TDM3URQ7KSliwRZ4YGs1oFoee+IarpC0GpgVFvnfH2LfLe1r9i4+zb4hvnviwrp4Wx23euj27mKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6368.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(346002)(376002)(136003)(39860400002)(396003)(366004)(451199018)(478600001)(186003)(6666004)(8676002)(6486002)(6512007)(6506007)(9686003)(66946007)(316002)(66476007)(54906003)(66556008)(26005)(6916009)(4326008)(41300700001)(8936002)(5660300002)(7416002)(38100700002)(82960400001)(2906002)(85182001)(33716001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NnZpaHZCMi92RDBxaERUcWhwUUhibjdRZ2lHKzhnVTJtd2JrVEMyUml1OWpH?=
 =?utf-8?B?V3lrdHVGcFpxOGJudUJQbFBNNDhnUjdMclBoSTRaZFc4STNTUVNNbXo1dkF1?=
 =?utf-8?B?RDZDMldKdDJ5eTBkMEZldWx6UXFnZ2JEWlhyNmJCc016WEU2V3M4ZEs5eGky?=
 =?utf-8?B?dEN3QVp3UVEvRWV0MVB4WU81Q09MUS9VcGRQdFBEeTZyenhlaFdLRXZ2dmtT?=
 =?utf-8?B?WlpELy9sbGhpS3FiWnoxYUQyc2NUelZaQllBWlRlUUFFME52bExPODlCVG1K?=
 =?utf-8?B?V09hN3VPbTdXenhmMW5SekF4RlBRSExuWUlmNlBjdTJtUXo2WEpidmlKSW4y?=
 =?utf-8?B?TjF4bE5xSTVpMkwyMVNiTEVFRWVNYU1jUDF5cERrZXAraXI3V0dlajdQaFZP?=
 =?utf-8?B?TndsVE91MDJqMzJEcTR2Q1MrbjEvZVg2UHV5RlZHa2JhaDdBT1lQZXg0dDFN?=
 =?utf-8?B?blpSQVFXSVZjUmQxcHFxRHlzUWoycTdIVG9GWEFDNkxEb3F3VXViVnR4V1dW?=
 =?utf-8?B?Q3RGRE8ySlNCdEhJWmpFZDZldlkrTGt4cGE1bDFwb0hkdWxjbGpxL0xxSU0r?=
 =?utf-8?B?dFRSTWprVEp1ZkZnMWlwSSszbjlCQXc3a0Fsd01RVnplZ2xXUkMvOWFOYkxk?=
 =?utf-8?B?R00wbFlpdEIyNnJJa1JjMWJZYXg1bVQ3Mng5WFpZU3dVMUVybjN3UnBHSXpr?=
 =?utf-8?B?UWZ2SmdWNmRQR1ZNZmJLZUp0STcrVE9XZk56dTE4ZlRJL1RpLzRlNjh4bWFp?=
 =?utf-8?B?N0kwUTh5Zng0d0ViR05aQzBsT2g2aE9zdUo3S1lhMUpuYVlQNjJ4TWJuNUpX?=
 =?utf-8?B?SFRHRHBUMjg1SnFid2g0TFAyQUwxaVlzTlg0dmVpaWVZK1A5TXV1WDRvTE8v?=
 =?utf-8?B?R0xBbkxHeWhZYjRsZWIzQWovMlpteFBIY3FZYkJNQ0pTZzI2MS9tMU5pcmt0?=
 =?utf-8?B?RWhwTEZkQzRSL3ZaTVBJYWNjaWlqQnhuaVBZUGI0UEFhZnFibVREc0J1S1Jt?=
 =?utf-8?B?dEdZbm9vWVhjTUZucWQxcFMvVXVRTmk0RmlVUWZvTzBBaUpkRGFkUGxTQ2hJ?=
 =?utf-8?B?SDlDclV2MnN3REhCN2Z0SXBSUHVkRFIwT21iUHcrRGk1c1ovM2tXNm9STDBY?=
 =?utf-8?B?VmtLTDhjZDJEUlVUR21wYlRXNDgzTEtwYm1qbXRxM0N2NExYcmNPanBqRW90?=
 =?utf-8?B?KzIvWG8wWVljNTlBVUhOVU40T21kbUdjb2pFL3NPVExZNWdoaUM3L2tvRnlQ?=
 =?utf-8?B?Qy9UVHVRd1hTck9rU3VHNUZrSzlkVFRVaEk0WFR2NGpIRWNKWlpiaS9XSGJm?=
 =?utf-8?B?c3QyU3g3Mkd1ZkI2UWl6ZGRkSUUxRGRBRWFzd0NTYjRLa3VGQ05OM0EyRzNI?=
 =?utf-8?B?K0tVRlRhd1ZxbXFiU1lYczVRY1BrSFpPSDZ2MUdJSG1GYktMM1puVDBtcEdO?=
 =?utf-8?B?b3VyOGwxQkM0YTF0a29HR1pDNkpka2prV011c3BIVFpPM1dCWkxtdDBXcUtp?=
 =?utf-8?B?ZThvcmoyNFFMSTYvcU40MU9IRHRlV2xTaHdZY005OXRsUFA2UlkzdSsreUJi?=
 =?utf-8?B?MVFIMkFtQk1MRWpITXhZTysya05KVDA4USs3VDdibXA4RjIvK2dhOHE1YUda?=
 =?utf-8?B?WHFCTlFhTVF1YjRXcGc0bWc4UkRhditPUm9mYXh1d01Ta3lZRmhZaG5TbWxL?=
 =?utf-8?B?Y0tmRkJac2NHNnZxd0g4UmNWZUpONnNmblp4YzR5bmJrT0wzYkRJWTFXbVIv?=
 =?utf-8?B?OU1ZSGdEMmY2NmM5aGw3UVk5MER0L1l0ditkNkdmd0hYbWptZ0FONG1KdXBR?=
 =?utf-8?B?NlpUZHorZjFBSlRDV2xtN2NZTVhlOTduaDg4QnEzS1hNaGprM1JDMW0reDRG?=
 =?utf-8?B?RjAyK1BTRmZuVkt1bU9HZUFsOXFSMVN4MjR6U1g2QlNCMjZNWndZWHh6d3hQ?=
 =?utf-8?B?bXdUTEMvSEcyOU5YSXRFVjZXRG92RS84TWxqM29XUUpWazJ3YStiWFlFRGJQ?=
 =?utf-8?B?NFBkeG5zSjFHc0tFb2ZUZ0JmaHhpeDdod3ZCWCtJT01CSHNWaDRvS05qNjJG?=
 =?utf-8?B?MUIxRStrcUFwWU1PRXozZXJ0V2lWQmV3cnRlMXBNTzJjRjJnSDJDeFQ0YW1Z?=
 =?utf-8?B?RDVpZWI1OHRFMlRUMk1RRXFKTktxYkd3L0Fva2pKU0NQbzQ5Q2k1QUdEcWhQ?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Y0t6bBOKJjMSNA3acleU6o3y7CNiaZjbmTpGpupHV7IEbC4ZFJqpzXnEvaXrWXw/9JXfhiRxXugMhxX3U0X2Wq3WdLTTQaS8e0gCnuFvApx6DDauj3S/pVzgK8XoMoGAnGCoF/69/96lhuzMeXfbu5c1YuvZ9Oos7zitb0Y6f4ymF46V8/LBOhmuJE0NlNp+pE2yajaov7teaRngqkZ4DSXNcanuNyfs6x6ZmUQIgFU7MXqnjZC6qORXt+DKpHAVkReVEhKicsIafr2UIHfbitx8NchbHpEpgKN2k8g9yLZ4sEIwVZ+ZAQLvDWhjQM+nfCgtuyAdfPLVLC8wv3/wHPQZAm+s7qi5zwPVE1jrHlIlHEPsd2ggm91nl9r83ntPs7c77ZTnj5yTtpu5yKiqHdBSkKv3SYqBgXrlWs05wzMzUxFMxbho7DGAGdkAOm5j1HtN0SdYnoHfvWS3UPpxUf3G6sq6cRuJS/Qcs2Qz4V9lWX/+H6vOpfM3uqx0+b99N8VPKxEOnzg0zlvs24+S1VzrPubjAcuKJDwA2gc0iEUE7z3Sf1QJakq6RVdYpoYinwwSXKZETPU1TtsJdI8SW144o6hXnac2x2D5vt9QawFciyovpJ9mljLPfB6owM1yE8aTbzgkSD7eweEFXgGfGUqgpG7LKdsk5hjVwPu01tpctERAtlTRvXAIBBjjvl++hur5d7zbsibpbEzgKjiP0FOOmEcOFo4JQFnTAtgvkUxi9iJhRAheWq2in8giLasj01uB3n2B66PIxC0Mqo3u0bIuScKCVP2M0/ku8BnhgMzpZXH/5AQvh81gA0STmJOwPIDB0S5LjcMJ2Q6wAHefG/LvqBhBWZI5puERe7ySX0j8ZGLZOqc8aFpigIa6BpWa
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d87e7249-119d-42e8-cd64-08db25735bcf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6368.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 16:35:59.7368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmShGX8SmH9P+lHYCPP3ZR2TQGz/BUJF1VmLk2HToGBPlQdgs+j7nwcrpq5wafMA8AxFbutqIEhXQ1X9pJyVGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6181

On Sun, Mar 12, 2023 at 03:54:55PM +0800, Huang Rui wrote:
> From: Chen Jiqian <Jiqian.Chen@amd.com>
> 
> Use new xc_physdev_gsi_from_irq to get the GSI number
> 
> Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
>  tools/libs/light/libxl_pci.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index f4c4f17545..47cf2799bf 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1486,6 +1486,7 @@ static void pci_add_dm_done(libxl__egc *egc,
>          goto out_no_irq;
>      }
>      if ((fscanf(f, "%u", &irq) == 1) && irq) {
> +        irq = xc_physdev_gsi_from_irq(ctx->xch, irq);

This is just a shot in the dark, because I don't really have enough
context to understand what's going on here, but see below.

I've taken a look at this on my box, and it seems like on
dom0 the value returned by /sys/bus/pci/devices/SBDF/irq is not
very consistent.

If devices are in use by a driver the irq sysfs node reports either
the GSI irq or the MSI IRQ (in case a single MSI interrupt is
setup).

It seems like pciback in Linux does something to report the correct
value:

root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
74
root@lcy2-dt107:~# xl pci-assignable-add 00:14.0
root@lcy2-dt107:~# cat /sys/bus/pci/devices/0000\:00\:14.0/irq
16

As you can see, making the device assignable changed the value
reported by the irq node to be the GSI instead of the MSI IRQ, I would
think you are missing something similar in the PVH setup (some pciback
magic)?

Albeit I have no idea why you would need to translate from IRQ to GSI
in the way you do in this and related patches, because I'm missing the
context.

Regards, Roger.

