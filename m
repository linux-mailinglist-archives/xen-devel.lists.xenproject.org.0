Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680F26E5BFE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Apr 2023 10:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522629.812114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poghb-00082H-Fz; Tue, 18 Apr 2023 08:28:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522629.812114; Tue, 18 Apr 2023 08:28:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poghb-0007zm-Bh; Tue, 18 Apr 2023 08:28:39 +0000
Received: by outflank-mailman (input) for mailman id 522629;
 Tue, 18 Apr 2023 08:28:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TTWx=AJ=citrix.com=prvs=4659928b3=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1poghY-0007zW-Uo
 for xen-devel@lists.xenproject.org; Tue, 18 Apr 2023 08:28:37 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00151f5a-ddc3-11ed-8611-37d641c3527e;
 Tue, 18 Apr 2023 10:28:32 +0200 (CEST)
Received: from mail-dm6nam04lp2049.outbound.protection.outlook.com (HELO
 NAM04-DM6-obe.outbound.protection.outlook.com) ([104.47.73.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Apr 2023 04:28:29 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MN2PR03MB5264.namprd03.prod.outlook.com (2603:10b6:208:1e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 08:28:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 08:28:27 +0000
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
X-Inumbo-ID: 00151f5a-ddc3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681806512;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=76ZmziPpUuNh75qK4Sndi8IQuoGT93fpXTeReNkm2Wg=;
  b=T+Rrmw9kNKW4MJdW8pYw22UfT9uk2WCkh75Kp0jNM1ak0pBT7ayGLIiE
   asa7nCyoSY96DwK1MWVRPDifsegLziUY6PZGaMGHM4DQfrpnQ2Savf46I
   pv8kkFKxppyGUv8R/77/GcGsbLBICY0fSDICDE/BJIRnKMViz0Pse9bPN
   k=;
X-IronPort-RemoteIP: 104.47.73.49
X-IronPort-MID: 105823278
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:32uqnq1crtK8WhuYZvbD5elwkn2cJEfYwER7XKvMYLTBsI5bpzEOy
 mZLD2qCPfqIZWOhLox0Pojj8h4O7MSAztFhQQU/pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+XuDgNyo4GlD5gBnNagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfEz53q
 voaNz02MxGEm96PkfWwRbUvv5F2RCXrFNt3VnBI6xj8VapjbbWdBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxouC6PnWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHumCNhJTuLonhJsqB7P+0FPMkVKb1ymqvOEgRHna89kO
 0NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQN8hstU/SXo11
 1uKt9TzDDdrvfueTnf13qeZq3a+NDYYKUcGZDQYVk0V7t/7uoYxgxnTCNF5H8aIYsbdHDjxx
 3WGqXY4jrBL0coTjf3nrBbAni6moYXPQkgt/ALLU2m57wR/Iom4e4iv7lud5vFFRGqEcmS8U
 LE/s5D2xIgz4VulzkRhnM1l8GmV2su4
IronPort-HdrOrdr: A9a23:ejwkbaCWdMXWV/TlHem955DYdb4zR+YMi2TDtnoddfUxSKfzqy
 nApoV56faKskdyZJhNo7690cq7LU80l6QU3WB5B97LYOCMggSVxe9ZjLcKygeQfhHDyg==
X-Talos-CUID: 9a23:9mETCm1f9RAv/6SgRPVeWLxfCJ8cLXvf03rrfk6/FVpQGfqeRgPTwfYx
X-Talos-MUID: 9a23:/yHkbwaKF21T9eBT9GPRqW1YbJtS5LmlAn0Gzsw2pvKUOnkl
X-IronPort-AV: E=Sophos;i="5.99,206,1677560400"; 
   d="scan'208";a="105823278"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFo7BXOrmM3Sd8nwgG9MMVmeu6plSCcUEvfghnDFfg6/uYVF3W8tYTUks2Gmilfm7li4LPMtO+6XtdC5VS3aFNoroi9FDqECFdbqLPAsjdlzTezHJPk3s/OOcKiaMz2bLjqBUjoXxojNIG34U4cRtlpEvEEGVB9ki3LviV9bZjgk/4hSosi0DrmVFBA0csxBrNP3MzK1YYMg8xZM+OjHOwSkLRedZCf4qBA+B4zPgJ+4Lvog4sD6CRmLCB1RwnPCRRbYaJRR+283fulIcDJAeRL930OKVJj5UfoNoXDeeODts5Ik+iqZXRCqaij40fL4LebSQ8Xl+IzLbe4dCuRmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MUhhF4R2A7KldBjtaBfEHpx11Crn0DQE8HGcoGlBhvg=;
 b=C+fvDBUMAGGRi7UoBxxJma9pqUy7eCMzMKALQ+HKB3oTXzzyYxzVTUspCg/SO5Wd44/3+dMMLnWdO12EFJimsLuTf2gazBm8MjdiZ3zePth+7dLtF554XlX3ARVHHnHQtCeJPYQVaO1rR+WK5q78tyyw8ZnbzotLjELlyliS+BPc2i4RIDAvf5rNY31rCC7dK4/t5YNolnq6l0RZ8cUzRB1ITSbWrTWleLx/n0fBYey3Vtkb6clGL5LYS+XAJ7WK7lq+sdOEubxcQ58E59/vP6sSzxq/zX1B3hArNipzxmPkssyWy8Qu7o8Zl9ZtplpD7z3aW1dottsPGRIvwgVe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MUhhF4R2A7KldBjtaBfEHpx11Crn0DQE8HGcoGlBhvg=;
 b=J0P3gbD0d+Z5o+1mlqrVS54W8JfaPs0w6RHRH9r3dmzaH0NAVZkxiwElReiDeU3P4Lo6/U9SKgrJR+spm5cX8tU1soUi0Aw5YNrdRLVb02ZMDHXLnhTA7w29NLA2RwwdSMZdHaU5nFz7cpaSgbpaoxJzcljuigaLMRvOuX88JcY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <a80610dd-c988-eeb9-22ac-b91fd84df4e8@citrix.com>
Date: Tue, 18 Apr 2023 09:28:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230417135219.3776777-1-andrew.cooper3@citrix.com>
 <d83288c5-6247-ef7d-b9ba-8bf24c7831ac@suse.com>
 <22179eac-4fc9-1521-2a83-2313b8c44a2d@citrix.com>
 <3ea38da5-70a9-6887-5384-fe002d8568c4@suse.com>
 <2ebda1f3-23fb-3f06-c4ca-1ac508c82b40@citrix.com>
 <49115307-753f-8196-55a7-8e8c1e50b503@suse.com>
In-Reply-To: <49115307-753f-8196-55a7-8e8c1e50b503@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0510.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::17) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MN2PR03MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: 7359f1e8-ea56-4803-3f83-08db3fe6e1b9
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7JDyeom6j68ZOVlvK/3dMZPhwOgjFVZDILFOC1B0tHcPkcPf8iZq137+cC5WeiqcTNSh15OJ13KCLogUJnuC7G7AOsu2u3aoRfaRlHUrbWjJydvJGYMNep8HL7AKYmP6FYTC+v6Tc/dTma+jEUxr07gpla2aChABxw82GCucl3rRHTU7t1bDj3gOF8UZlG8Z+3ltTmEOBpXXpLYleo0pXo5jKs8kz5s3VIv9fR+jIiNbcF6MJg5XRyOgdEJzqDyGb41/+8VUKX6n5FgLPQmU6EL1J7k6ntawRZNSqw0YgU0mecN0s0N0rq4us1N1WcPsFuu4580VUcE3qD6dtc+tj7SgnL4JGDgVjV5Xl5oZBgEsm9/+nUUYB8iSiJ7EmtkSBcabsKVut3HQCI0+lOv2QA5V43oXOArjSe213JHvPD+1U7at+Fu/5UW/Mwv8wQs61Ejw7C8WB6gbfPma/gR35TLj4/ur7oyUa9VhANBNfy7c+6MovXtf1SFdJ6X4DNXHMF3QR0wfQ98M66oWuYMUcEEOor084fNq5N1UCOAjCZnYHyIL/TQVSSliB3BvkUNCwlOi9SS753n4I1H829AAaakFMnrJKCbZ6RlPXT09/6OzkPEe3dxdIV7zLPRDpFDHdP+fWiv9QkkuifPTBXCdiw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199021)(5660300002)(86362001)(2616005)(6512007)(31696002)(83380400001)(186003)(53546011)(82960400001)(26005)(6506007)(38100700002)(8676002)(8936002)(478600001)(54906003)(6486002)(6666004)(316002)(41300700001)(36756003)(66476007)(66556008)(4326008)(6916009)(66946007)(31686004)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUd6a3N3a2N0clZKczhiQ3A4UnNrK2dZbmdJVnNNbDRZb2xkR3Jmcks1dnNK?=
 =?utf-8?B?bXpNREtaaThFMTdIb1VjRmQyWWQxVFZPOTlWeGd3YklKSERiNVkzSHF5QWdM?=
 =?utf-8?B?b0ZqaFlLc2t2MjNaYklkbEhYd1U5VlN5aTg0b1BoeGhUS0lueGlwWSt1emw2?=
 =?utf-8?B?MkhCQUFJWjdaYWxPQTFLOXZxYVk0aythdFpJdDNMUWtBdFQwVUdpMDdsQnpG?=
 =?utf-8?B?MXdWSkRzU3VlVThwOUE5ejhydDdUdVBubzBWQWdJY0FDY2dkVGdMNUt0UGho?=
 =?utf-8?B?Q2E5NlVpVkRUUVExcGtETFJKc0M5emVaZlNKRDc4b0hNTEpuY21zeDBrNFg2?=
 =?utf-8?B?VkcwVnA1d0VOL3c0UEJtakduTlJ6R29GQTlUWVpObG5tZWhYRlYzZ0VxZi9j?=
 =?utf-8?B?YTVoV3NhTFJFRXcxb25rSlQ5VWFrMVJsN3FRNmdHaktNTGo3TGJFZGVWS1hp?=
 =?utf-8?B?VlFmQXZpS05aRDA2TkxXdzBMK0IvV2xmVE5abWRtWlZadkJPZkZsY29JaTZv?=
 =?utf-8?B?UXNPeXI3TWpGc1A1VkgxYXpuYlFoWCtZS2dUMWIreDVaT0ZBeWZmZzdSS3Ra?=
 =?utf-8?B?dEllM1N0Y3BZUWtmSDZOZHdpMDJKUXBlS1RzeHRWUndUaUxBdjh4YWoyd01S?=
 =?utf-8?B?Q2VKd3RFMWtYMzU2dWhKUlZRQUdCUkJBMmR5bVA2TEFUcUdXWUR4Qi9McFl2?=
 =?utf-8?B?YXJzaHd3R1ZGWFBBSG9TY0JDalVrSEtGdUwwd3VWQW5mM254YU9lV2NpcDhk?=
 =?utf-8?B?NVdONnB1NDlVUTc2d1hDWURVRjd1Y2NVUkRSbGdYRGtJekhoMkJ4U2ZqV09y?=
 =?utf-8?B?am1neG5XSVJBV1dlb0JJY2FMVmVmUXVFdlJiL2I1eTMrdjYvcUFnYXBLZFV3?=
 =?utf-8?B?SEZxc1ZmeCtLR3RWMkxwa1dKcXNrNVJ3bzErTDVpNmpIYU5DdUVab1dVc1BX?=
 =?utf-8?B?TjRGNTRjZ3hXdkhQSHNnaUxNTS91YWJlaWN4U2g0NlZsYUF2cDFEMkxXVEc4?=
 =?utf-8?B?SDFoZWxqK0c3QlhzM1F4cWVXcU1mUVZHVDBlTTdYQlhWSmc5UDNjMFVHMk1D?=
 =?utf-8?B?TUtrYW9yVWdzY2NMNkJSMWM5RFUzSi9Ld1piRzRtcm9CSEhWdnRVMFYyc2hk?=
 =?utf-8?B?MmpyK0J4cDZYZVorZVpCOFAxTmtpSUttd01vUkpjWGVMUWtsZStsdHJiOXgw?=
 =?utf-8?B?UUxQOVhxUk44NjYwa1A1YWxWdGVjdWYzM1orV282WW02RjB3SVZPMy9uektB?=
 =?utf-8?B?bVJVU090d3dibWxuK1E0QjVESmRJZktQN1hxbkVFVnlKV05tZEdwVTgzSVp6?=
 =?utf-8?B?Q0gwL2ZoaFdud2lCN1hwOXYxVzRYeFFDbm9CMG9YMWF2dVp1NWtIR0VYN0Zz?=
 =?utf-8?B?ZCtxMFlxUTVnVmRrY05QS0RGcXFlb0tVMEFPZlI4YzgyeTJGYk9VY2Z3a3l3?=
 =?utf-8?B?RC9LNEpqN0NiNU95cklrbUpMWjVjYk90QXdCT3NaQVJyTGtvaTlISHNPcEIx?=
 =?utf-8?B?VjJBSkdPU3NhK1MyQzFHMXA5RUxqN2ZlaGkwR2xncDBTV0thRlJEc0ovNk1Q?=
 =?utf-8?B?TEl6a2szdXUrY1l5czgyRFR3NEhaZ052bU5EeVgzRk9DalIrRWJmd2dlQzNP?=
 =?utf-8?B?VFMyVDZVZDBhbkNuNVFUeUdxNTM0Y1VkeXBsaXltb2JaZ01ndkRaR2Z6SXY3?=
 =?utf-8?B?WnZFY2hCbjVjSGJCL1NmdTNHRTZ3U2tYeFcyQWJzWHdtMnZCSmI2Y1dEaS9T?=
 =?utf-8?B?am1LNE8ybWd4Vnpjc0M1NGZYcVRxWHFLZUdtTmdOMFJRM3A3V2JsLy9lSDE3?=
 =?utf-8?B?d1hLYS8waENQck9Zb09vYTFSaGN1dXRqOG9yZjhFUTFDRzVlNThDS0lPUXVV?=
 =?utf-8?B?SVNudWdRSW9heEpZZjFpbEdqZXNockNIeGdzR1VmdTJSc2wyYjRoSFBWLy9V?=
 =?utf-8?B?K3FENDRUVEdlWG9HNDBHTUhPR05mZU5SNEdFSDYxTHFZWGQ2OE41elROeXQ2?=
 =?utf-8?B?Q05pZ3lSUUppMzBzNEVpVXNyOThzR2VmdVp1MFZoUVdBd0ZjTDZ1eWpURnhv?=
 =?utf-8?B?eFV6aVhWaDdjam41UGRraHRnNU1XUWZrM2NsK0xUNm1qay85RGFSaXpRVWNL?=
 =?utf-8?B?eFZ6MXgvSGVXQ3R6bTFkTk1jL0hOWFZFbC96dll4Q2hxTkZNZVhienM5SUZH?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AkUBBfpUCGRQcYClGCbs0ZJjlcwnsGTozNjDcGGbtxzlfbhPPscMj2jZl4XeHGRGdcsSvktfTSFYX1qLdmyW+oor+KQpbk9MeuvNT/vBrDOusWznSKBpQ2pTA80CHRgB1Ie4fv7bHS2cOtFc2GaIxZymVSg8RamCffa/4U+I6MXvds0b6ipNIURbHnlP+oVuiCP/imhQGZH+m0MQ7BPSf6hWJ/FQ+k29nZvesdUw5pk7eccDctsBHz4c989hM6N01nId4o78VLmetjap9VQooO1RCk0xVRYa0zoYT1iCUg4Zc3EUy063Kh8ZmN0VKo4HzR1Y+e1hcu+juh0atKrOJp9v8FCpklBbaoiXhqyyRNVcQ9kvrg+k3sjqPG+wcPihb2coHQLg4c+EJVzRax9VvK93yHpIT5f4j4qRm3PI2a9VwL6Q14rQH11JOSPFNj8+WrQ3/myinTTZ1alXfdZPnI5J6RgxfFra2nRgKLIF6prajtUx0xTqnylwc9gecVrSBSbI3cHw/wahx9qgDw8ZToGF+6qmLgiibzoUyGI/7+38tHbH53rxi0h8qLRFEoBJCd1pmGfWL6eZ8F+wgrxacyVpW0fgd8qiFhMzs6MYlNwfgPoPO0BejGE4EtA/tv+dJmQsvjD/w4cT/dDLhGjGVXDPS21lzq8Mwrqu5ax4mIB75VNVF+BVF6tl0RMnq07ZFDAwRs0VxjnIGxMRnHBCZ1KOsW02lG9mU2h8p8dQz8Ts0gOZ4OGqRLuT49ntoxJ4iiqyyGy69LdiRAd3fPnf/wo3rK4mCtQQu78SPnmv5OXKQY8JqNKWxUDiUaHOxZBvmgBFbORXNCV+m0ikc5z5Qzt/oChinmcYHyJ1P/13h8E=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7359f1e8-ea56-4803-3f83-08db3fe6e1b9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 08:28:26.8842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y8s9jyTYvTYGIdK8/ZS263BRxB2gcWVeTfAL1lTlb2QSnohNkAzsY0G5Sp/rWJxF5W5AELrMSTIvd5YtzRnwwaQ+njljOj4djj2VQ97ANpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5264

On 18/04/2023 6:58 am, Jan Beulich wrote:
> On 17.04.2023 21:34, Andrew Cooper wrote:
>> On 17/04/2023 3:51 pm, Jan Beulich wrote:
>>> On 17.04.2023 16:41, Andrew Cooper wrote:
>>>> On 17/04/2023 2:59 pm, Jan Beulich wrote:
>>>>> On 17.04.2023 15:52, Andrew Cooper wrote:
>>>>>> @@ -5879,6 +5880,73 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>>>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>>>>>  }
>>>>>>  
>>>>>> +/*
>>>>>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>>>>>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>>>>>> + * responsibility of the caller, and *MUST* not be introduced here.
>>>>>> + *
>>>>>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>>>>>> + * Must be called with present flags, and over present mappings.
>>>>>> + * Must be called on leaf page boundaries.
>>>>> This last sentence, while wording-wise correct, could do with making more
>>>>> explicit that it is the caller's responsibility to know whether large page
>>>>> mappings are in use, due to ...
>>>> The meaning here is really "this doesn't shatter superpages", and this
>>>> was the most concise I could come up with.
>>>>
>>>> Would ", i.e. won't shatter 2M pages." as a clarification work?
>>> Yes, that would definitely help. Nevertheless I was more after something
>>> like "..., i.e. for 2M mappings on 2M boundaries." Which, thinking about
>>> it, points out that while you have a respective check for the start
>>> address, the full 2M page would be changed even if the end address wasn't
>>> 2M aligned (but fell in the middle of a 2M page).
>> There's no nice way to check for because a range that starts on a 4k
>> non-2M boundary can legitimately end on a 2M boundary at 4k granularity.
> How about
>
>         if ( l2e_get_flags(l2e) & _PAGE_PSE )
>         {
>             ASSERT(l1_table_offset(v) == 0);
>             ASSERT(e - v >= (1UL << L2_PAGETABLE_SHIFT));

Ah, not as bad as I feared.  I'll include this, and post a v3 for
completeness.

~Andrew

