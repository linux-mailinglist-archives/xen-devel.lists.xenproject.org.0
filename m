Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C106A4E25E2
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 13:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292951.497544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGiK-0007c6-Kt; Mon, 21 Mar 2022 12:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292951.497544; Mon, 21 Mar 2022 12:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWGiK-0007Zd-Gw; Mon, 21 Mar 2022 12:00:44 +0000
Received: by outflank-mailman (input) for mailman id 292951;
 Mon, 21 Mar 2022 12:00:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dpaY=UA=citrix.com=prvs=07205606a=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nWGiJ-0007WW-Ju
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 12:00:43 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86d9de26-a90e-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 13:00:42 +0100 (CET)
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
X-Inumbo-ID: 86d9de26-a90e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647864042;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fT9+Nqo66qXjVdXdT5LYsr9J1bFWUoYfg1A6b9iNCO4=;
  b=DPIdCR9bz08e4Jde9JAybzM+0RfQctLQ7CF/+eXJvRP2z6P0Ro/6bPy3
   ao0W/ivLE6rot8TteO7ZwknWkU2IlbFLaVL/ebDS7hWTF/yqtK0Sab9Ws
   S9kwdtl4PE4/1Ni/veUYfnBjIexrk0S2aeklhp46gM3KENvRuLREXZyW6
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 66672290
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Jr2Dgao9WvUcnv0o3qPYfRWPQO9eBmIVZRIvgKrLsJaIsI4StFCzt
 garIBmOaK7cNmDyKo1wPo7np0MCvpTRx9AxTgBsrC81QntBo5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 4qq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBZqfrlOISTlpkQjBMN4x8+uXHOii1rpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZRHNmA1PUyojxtnJ1AcJLwGzdyRnnD/WBcG8U7FiqQY/D2GpOB2+Oe0a4eEEjCQfu1Kmm6Iq
 2SA+H72ajkKOdraxTeb/3aEgu7UgTi9SI8UDKe/9PNhnBuU3GN7IB8cWEa/oPK5olWjQN8ZI
 EsRkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcVi4iaBzKXJoDrIF1oObwRDMtw95MUpEGlCO
 kCyo/vlAjlmsbuwQH2b96uJoT7aBRX5PVPudgdfE1JbvoCLTJUby0uWE409SPLdYsjdQ2mY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAOzARVodt/xory9U
 J8swZT20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4Mv2EnfB4wYp9fKFcFh
 XM/XisLufdu0IaCN/crM+pd9ex0pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4EbprUkUoDCLOiCsQVmKZKRW03wbEALcmeg+Rcd/KZIxogH2ckCvTLxqgmdZAjlKNQ/tokN
 FnkAxcwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:QxFpRKNLgMpLeMBcTs+jsMiBIKoaSvp037BL7SxMoHluGfBw+P
 rAoB1273HJYVQqOE3I6OrgBEDoexq1n/NICOIqTNSftWfdyQ6VBbAnwYz+wyDxXw3Sn9QtsZ
 uIqpIOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.90,198,1643691600"; 
   d="scan'208";a="66672290"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZyIANzUYdg+1LTOVwGKWhwng3XSolz0JJidMiVbAeG4EoP7JbLfzmFiHE9koiQfqPTUDgo+mvtMMTWqooS3KK91wKtodnG0lfzqK7NIX3hOoTXSvIYG5W1re3fZi3l4JNpwfC8AdtsFZHpJblPCpGjAg7Vr8C5AaF0seM+bRw8htaERVgLK5ccpUmZxnxBJjisREXEkQBasSLK8bJJNSkRr3uwcs5S0lnIxbBgxSxfGudrTp+7BzpCNim6quGM1yUwGrI3X15idsNoBwifGAzWTpd8TARvMeSZF95WuF3RvO8qFdPDkZ1PUiLpbpZMbLPWdJ3VJZtLCIv1wnZ0EPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hGARRHqBPhvtCWlzwH1mD9uf1ykPfHdbky0OxeN80vc=;
 b=bRwl0IPZoIMw58Vdoc4M91HiNBUaC60owmI2KUa6DokoAJm/dWlEXYw3AR+9uIJsQXA11WXaWtbgdrfl5WouN6lXKBvd5SPTGAaX9fupmnQJANL6adPZzdkRkb0fhx4x/bVn8hNQ6sfUij3p4iaAVFssyTK1zjFmNG2GZnpafuRDgFBpG6Wnu17632gkWitjig+t5snWW4i0EEJX+q4bO7mP4MnTc2z6BgG5Tk+c/hAn0Nv+uuNgaGngwsmADVSfvIM3C8eFpKBbGyUw8MtwwF1bHoFBk0bPW9xxpLDnfu57zgRlgXs12PQ49cqactSptrlVo8UsJ0jPhngHZNxzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGARRHqBPhvtCWlzwH1mD9uf1ykPfHdbky0OxeN80vc=;
 b=PQUGZdMq3fecsO25uS6g5X62eNuzzm90KEKTU3NgEPwXQGOagjVm0V0FTSRo8a8u+QK4QlDu3yRFHaa1EiorTNxquHM0ePGI21MNP589uGf+o8f0Eksr4Gb8mF6ErLDdJKyFoV5Dy4kZbcqxWJZCbAzxlMzi+ssN4W2Wr9hOMMQ=
Date: Mon, 21 Mar 2022 13:00:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/build: also handle .comment.* in linker script
Message-ID: <Yjhow3Y4o7M/u/Ko@Air-de-Roger>
References: <1eaec57f-7a6a-bfd2-82f1-df25f86b69d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1eaec57f-7a6a-bfd2-82f1-df25f86b69d6@suse.com>
X-ClientProxiedBy: LO2P265CA0246.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8a::18) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1a68bc4-78d4-41cb-72fa-08da0b3257ff
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6240:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR03MB624000A8220A8A6C732FEBD68F169@SJ0PR03MB6240.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tZ6sLHepw4YggnBB9PobhsWFTQoVGrJkjGs0PKJRHZ7O6G9D1QxW6oFDSRFsHqk+/vObqIJ1RiXPuF6CYE5KlmKv6JjhkLH1Mt6CC/lSnc0SErbvhcx8NjofxAq0d1p2SO5Te8wVFd2f3UJsfWkx45XD1mFak6As7LogQenOuNX91iMf0MfERrzgeFEQHK6nAZkT/nJ/ITbV8gRqfFSGFxqdjgL2/vZ2MUwWwO0SPtETc7tDR2YZd7arxV4bnP52I4dPTgu5GEEbktCfTL5hsQXjxucZ6Spfrgq1pYe4bJ9SbWpHBie9z/Daai8GxwXEQ6v+sXFpkMsVjUdoen8JOE61lBBdiWptZyIP2H+5XqX3sPy9aARRYv0oJt6yZSMvpIC2v2X3ADYDZcsb47C6Ww4TjBkxcap1o2j3EEOz/7SeEBMSdd4yhIUtm6x9rD08C+O0NrqdldZpaJEf/18EwBrQzDTUWggGPF0TsMjB9T3VQ+XEuIAT+oD7Nr+oF/+/HRSXwyhzdccIldbuarvBjEPquia8xDsidF4HFQSlG0Taj0nkQUhEd0KA8oZqqJV/vJ9J3HaMHwLh4IW+L3lbHLQPB9RLq6/LlLqJ0RVAXCX5fP2LnkpUcE7IkdoVvBW74Y+OoP5XrT+1gG/D+o1qdraCs/78q57BvAVMjckH6DfAhj4LOctYtS9osg9hN6zS5DnfMvLcruoQ+BJBFdAGKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(186003)(9686003)(26005)(2906002)(33716001)(54906003)(4744005)(38100700002)(508600001)(8936002)(85182001)(316002)(5660300002)(6916009)(6486002)(66556008)(66476007)(66946007)(8676002)(4326008)(6666004)(86362001)(6506007)(82960400001)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzFmSTZnMnh6enlrZzRodENoczNUVUhTMHJEcWdtSUNlblBSekR1S3cvZEdN?=
 =?utf-8?B?N2EzOUFra25qMHJhY1Buc1NaL0N1cStoTkdWbFduMUNoQW1idndzN2UzbVk4?=
 =?utf-8?B?ckhRWkZwT0R4b2oxZFhmSi9TVHdIajUyZmpxYjkzVXI4NXYrcWdoZDNNSlZv?=
 =?utf-8?B?T3BtU2syV3JvelJrZTJLNldTdGp0R2tSVHpHenlKNEpVU05PaFp6alFpZG5O?=
 =?utf-8?B?cVRyRWVxRUc4VDlqTURkYW9Na1dMTWIyR0M3Q2xocnZCNjZRTjF3T1Zlb2tN?=
 =?utf-8?B?NzM4OStTWmNVZFdOdk1ud3ZWNnhWR2tZSVFkUnRrYzBJWGRzaktHWExvaVJ2?=
 =?utf-8?B?TFd4azFLc2NCbkhsTFpJOVlYVXpWaVpHSzhrSjRGOHZCWE90aEhMc28vNWp0?=
 =?utf-8?B?TnJ1a2crbTBDUXdTQzJ1bU9MbGZCUXI5eEthVUQ4UkprUGJvUU1QQ0xRY1I2?=
 =?utf-8?B?SHMydmpwYXMyNC92a2wrOFZtMjVpaUczNlVsZ2tzUjUwcFVHc1hlVGNrTHZN?=
 =?utf-8?B?eFlRTFA0UXRLeVhFZXZKVDZuMVQ0UVZ5Vkg4Sms4R0IzMVdIdncrWlJtbUVk?=
 =?utf-8?B?SGRvc1RYbjhhMmhtRkZ0bFZLaGxYWHR0Ni9CSGpjYUR1M3R4ODRCSFdHaVFX?=
 =?utf-8?B?QXZnbFIvKy9NTzZjMHlISzIxOFo3emxtSkRvcW9Sa0MvcXFrM2loODBpNEtr?=
 =?utf-8?B?a2w2N21qLzV0eEJySkxyKzB2aThmeU5sajluUlZyZzUxOGVCNEtWaXBuSlFG?=
 =?utf-8?B?dXFlbHN6dEpmY1F0bjdwT2c1SjVVdm54bHZJNVluZ1pJOTRVWGpqSGhvT29z?=
 =?utf-8?B?OEtmcmhONWxrMjlGUy9EdnlTaVVXdThuTE1pODlOY2NKemtBOXp3M1p3dm04?=
 =?utf-8?B?bi9sTFVrL1pwWHd4YTJaWFpEb0N4eHFqeEx3aWwyeG5Sdi9BdU5DWmZqckNK?=
 =?utf-8?B?MVZiSVBJc3BlSWZFNUtiSEJHQ0hIT1U4dnRWdWJKWUh0Smg2NUZvU3JsQUpQ?=
 =?utf-8?B?elBjWDRzbElzc204ckxWTTU3K2tDQ3l2RSt4WE1SQlVqT2J3TTFyRDBUOHVm?=
 =?utf-8?B?SUV6VGlBdWpsa080TlV6MzBtdVB2VzBGK0RUcUEvNUZzaWVIRjc5MlhxMUlx?=
 =?utf-8?B?YnhPbFFrSUdFVmx0ZGFJanVNUUNGTlNZZVU4aExxNFhJU3JadXcxWDRPY3lq?=
 =?utf-8?B?NnV5SG01VlMyczRHMWV5YXAvdllDcGtzdnRzaWVLTzYxSkZhMzJxNzB6aVhY?=
 =?utf-8?B?a0hpbHRmVzcyQXJoQi93QlVuQ21XVjh2Q2pWT1pIVHNPYTV3dmJqNmIxellm?=
 =?utf-8?B?THhqcnpkcUJxR0lkOHZCN3RxdW41QUNWUlduZDVNTmNBOURJRnhkMzcvQnlP?=
 =?utf-8?B?bTk0eCtqK2NvWXc2TzY3ajRPYmI5ZGJEdnExQXo1UTkzWEdMeFM0MXF2RExv?=
 =?utf-8?B?WS9qZGxTZ0M3U2hLdlN1WmF0d3NONmVUWVJ6dEJlNTladGwvNm04N2ZWeUhR?=
 =?utf-8?B?TlJNbW9HL0RWbVpLWHNUNHU4RXY0UmxXcmhQZGs0NFFOQUdENHB4UHR4RVJs?=
 =?utf-8?B?aFkyYzVlb1l1Y1ZYRmhzL0xTSUNqSWtyL215LzJtbTg3a3pIUVF1MXdvdHJZ?=
 =?utf-8?B?WkpyV1U5ektyRFE4Wi9KNnFZc2tRaWFzQ3hGenY4Z0xuUml6ZTl0c1VNaUZ6?=
 =?utf-8?B?SmJvM0U5OW5GcVFOckdURGtCY3FSSjdKOERhcEtVaDZxeVZtMmduSFlTei9m?=
 =?utf-8?B?UWZMZktqMmNQMWZZRDA2RXlGMmYwem9WMFNMQ0VzbVVRQVR3dVMvOVB1MmU3?=
 =?utf-8?B?clI0UzdZS2s2NlhKenQvclZLSkVCM204UGxOWW9VQjVWcGh1WlJSNzZxYnNz?=
 =?utf-8?B?cld3T0Vwa3YvNUJEM05UYVZOdS9xT3JQVG4waGlaUDZOK1U4bXRuUjVJRjRn?=
 =?utf-8?B?RkhGM1RVWk1TSGNtQU1tR1FkZGdOUEE4Ri93VXNLSGJlYkd6NnVmZlo2OC9T?=
 =?utf-8?B?WGhYSnNGdWRBPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a68bc4-78d4-41cb-72fa-08da0b3257ff
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 12:00:07.9913
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KabUn8x9a4gZ0omDk45x0uulOUd6qZyivRoZu699lzsC4wb4RJsGjosdh7W7FvoEiIQh8w+7L3AmVqrk4G/A6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6240
X-OriginatorOrg: citrix.com

On Mon, Mar 21, 2022 at 12:47:27PM +0100, Jan Beulich wrote:
> Oldish SUSE compilers generate .comment.SUSE.OPTS sections. Just like we
> already discard such for xen.efi, fold them into .comment for xen-syms.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> Just like for .comment itself I also wouldn't mind discarding these also
> for the non-EFI case.

I guess there's a reason for compilers to add additional comments, and
we shouldn't discard those randomly?

In any case they won't be loaded, so I don't see much issue with
having them on the binary image.

Thanks, Roger.

