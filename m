Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F796CDBE5
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 16:17:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516285.800173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWcI-0008F2-7w; Wed, 29 Mar 2023 14:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516285.800173; Wed, 29 Mar 2023 14:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phWcI-0008Cl-4e; Wed, 29 Mar 2023 14:17:34 +0000
Received: by outflank-mailman (input) for mailman id 516285;
 Wed, 29 Mar 2023 14:17:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WOlf=7V=citrix.com=prvs=445effd08=roger.pau@srs-se1.protection.inumbo.net>)
 id 1phWcG-0008Cf-Dm
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 14:17:33 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e4975ab-ce3c-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 16:17:28 +0200 (CEST)
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 10:17:25 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by DM6PR03MB5148.namprd03.prod.outlook.com (2603:10b6:5:1e3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 14:17:23 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.041; Wed, 29 Mar 2023
 14:17:22 +0000
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
X-Inumbo-ID: 6e4975ab-ce3c-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680099447;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8MUfk8IDgAfICAX9YhauHqu2m+WcMwN1gT6ZvLgEdBk=;
  b=KMowuDkbr6qVgX6pATcRybQF5ZrZgKAtMuc8t/bsALsMxu7vrjFZDf2/
   FBJs3tafYWR4Fb6zS9NJXUVqdf/pX1VT3DtNAUUtgddF3u5D7VgDuwGM2
   99nyIvVyiuBGGFfCsL4UmIQkoYomeQc47pa9LLdj6UVLqcmwyaJmc3MHF
   o=;
X-IronPort-RemoteIP: 104.47.66.44
X-IronPort-MID: 102890964
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:o2mtrK87ZZ9NJYi0G5CzDrUDp3+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 2NOUWjQbPiIYDemftxzPNjk/UNSv8CHydZgQVRo/Hs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqoa5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkltr
 vJDKQI0SCvZxOWX2uy7ePVRlIcKeZyD0IM34hmMzBn/JNN/G9XmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTaNilAtuFTuGIO9ltiiX8Jak1zev
 mvb12/4HgsbJJqUzj/tHneE37eVzXKjCdxOfFG+3u9qo2KC/2sKMiQ5SkOx5uKBm0ecB80Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluP1TM9KGYDYWoBUlED6ty6+oUr1EqTEpBkDbK/icDzFXfo2
 TeWoSMihrIVy8kWy6G8+lOBiDWpznTUcjMICszsdjrNxmtEiESNPeRENXCzAS58Ebuk
IronPort-HdrOrdr: A9a23:7cRgfaHeAP3LqWwrpLqE/8eALOsnbusQ8zAXPiFKOH9om6mj/K
 qTdZsgpH3JYUkqKRQdcLy7VZVoIkm9yXcW2+cs1N6ZNWHbUQ2TQL2KhrGC/9SPIULDH+dmpM
 NdT5Q=
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="102890964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoMHBjiU6jDIuL6e7soRt/Cic0aVK0oWIVuqgeYpH/xDxfOaylXB4PrtFtWyZhTpARacF8PtyYzZ4BJeZPWk7pvrTLX/50EDbbD7fIxRvBoOZrcO+D2F4DT1ZRsR2FNXa4ZWIH2DoiE57g6O4BfoBQHqAwR6h/lmB8TbHZOkGsrOuUwU/cWMa553X93+cdyp2t4zellOwXVRF8T691NQ4wC5gVblfJW3GnRk2YIjD+KVMRRS2n6jMIlFUgwBhXQYdO5tmLiGcbwBcky6eMT4FrI0dbIAhxQhr1FR1VELS3XQ+Xp8+crJDmKyiomy1TtFvnEtJh+T55v+pA6Vw2Zfwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dX3AXwuNoNFFVSVWPI9acrafKEbTr9scnUpdApMnXrw=;
 b=KlB4JYu/W0NH+DdnOn+ImJni30WZQKQwK9/JADfshur084wqjWO/gINvPaISV+52maFNhGXqkUgDcPNBPj3qlr7QMXM8wfcIekgv8RMSR1/j95hQ4v2xR7Wux66lLlPn3+KCqrwp0aK1FYiJmTmkS7uxkvsm8ZadQARgosxWkq/L5fBs/yeU1qsJPlWQw3DImHfH/Q86832+CzjSkagqclZWnkn/R3pygE20jO2hrzLf0C+NvSYsOmI4RWDvjGWI69WELTNKr8xxYgEdm9/tm1izXH5O5Che4nxJxzkWW3uIePXuq/+qKEK/ml8ECXPcKjn2KukmhrsaRKPo6gGFCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dX3AXwuNoNFFVSVWPI9acrafKEbTr9scnUpdApMnXrw=;
 b=FIiSxJUySjh3YWIaQTydvL1NfJbC4NKVhc69zHC/gGq15VcIA9gdpIcGv8Y7PuiL9tTNxCTfDR4tjb0fPQCp+/O3ufqGJ/oqRv53gv4ni727xi687vwJEVDnBgqGaZjpcnUsmn4KPMIpOq5Lf+yQvw8Nt5Rb5y2qvZkRC8YgnTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 29 Mar 2023 16:17:16 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Message-ID: <ZCRIbKcfi8hn1m8Z@Air-de-Roger>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <ZCL3W/HrwLANuE/0@Air-de-Roger>
 <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40d58ac1-d0bb-afed-c0ae-c545c7bff30c@suse.com>
X-ClientProxiedBy: MR1P264CA0210.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:56::10) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|DM6PR03MB5148:EE_
X-MS-Office365-Filtering-Correlation-Id: dc96a6f5-4568-4c8a-62a9-08db30605007
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	H1a+Cx5X9RIbnhKyIGgSW+GvSjPazKj84Bj8s9PVsAJVjmdM7aA8Yr5QSAw7Q6HoI9+/OgqKxSlaqvUsP0JqCYAcrrswYHG+lDdZDoKY90Lg+gD4Mia0133yoD3Ti2PouUcLBxPdT0yCRqD80tOPYCTjQG/XT+CZdHPBFq9qKqXHsR7mF+26Iz5/UBd9W3aMuX66texKUwb4VytSOBqM9ZM1cYXxSwk9cFh9VyL9fxAhKRUNtEcSFBOw6lGfPW1IazKcr/fM2I8YiaMSWJrUyUwLq41BVQ7rxnkyURq8HBmA2ocIlUxsAsi3aYP8ZGt/wcS3mEojI496cAMuyt7kVjXVZjmrH7MMusO3/DkRRjJ1xJBmxlWBp0HmKPmA0DAOkPuniRcjpj3QJRGDa7Y3uTMQxr4Ql7Yrnm8KqPS7HnYtkpwt2CxDaOXpbqZlRaEBPtrB9QxHInrDN0L1s4CGUVdspDreMFD/fgQyf3Q+FCc/SUbOmBHeVDdlznGlCIH2RUnBlsQLVIC4yNSyRh8loQmqK29BGHwBcw9cWn7qunwWhSzor0KPwVVElj4QAgNM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(6916009)(83380400001)(26005)(6506007)(9686003)(6512007)(53546011)(186003)(86362001)(82960400001)(38100700002)(41300700001)(85182001)(8936002)(478600001)(5660300002)(6666004)(33716001)(66946007)(66476007)(4326008)(8676002)(66556008)(54906003)(6486002)(316002)(2906002)(66899021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlVhd2RiUTh6OXdHYjVDcHJIWGlkY1RnNmJOcGRJNisvOTk2eXRSM2lBZW1i?=
 =?utf-8?B?cEJSb3FISUNYcThSMTBlWFcyQVZaMzRlY2EvK3RlVlFuZkNBSTB6TStlcmdZ?=
 =?utf-8?B?SExtZDNoZlZlNVU2QVNESFUxUHNnc2N0ZDBiVDJMcVJXSkJQMUxJaGVFRU1L?=
 =?utf-8?B?VFNzNk1lc1ZmMExYMHQ1QzVXdVJHSzVNTHJwMW1meHBVM2xGeWk1NW9ITFlv?=
 =?utf-8?B?eXNaWm9hNWVuVVYyK1R6ZmhETEJwK1BJRU84NTlRcjhJdzJOVzhLeHMrNm9t?=
 =?utf-8?B?cm9lTzhTcisyVW9HbVpLV01CTGhHdVk1N2I4VVFGck9GR0tZTDZxSUhsRDVy?=
 =?utf-8?B?RjUzOEd4WkZTWlA5ajFIOHpHVWhUbHQxSEhMVEIvY1NTZHNuN2lYUWNxaVph?=
 =?utf-8?B?YzFNcE5WekpYNWhrb045ZGlrVkkrT05WQlRtSmorVlVTS3VZZDVURk1zK0FG?=
 =?utf-8?B?RnJEM1RYQUI4aU9yQTltNG1Zak9SUTJaM25zeXhZby8vaTVTREdIYS9aRzRl?=
 =?utf-8?B?MFcxM3VYYWg5VHRJR0pmbWtRb3NDNW1nQWIwbDQ5N2VkVW80VDNBQ3RMdVVu?=
 =?utf-8?B?OUl2STdaa1RVOCs2eGlqMXNHRGs1S0V0T0ZvNUJYRHZJOForS3Nnb3NwaE5l?=
 =?utf-8?B?NDZKbXFNWlJHNzdpT3hrQ2UxVk1WaC93OWlEWk55WHpuVVJwUVZpME5ZUTFs?=
 =?utf-8?B?ZVhIeFNZZDhadEkxUk5YeWF5eTlOZ1N1TzBWVCtBN0RkYitabUlJZUNEdHhX?=
 =?utf-8?B?MHJIWitSZjNPb2ZRcnBKanpPdHBtZGxiQmpsYVpBNkgrcE5NZW5PMDJxOVgy?=
 =?utf-8?B?T0g5dE5lekhzbjdYdG5kVGFFMU45SnJGMlNqU25VRy90K2ZjN2kvQU1RVnVR?=
 =?utf-8?B?MjYrN084SXlJWEpZQ3FPU2Zic2srNjN4aGxOWmNIeE9OZ0paNUVvYkMzR0h1?=
 =?utf-8?B?aGF3ZzZURm5yRXlVRW1SSFVqVzh6ai9MSXpXbzBIeGNIT2IxclpIRWZDMzJO?=
 =?utf-8?B?aG1oMHgzUVRSRXlocGRuMnVZUW9nNGZydk9ycUF3VGQrUFdxRXlEYnBWWmlL?=
 =?utf-8?B?R1dzTmdqcDNhUnRvaVM2N2NNUlRRWVpXYm1zc0pubHJzdUlOVlhBeDF5SGhK?=
 =?utf-8?B?empqc2ZmRlVoKzRTR0dteWNIZjEvK0xHRXZaV1o5R29wZXVOYVdSWEh4eC9a?=
 =?utf-8?B?ZUszdm12RTVyTyt1N2RyQVY2RXo5c21heEx5TXZOVFk2RTR6NnJYUW5vVk0v?=
 =?utf-8?B?WWcxSnM1QUdmQVoreFlYVDJJQXdFNHJ4SEVOL0RGZGRPenNURXVxdWNiU3ZO?=
 =?utf-8?B?NWhaWUxNbzR4MmE3akxSbElBaFhzZFdDQWNaYldNenRHUXYxMFU5cTVjVG85?=
 =?utf-8?B?M3BGV0ljcklzNlNTQk1YeVVFUjhNTTcwOVdKYWlNT0Z3UzE2c0F3QXFRT3BM?=
 =?utf-8?B?SW0zcFZZd3hiVUlHQTNSTWVQRzNCWVRhUWdjWjBvYVJaY3BNMGl4UGFPbnIw?=
 =?utf-8?B?cVlzVzgzN2JFQUNLUHc1cTR5cWxqQXJDbUVZb0UxTmR1MTFnSEtEUkVoNHBu?=
 =?utf-8?B?NzZ3VlB1K2V2Y2U5RnNweU5mckw2MStXS1dNbHhzL0RwUWx0RXVQL2R4TDBn?=
 =?utf-8?B?NTNnZ0htRWdYM0Fkb0lxVy93ZHkwNXBvM3F1bmhKQWQ0RGU0ODBtUnlJOXhl?=
 =?utf-8?B?MkttSkZzZVR6UHNqQUdFQjJXRUdUN1lwZHBqZWpDNXR4NXMyZzZ5dTVhUDRv?=
 =?utf-8?B?MmpWYTRERFY4MWd6bndtLzczRWV0YzRjY3VqVG9VM1lHTjErWExVbzVMd04w?=
 =?utf-8?B?ZEozcHZnZmRJSzkveWI5M2dEcExXRnJXaWMrK2tVdjJCb0djNzRMcWF4NXFq?=
 =?utf-8?B?RGdncEYrekJrZHFRcjljU1BndG90NkF0cVF6dGVvRDNHSTFVTFJ1dmVaTGJs?=
 =?utf-8?B?TEpQazZrUWpHZnJHNFlsN1YwQzBQczJ1emJKUCtGUjlxRWRSbzVxTnM2eXdw?=
 =?utf-8?B?QkZzaEsvaU4rQnN0YTRDa0syNEZNV20yU0laRkVCRVpQK0trbmVOYUUxTnNR?=
 =?utf-8?B?Z3EwZENISmVZREZZTE1maEpGeTlnb2ZHOU5VVXh6UlBDQnpyQ2c5Ulc4OXpC?=
 =?utf-8?Q?Wdml4qHMghcWBQUTNMW14XRhv?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YO+q6Fc9j4gJL1S5FNbbxuJPlZ0gWokj5aGvtEp7nkAeWzd1UQ0mLbSW/Tc/QnAdJo4Xeoo3V+j8+TYI5fV/TsvRGAxrOZ4oBetbOPMmE91feVzPt1fTSv5JAlhx6jMe99yF8qy5vuxbGXtnvY/teUGlgSBWvCfj05m7ZsQjydaFZMuZiNSyTncDiezEeyLvVzplNPNr4XZfqTnvHA67qTjSExxrqfbmwc7FqKxy1Doi9H7enjgegbSmH8Tdpzg1lqQ5Uyzs+Yt1sWmghFUVU/Jqh3QoI9h8AvNvoJ2pOzCYz8wyx12f+ttqOPZ98TowbEyfDTXt+0zu4zWifeQ9ber6P3CgDJQKD4JjkT2s46gRl/TH4dY6y0BVkhmRdyy03Kt78s81UHKoD+0rYrqNFUd3bOVdL8BWHy3A2KpWEkVjbowEoST0hcFH25WIGGptmi7IqewdLiWNU6I6hQtcEIe0a4SrvFJf293T83AOYjzqfVfRYAfAemwCtkyzQD3dvzUaqVteEILMYtwCJZ+2aDz9F5FewQHX1KlwRl4Zq6n6hRR1Aw2T4bUVumpUnYLV9pt0NVoaTL3nLZCS2nh2LEsEiYrWKE0sPGEIg3PQ+v2yEjrjVIYkAV44Ubdsv86jb5sEByy4Dy6KcQ55hdZ1ZdzSSuPJHDAwZtYNv8pYFBzuXTa+99LlF6k9/+GB2iuoxVLoqHo55B7EpGelW2JrzpCe6UXYL60AXqBMuBVKowuY66UsDBcwaJxbXZA2vAbbLM8OUXCnGNqSatmmVEg4tHNPGnN/WXuEMZJPOWY9Y/ELQBZCv8TTfN1HX4v2ZWn0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc96a6f5-4568-4c8a-62a9-08db30605007
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 14:17:22.6657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FnUwnuDQ5hyDynIdh8Hju63z/5NMsDF3m7fJ6e+yX9jW+EMtOnOP1qk0/Afd1FgaYGczWrwVVE+94FqZ/npXXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5148

On Tue, Mar 28, 2023 at 04:48:10PM +0200, Jan Beulich wrote:
> On 28.03.2023 16:19, Roger Pau Monné wrote:
> > On Wed, Jun 15, 2022 at 11:57:54AM +0200, Jan Beulich wrote:
> >> ... of the huge monolithic source file. The series is largely code
> >> movement and hence has the intention of not incurring any functional
> >> change.
> > 
> > I take the intention is to make code simpler and easier to follow by
> > splitting it up into smaller files?
> 
> Well, I can't say yes or no to "simpler" or "easier to follow", but
> splitting is the goal, in the hope that these may end up as a side
> effects. There's always the risk that scattering things around may
> also make things less obvious. My main motivation, however, is the
> observation that this huge source file alone consumes a fair part
> of (non-parallelizable) build time. To the degree that with older
> gcc building this one file takes ten (or so) times as long as the

I wouldn't really trade compiler speed for clarity in a piece of code
like the x86 emulator, which is already very complex.

Do you have some figures of the performance difference this series
makes when building the emulator?

A couple of notes from someone that's not familiar with the x86
emulator.  It would be clearer if the split files where prefixed with
opcode_ for those that deal with emulation (blk.c, 0f01.c, ...) IMO,
so that you clearly see this is an opcode family that has been split
into a separate file, or maybe insn_{opcode,blk,fpu,...}?

I've noticed in some of the newly introduced files the original
copyright notice from Keir is lost, I assume that's on purpose because
none of the code was contributed by Kier in that file? (see 0f01.c vs
0fae.c for example).

Do we expect to be able to split other opcode handling into separate
files?

I wonder how tied together are the remaining cases, and whether we
will be able to split more of them into separate units?

Overall I don't think the disintegration makes the code harder, as the split
cases seems to be fully isolated, I do however wonder whether further splits
might not be so isolated?

Thanks, Roger.

