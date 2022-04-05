Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E84F2C57
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 13:30:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298746.509044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhNn-0000xT-Jz; Tue, 05 Apr 2022 11:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298746.509044; Tue, 05 Apr 2022 11:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbhNn-0000vB-GU; Tue, 05 Apr 2022 11:29:59 +0000
Received: by outflank-mailman (input) for mailman id 298746;
 Tue, 05 Apr 2022 11:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbhNm-0000v1-0w
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 11:29:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a0f7de-b4d3-11ec-8fbc-03012f2f19d4;
 Tue, 05 Apr 2022 13:29:56 +0200 (CEST)
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
X-Inumbo-ID: b7a0f7de-b4d3-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649158196;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=13ffDLdRIQPjUk4Paeucj1VNLaXygKHYOmd5iNzPpUY=;
  b=UfyPFxAvwlaqsBRi1fvgFZZj0Y1eru6WVRTdxPNoiy6wbOoIjqp8lcMm
   Ku9wv51gfIVXp7BmXq4v7RhgiCuiGUdXTDsL+VWgRsPSBFedWrUFlA0Od
   Z2PKBC2EFcxZpJ5BmNLhapFBxQFwYtZeYeTtgYRW9M4rVyk7ayXvr72wS
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67929964
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fzKSbKIImfFCMA3YFE+RxpUlxSXFcZb7ZxGr2PjKsXjdYENS3mcAn
 2FLWWDSbP/bZzD1KN5zPtu3/EoA7ZDWxtZmTwBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA148IMsdoUg7wbRh3tY12YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 M9nsYLoTCIYAqGSteoedz98P31zPbITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glv15ofTKiCD
 yYfQQA/RhWbSA9xA1Q8DLYbjdmtgWvndQQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wt
 m/Aumj0HBweHNie0iaetGKhgPfVmiH2U55UE6e3ntZoilCOwm0YCDUNSEC25/K+jyaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCspDQYRYJVNtwG5F+gxKnwxSK1WmUEUWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl4iDGJGT9bxgbQ+0RqmBNzEJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9IdEIumkieRsybppsldrVj
 Kn74145CHh7ZiXCUEOKS9jpV5RCIVbIS7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyikEwFCrChO3WJqub+7zkidBAGOHw/kOQOHsarKQt6AmAxTfjXxLIqYYt+mKpJ0OzP+
 xmAtoVwkjITWVWvxd22V01e
IronPort-HdrOrdr: A9a23:Z8pABKBWMUuh5TPlHehIsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6La90Y27MA7hHPlOkPUs1NaZLXPbUQ6TTb2KgrGSpgEIdxeOktK1kJ
 0QDJSWa+eAfWSS7/yKmDVQeuxIqLLsndHK9IXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUbqFh/dL5kUUtDPpZ1fSKWMB2FffueChPbHbzYfJt3T04l7aSHp4kI2A==
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="67929964"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFG1iAEccgeH/O8c5Iyu3XGvU2LdYZSxSiy1jSzROaE2lyJMH9k+5g3YcKCy7McWvJ1MT82+DsXoaLFrdVq7M4nLO99ASJeHdZ8Ggiu49lMFGqVHDlwtlMhaHYi24MSUpAzCnVAJlc7WP5u/iPdSkljH6ryI5OJixCRUcbUrNwX5dLUt73INlIJ1TLuJHn+vuZgXylDOhw7/aGrjquqsWXqxNSC5CmnZcpvMJiZR3Vyjt1HVwJ034zUgJxIPvKZBXcK98Hgcjo2gEiZRjF4TmrcBe0vM1kIZuTwSEOTH9qYDxYf9wCU5dd47DcSPUbd7DRq0lzR6Sn2FouHSVlS4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8NPjNs+bB9pmvNSng1oR8opgYiRX0v/R6xvSdtCyPY=;
 b=WKeiB34IpBIbYNQYOjxxGlBY9PaMtJ65GaNzPNl++3M/VuJqd+RpmNpFWLrFpIxukKQxf/P3Nda111Gshvc6fYhIcNMy8WJJrZFftbJ4vZ1EzBFWK/NbGZGZiZIv11BCBitmUXOnzIzWpw2kwu+vQNr3J41HJnI5n9XfTKvDf33u+NS9L5Ufcr48duKUpvQ/gxTDML6OZY9Aw+5m4akGbcdSjXeMfwRr0AY0JgNca/yrl5H1sL++OoFsGZ9bbVz3UC+5+7GSxzw9Gbu18cexGbBqz4bIdq+RN4Es89o+7TW/NZAHVMzjpg3AiCIFacO51w9N/H3Be5z9y6bBfDL29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8NPjNs+bB9pmvNSng1oR8opgYiRX0v/R6xvSdtCyPY=;
 b=fFieFDhoD1u9cHfpxeDUzYkHc7KnMT9FwxOBdPMVvAV3X2VzYaH95LGKKwBOAZSeZVUSN+SgZcIyDw+Q5L07OXFjwCVmkq29BglYfZpTgQZfyhIAys1PaBmYNzSVjAOCmyPyYHs2f65SkW0DDZYbay3RwZchMRtsq+3CIoi3GGQ=
Date: Tue, 5 Apr 2022 13:29:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 8/8] x86/boot: fold two MOVs into an ADD
Message-ID: <YkwoKzbKSsyleoFA@Air-de-Roger>
References: <819eb552-d49d-e98a-9524-8d30c1b93908@suse.com>
 <294639f0-d959-59b4-b3db-78451d5acd9c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <294639f0-d959-59b4-b3db-78451d5acd9c@suse.com>
X-ClientProxiedBy: LO4P123CA0214.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44f6f466-0e97-4e96-cf40-08da16f79a07
X-MS-TrafficTypeDiagnostic: DM5PR03MB2475:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB24750479CCD4C2DC167CF0558FE49@DM5PR03MB2475.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVUjycOXBOt/fZAwmEu6LUL/RSN7aYzvTelIa44+xSt+6j/upGoCfb94ca2cFkJ2FGYzAC/2enZ1lNU+0KCZtI9CoHMNIOZMtsJSMaocvg2iZreE7F4aFbk2siij+hwh/dtuc2HsfiF1HgBDD/SnktoGhDndKGqLAZmtVx2E/xYEqgo284BIBZVLSlRP4O/yBEtOZxt+pfYdEzpLKcA3gNg84ow7AX7WGGXmDbBY8luEoW7zWJoCpo1cCxkukQeKeIWn+VVfET3R/e7fhCfpK+5/0AHkE37oxrNZhV65zjcG8gJyiyBh7YjFWUxeGHfgJMoR97GVpbtZwG3yzkS7bwitx9KS4XUj7XX47GUg9XoeXLZTUV3Fbfvgi8yakKHFrHREFeW+WYHvkAUPWKGKNSbwVRdbFQD26FuyAg+z51EqsHKrwgbU290nFeb8IFt0ZZIjeWC3OeSo8p24h/p54oWP8YSOnN0Ilwdq3ZCQfEZtESWYpc6oBbXROZiCC3uyj1cVYcvg3cl3TXVRid4vOBSq9r/9EJzAKzLJgEkrvrBxu6BxKraGs/Hsn8kKp/JXAoOgdUN57uDk2YEysh3JEB4i5mz8sNvRxbEpgmnhXPPoZzd03lac5MY4VT2DmsVnou3/UAl7ke6k3QyTVaGaYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(8676002)(4326008)(66946007)(66476007)(86362001)(2906002)(66556008)(5660300002)(82960400001)(38100700002)(8936002)(6666004)(9686003)(6916009)(186003)(33716001)(26005)(54906003)(6512007)(6486002)(316002)(6506007)(508600001)(558084003)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnM0THdlSEJzL1lKbGltQTBHRzZPdVNaWHRoZWpORFltdDFMN1JDblA4LzNK?=
 =?utf-8?B?Z3ZxWlR3TXhGVFU2R2RTL0tSdXVUUEZ1akVXN0FqL3cwZkZmdzFtaHBIZE5V?=
 =?utf-8?B?elFMbklDVEZMYXhxYy9MbThsUXVwZ0hhellMdlhCR0dhQWVnb0dkcUdGOWhE?=
 =?utf-8?B?WTdWNzBVeWdTZ0xOczExbXYvVWlyRUh5cmliL2xTUFlSVWR1REMrUWhpME5l?=
 =?utf-8?B?dVBDZVAraElQazQwcCtrK1FuQU41Vi9zUFA1UmRzYzdqRExKVHNaUFhCcTBh?=
 =?utf-8?B?bDV2NGorNjQ2dWhEeHptV2FxdEFxM2V1a1lLWUhOVit6VGtVZ0NlQm5PZUlt?=
 =?utf-8?B?dS8rK1pycVc3bTdIc0dQeURidHhTbm5pWld0K3FrdFVDWno2VWs3aVYyRmFO?=
 =?utf-8?B?K09wVkJ3T2dwTHhpMllnR05oWjVhSlN4U3AyWGowajNmV1FiT2phR3RORlRz?=
 =?utf-8?B?VGcxL2NHSThyaXdIenRvM2hBd0h5M05PbkFrcmdGcFZXSWhvTjVEQ1I0akJO?=
 =?utf-8?B?STFicDlDTWpXNytvdXFPeHJFQUw4MzE5d0lDbGZFRk1ReWRGMVlWUHM4Rks3?=
 =?utf-8?B?NWp1blJUYmptemxuQVZHa3FhRGg5ZGN2TGQ3eG9ZbXJ6eEsxdWR2TTkrUUFQ?=
 =?utf-8?B?SGk2a2kwMGJxaWhpaERIcXJjNUVZME1rV1dibXRVR3ZwV0VwVk1vRDM2U2Q5?=
 =?utf-8?B?cTlueUR5VEhvU0lLRExueGIwM1A3SWhoUnd0Z253Qkp6TlQzeVdybG9XUlV3?=
 =?utf-8?B?U05DZTdKL0kyMmlBRThRaEVZZDRGWjB4anN2eVpNZHdXZkFwZ0g2R0hBR3FO?=
 =?utf-8?B?RFBEczFqSnN6aEN0Mzgvb0Q1UXFIdy84SDZpbC9GZi9UZUFBS2crMzdrWnR2?=
 =?utf-8?B?cXFxSUQ4SDBzNFFYc2VuRmtxeWI5NTY3MmZzczYyUU9pZ2hIN08wblZSdVJG?=
 =?utf-8?B?YkxJUFFhTlZqTWw4TzFzL1FIV21taUQ2a0ZaczY2UUs3N1pTTUpqNGVYQURy?=
 =?utf-8?B?SVFrcHdBR01YM1IrNDZnU2svdXV2RTdvdGs0a0thYkg4NStYdXFuWXhoK2Mz?=
 =?utf-8?B?SDJMMWZKckZkZmtBOFNKVGRnNklVNkxWOThtTDV6ejJXTUcyM0xKbXRmSk5h?=
 =?utf-8?B?OVZSVFlxR0tMbFlaNy9iV2psR1lxdHNhcVR2TnNOb0hnRWlZUWRrWldPaDEw?=
 =?utf-8?B?eHRsUjZiK0NTOXJrUlRTMTdkVGZldjdiaHVDSkpuTFFrVVRYT1kyWDUwZ2Rn?=
 =?utf-8?B?TlphdC9MdHhXazRNRFpNM3VwcWZXbG9UM0pkV2pwWjZnR2h0YThSVnJ2WWNm?=
 =?utf-8?B?T0pscXVGMDJVVzBNNm84TVZia0xKdmhhNU9HUUtGc045S0oxbnN0TkEyZ2Iw?=
 =?utf-8?B?eEtEaEhJcDdESXpBZWZCYTBkWnk5S2kxVFV6UHFQYUhUd05zRkdIL21ReTNr?=
 =?utf-8?B?a29TblM3TWJuZHYydmo0bTFERFY0VEc2TUpmQmZ2Y2tLNE9zUDZGNklLRWhw?=
 =?utf-8?B?NjhOVGI5c2xMdC9yKzBIaHh0QktLdFFhWnVDR0dvRXhsbndBV2NEOTZKd2E2?=
 =?utf-8?B?TThiakdkM29WZ0FvTVZTNllVWEtpZUoyS3BmOFZmZ3NJR1Q2VmFBTCsrTHlU?=
 =?utf-8?B?MGpvK1JyMHFSTEppYlF5dkVVWjlWM3R0M1ZSdDZlSVA0RFVJRERpWVlmTytn?=
 =?utf-8?B?RnJ0WHlWSVFyZHhiMlR3MytrSmZaR2hBU3N1UGFxRXI2aTlta2I1bFFJdXZH?=
 =?utf-8?B?OEI0Sjd2TlZ2QlRXbGtCYVB1TmhGTmE4aDhud010QktFa0FkS1d1cENtT2xy?=
 =?utf-8?B?MkxOSktCMjZqdlF5Uzk5VEpPM1NwKzlGcVQwREd2NVB1VWZSMm9EU2h5NTBk?=
 =?utf-8?B?a0lwV0pmdkpqSjgvZkt0U2hTaVR1eUlWZEUva05uM2hTb0VhTnNtQzZEZE9S?=
 =?utf-8?B?eVZ0WjhaakQrWG1Cd3BFbDBpcHcrWGpQRHU0MGU5Ry9XOWp4NW9SMmM0YjJL?=
 =?utf-8?B?d0pMWXBZQ2ZVbXNrUkd3bjBQWE9GSDczK1ZGbjE2NXdqWnVLNHVtbWFXWXRY?=
 =?utf-8?B?L0VwYStDdWlVSUFUL2NMTlBTT2tkVFRRWnFjc1ByYk45RjAzaHNPdHVuRmdi?=
 =?utf-8?B?U3R0RHFGR1dPNkJQVmJKcVNBRWFNZ3YwQVF1MEJHaEpqTWFkN2xBdUhrREdn?=
 =?utf-8?B?K1JFdFlEMTA2UXoyWEhWNE5CVmJkQXZtUTBuTkx5SU1ra0FHWDIwY3dFNUIw?=
 =?utf-8?B?NzNiRnRhZ1RKTHVZZjBKZVpKRjNZK1dyNHE5TnZBcWNQT2xlQnpxRE5OTXNq?=
 =?utf-8?B?bzgzSjVsbzBRWW03L0l6VE9DVUNXUmxMdFhoVm85UVRiSW81YlNvQlgzeSsw?=
 =?utf-8?Q?OiWawyNups/ATmSE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f6f466-0e97-4e96-cf40-08da16f79a07
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 11:29:52.3907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZI/bxgKeArkxZQ0u+Qq2ox6DwLgKlWgtdHAkJsdsASdsYAxVm0GlwiQiK/BEbLCOTl2FoNmFymbzzu6nXqoGSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2475
X-OriginatorOrg: citrix.com

On Thu, Mar 31, 2022 at 11:51:02AM +0200, Jan Beulich wrote:
> There's no point going through %ax; the addition can be done directly in
> %di.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

