Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 893646F6847
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 11:29:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529649.824260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puVGk-0004jo-Fg; Thu, 04 May 2023 09:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529649.824260; Thu, 04 May 2023 09:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puVGk-0004gm-CM; Thu, 04 May 2023 09:28:58 +0000
Received: by outflank-mailman (input) for mailman id 529649;
 Thu, 04 May 2023 09:28:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1puVGi-0004gg-TU
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 09:28:57 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1469e726-ea5e-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 11:28:52 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2023 05:28:47 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6665.namprd03.prod.outlook.com (2603:10b6:303:120::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 09:28:45 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::4fc:e616:1cf0:57bb%4]) with mapi id 15.20.6340.031; Thu, 4 May 2023
 09:28:44 +0000
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
X-Inumbo-ID: 1469e726-ea5e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683192532;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3SjYCgeiKRFBUkUBBZDSAPkT9FgNhZv7QMCfPzQlePU=;
  b=YVrxyidmCpWGKcnVvSQ8DAYsf7LXlycLhoZb8RiTdS7ZJWBRMVy2g0+o
   ALvn39xg2Cu/C2yfQ8K+UeHgQhh4xX2KAOCfdSDIrl1cwmdLpa79Z5CSm
   Jng3uS4/Sjj9YfzXMJgNjS2ORTvB+032iCMbYhB5FHSoQigR+ICsPwIBO
   c=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 106594044
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:8/+nHamy59lAXDffA2U24Gjo5gysJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYXmCOO62MNmH8f4t/b4u3pksEsZeHzodjQFRrriBmHiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aWaVA8w5ARkPqgW5AOGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 fYWcD41byyEvOirmfGWb/dcj98bFsa+aevzulk4pd3YJdAPZMmaBo7tvJpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVI3iee2WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTOPlp6Iy3AH7Kmo7DzE6WlKFi8mAtXWRHPB7e
 3FE9zQwsv1nnKCsZpynN/Gim1aGtBMBX9tbE8Uh9RqAjKHT5m6xGWwsXjNHLts8u6ceVTEsk
 1OEgd7tLThuq6GOD2KQ8K+OqjG/MjRTKnUNDRLoViMA6tjn5Yo01xTGS486FLbv14KuXzbt3
 zqNsS4ywa0JitIG3Lm6+laBhC+wop/OTUg+4QC/sn+Z0z6VrbWNP+SAgWU3J94ZRGpFZjFtZ
 EQ5pvU=
IronPort-HdrOrdr: A9a23:4AJsOKEyLLSAaDbipLqE+ceALOsnbusQ8zAXPiFKJCC9F/by/f
 xG885rtiMc9wxhOk3I9ervBEDiex/hHPxOgbX5VI3KNDUO01HGEGgN1+rfKjTbakjDytI=
X-Talos-CUID: =?us-ascii?q?9a23=3A5oYlZWndslUzZCK+iHA8R52pi5fXOXfTlHnoInO?=
 =?us-ascii?q?/Mmx0Ef64bEGg8bhcqcU7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A3nvAsgwrc4lbH8+P5poBu+fl0IuaqKOCJE8Er78?=
 =?us-ascii?q?2gva/GmtSH2eg3DmpXJByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.99,249,1677560400"; 
   d="scan'208";a="106594044"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aU8cJwsCVGaNz4grwnsgSMsATAvip8qDZxxOl9rN700sWG5GoGd7eUzt93eQgCrRbAgM2OEe2xQ0dzXve1sDrthvkHxQVWi+7nv64O8IyM1MwBP2QB+jzTYZ7kUAzFu8goWaW+AGLLAizniEYZsG45ZhWtiRdErtTcutbHvhutJ/2CC+HwxJWHGmj2cikUs2xlIu0o7n0WCs/QhJIkX63NJkukwe5FkMHgRKJowb592egqazi8XOg9ii6PeQ8dPq7et5eNuT3zebM/Ma+n7lYOpuGDra1CXcRzO2Xi7NV5TtrKEL9S2C0aJfsGNLUf8p2HUcJvLsFq+F1L4syk79Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SjYCgeiKRFBUkUBBZDSAPkT9FgNhZv7QMCfPzQlePU=;
 b=TgZU8yiUIjlX21UkprydHslXERHz794xIeVWQmB0sEOMNYzwm13cx5SR1ESUV0EAyS+VVEi2WPBzuPSGflL2Qebxnm+SZqUuRJx9A5kasADsdYH8AtiDE7uL0nPpwNyydCYjFi0af8vBY0Ctrx7F/R49lH3S/Ct2Ww5w7MWNUOsLDJ0FbLGY5tgUY683iWnmU434R+aV/NLRAjOYxFTJrMv+cvhFmqH0U57mQt5xUIVIi5DMzvOvWC/9Y9I7XUfmQngHJ6a8RXF6Tm7azRSNadlCpKG5ALXpFpsVhFyyC2Kui4Plo95Z9UBtUQ6yFi6z337jCM1cS7FJKcL1DET1PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3SjYCgeiKRFBUkUBBZDSAPkT9FgNhZv7QMCfPzQlePU=;
 b=PGZHLRspaaQKWH6j2L3fJVi0H3omcq+yI6zsSXYC1VLeTQnC4mwLOkHflsfZ/8WekKNVanqd3o2+xqRst+RYSQeUFITYQwUidOfGRo+fNsa1hyul2GcJQ8HzLBCiZ5sahSG3zlsqWdbY0okctEdXtiraPq8jd7ihLM5z0UwFFzA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <575505d8-b6bd-be14-a70c-547d4229ad90@citrix.com>
Date: Thu, 4 May 2023 10:28:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/ucode: Refresh raw CPU policy after microcode load
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230503185813.3050382-1-andrew.cooper3@citrix.com>
 <ccf68f0f-6fd7-a9a4-ef72-03999d11035a@suse.com>
 <b655305f-293e-a0dc-ab39-36b0c9787433@citrix.com>
 <ZFNrW5a/aY7a3KTs@Air-de-Roger>
 <7e159a5b-b7be-c582-7300-154cec7a8e91@suse.com>
In-Reply-To: <7e159a5b-b7be-c582-7300-154cec7a8e91@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0346.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6665:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c3be7a9-d59f-49a9-e14e-08db4c81f47e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K9XBHQej91rQizQR9sGHII6vqzLm4tTg+KM+WQHnAafqQ6ojzTob9ZkCHVx0G6nwz2X36HgcO+ZHDqwHUAfXuOcyMEgdSR8JAWbPXU9w/pGnUZBcFLhOx7TimFkL4ILs9Ms2dWu/tkhSF6l8mm5v6i6njrpmVZoUoK03vOeeur+t0br2WJYoq51223xW5kv2IiPhVKnQL6e8OGmwNmSulcO0niGUGkWTFmjJLfT+Hm5jx14Mpvix8Rq4DHqVTcYhxTjWZiEloS6LUsOiGB1+KxLEmp4GoUCKAT6S8Q8s5Ds1lP0doZUWm7nABg6bEi+aWLNk8ab2WVXmTFj1vfC2ULo+GzBKZSg9TX9RlNHX9V4ZZR/sR6Co3Iepiq1XMEcxAOX3HF07oAeAfO/oraUPz/ldB4pPbStY3Pv3nW06hdd7xBnLSzk42nm1+srK0EpUbL/XCl1alf2Z900EJDAFuXC6a+WyvzuLXM8d42hT9jNc/JW9TKtkyj2dtW/YrZmOGg2OIrENSrVBYu7Hv34OitrrV9TT7T4HWHbvFoUiNzfMxwjS/oANIq+kDNIEGaHmFbHHvdSYsUbRcp2PM7Iwtwj3WO/ZGNOBW4DdI+VM23ZjZmLzSWodtDR3i9wLaxRKfsnNFa3jdQ5Prm5BLUXw7g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(6512007)(6506007)(26005)(53546011)(31686004)(186003)(8936002)(2616005)(66946007)(8676002)(2906002)(316002)(41300700001)(83380400001)(6666004)(36756003)(66476007)(478600001)(38100700002)(4326008)(6636002)(86362001)(82960400001)(5660300002)(66556008)(6486002)(54906003)(31696002)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzFRQWNaUERqRXp6ZjJPdkF5S0QyRWlDcURmb2ptQUJtWWJCM0d3TGRSTGZD?=
 =?utf-8?B?T1g2TlBtem5uOVNwYlZCVnFCcDFYbDVMb0xGMDliUXRvNEpjWlJNV0tVdGNJ?=
 =?utf-8?B?bFh4cFhaWTlnMzBHWktod29QMGVFaUZ0dUU3NkJPekFJQWkyTGhqNHBxU3kx?=
 =?utf-8?B?ZTZKQ0ZUeXpCaGduM1VKTDJTdlk2Q0dMZnFQS3AzUEt4UURLQzB2em5WMWU1?=
 =?utf-8?B?RmFha2NiZWpvekJwa2Y0ZkFtT0pPVlhUNWJQajdGVm1Iak8vcUVjOUpicHNT?=
 =?utf-8?B?akM5c1Fja2FRYUdtM3RPMzR1WXpWd2ZpbkEvd2VFT290OVFiSTF0MldZdWxH?=
 =?utf-8?B?UEx3VW96MkpRY1JiWHRrWjkvdXQ2ZkdJN0QzczBkWjBDVTA2TVRzM1JxSEtX?=
 =?utf-8?B?K3M5blRwZEpJNStVMHp4YWIra1U0aExlcEdJM1Rkd3pJRENCQmxoWm1MZS9x?=
 =?utf-8?B?bmI3R2FVOHVIMGN3c1lpZTBYNWZHVFdaVWlvZVpmSU02SXZuR2dKQWtvVHp2?=
 =?utf-8?B?anZCZTdjKzArc2FPdlZMWlhIQjJRbzhoS1NFNUQ2WlQ4TDBsQUZFNzA3YVlk?=
 =?utf-8?B?Sy82MWN2aVgzZkJpeHZhSU1OVTcybGRWOHJMa2dKcWQwaTZFNGI0MUovVzE3?=
 =?utf-8?B?REZqVXJBOGVZeTFBbndhYmtyZEpFZWh3ZzE4dmdrd1E4Ri8ydUtTbzg4blNI?=
 =?utf-8?B?aE1RemRLS2NaTzkwNHZyckVKcDRiRi9xYWhDaGpjZ1FWYjMrRi9idzNyOTdU?=
 =?utf-8?B?NXl0NkMwQjFyZm9OUng4K3dRSVRwL1VQdXR1NDhOTVRJeGJkeGVaZjQzK2RD?=
 =?utf-8?B?b01oc0RnNkZuT3grQkt2cDFoTE5XZGhUSm1IejdSZk8zQksvc29FOUphV0hF?=
 =?utf-8?B?emE1L1pPZUJRVUUrd2lZamwwMit1SGIrSEhrTXhYakpraGNLeG5acDNycERy?=
 =?utf-8?B?U0pZbiszWi82aDVqVUd3K2trTzAzbytDUVgrYkR6VzZYN3NuYXRKb0haQVJr?=
 =?utf-8?B?cVR0TW54RlJXTDYvbEl3d3RxaDhCelZzZE9LQ21rTHdjL2lNWE5aVjdTdWJI?=
 =?utf-8?B?MFJYQktvT3hqbGJaa0taVmYxSElyRFJhQUZsN08zbXJUOVZac2N3bHVOQ0Vr?=
 =?utf-8?B?N0pnam83SWtzZUlWL0RnZjFyMEcxOHpyV0d6ajlac0hmWG9qb3RlYlMzdFdQ?=
 =?utf-8?B?UjNaaThaTEtaVjM4cWFkZllqYzBXN0dmdmswVjVCd0hsdFRuOFk0cS8zU25W?=
 =?utf-8?B?WWk5dHdwclN3TTQ2T0laT3d5TGVLVm9Wd09iYTVBRldxZ2ZLOEZ6ZGg4VSt6?=
 =?utf-8?B?MTZYdjlicHNxd3ViSnFFdExRRDRjV25GNElJUHFuaHZ3SkxMeWNjaWYwWGIx?=
 =?utf-8?B?YjZpeU9qWHBHZUtLYkZUaXpUbWhKUFRTSG5nSGQ4VTlBU3E2Um5wSTBNWWlE?=
 =?utf-8?B?bGtjZ0dBTnJueitzaHRWMEY5WlNtK1p2QXZXdjFuYnRHRStyTEg0M0t6UTB1?=
 =?utf-8?B?MUZwZ3ZRVTVuaFJOd1N2ZUJnbjJJa01ib0RpNCtjTHlnVi9hc21BUlBaL0hX?=
 =?utf-8?B?NkdVbWF4enMxOXE2SmpqYXlrTzYwekNFekYrV1VHVFg5c3M3K240SjdxcDlK?=
 =?utf-8?B?aVRBOWVyTXVmdlRnOGRkcmV6WE10dU50eXd0TGpMeEJkaEc3VEtpNjIzU1RQ?=
 =?utf-8?B?VlVaZ1BqS01zUEh6dUNEYjc2MkxnQUJkaStnZFpoNlBZTHd0WEwvbE5FZVFS?=
 =?utf-8?B?aDVVak84RlhPRHNzdm1FZ3dFK2lzaEljcTQ5OWRYaWtzbWJmYnE5cXozZnRt?=
 =?utf-8?B?N05wMERxQVBwN05XT2oybnBsWGlyTk1jRjd6eWprQ2tXZEpDeXVHRnlKQVA2?=
 =?utf-8?B?U0NQaEFIZWQ3b0NpdVViQ0F3cG1zN3pkUkMyaEtIVG90dW0xYmx1ek82VDVE?=
 =?utf-8?B?UllzMnR5K2tmdis3NFBtVGI5U0NIeXN2U2h0MEJmOGVCMVQrczdSVjBBZFo4?=
 =?utf-8?B?d3dyQmkyTVEzbUlmRk1rN056S1pNUHRrNW1Xbnd6L0tzcmpDSENWYUwzNGpQ?=
 =?utf-8?B?Y1Z3RStUVDJJMUJzczRGUlA5S0RQTE1pRWFSUlpuYUgwVS9qbWh3WmY5L2tH?=
 =?utf-8?B?YUtjSHdLanpuN2NKbnJaZmhNaENlOUR3M3dnSjZCUEJXSTNLVE5UcmdvNVhp?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7roCAQXfQ1HPgdojV2gaspnJW9JjH2WFu763yHNCa0zyuM4xrviotWfQQm1UgvlzDJFQYPdP8ISY7qoCvcxgr0CoYm1pCufCUdeHD8WaHq/uiX6XDcUI1npewKWftibyL4sks25zlZCCjA3D1ZAtmEiKAGFXLboY1EnzFoYMsYIBEJ/LqyxhXCV1hyiBQNKqv/ZXVheN0nw5gAJw+CNQuOGSTJlWW5vdSxvTmmx1a9dNu/lmyV05SgLVXCGdIOcKP4V3Dh+wzoom4WTlHOsRU2hEiTYuwa0Y+dUvmlBor7V7c0Ndi3YqcrwH1O6XvU6kQixDGraiqaWwJElc1h5gAiaq/Rg8a9OcvI8DlS8BuDCnnAOuV6j17+iYqCBnSuNYnih9UFRBSzFjYSMbVQViIXREGueL7v2KQn3KMwy96BRBuU4vIJaqBuqizLv4XBSIxvILUY8qm6gW89F6sd8ekFGlXTD4waSzvA1dxi7VZEfxZXV6BWdFvifHPNVGQgndC9ugunNwFvJb+K3xnnC8i7H0scuFPdkKlFI0Ivnf92sWkSl9i2rPK1flGvYk2TJDWGpftIGKDqA2JHDZGHbM+VETdSBO/3/tiT14oqd56V3OLkDCAMPFJqOKfSINjQPNbgZSweUGCnx8Oe25cI3hIp52bvTQpnpfA/pdmbjo7lsPKLCQJFcRcS6olusZ5z7lzHng0Pt2CXhD7jbUCDXsoEMh9iHYMGMqWUobN09UKzoQGKSd3sgEO1xABXVg8MLyVwkq/UXN9ZYDaoZXX1CjkFL/Jwj0dv9Wy9C3NoTexHTvZfMBaWd971mwrIjDmfzc
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3be7a9-d59f-49a9-e14e-08db4c81f47e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 09:28:44.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2197Ocdx0mihdrzx9end/aI/r8DBHdLfxm7DhdrZ7gnhKHeCAwSEa5uiZR7jQaQMTzMHRtyneJqAT9LvKAHt2tesrrJZGHwtNU6bPqbqe2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6665

On 04/05/2023 10:07 am, Jan Beulich wrote:
> On 04.05.2023 10:22, Roger Pau Monné wrote:
>> On Thu, May 04, 2023 at 09:08:02AM +0100, Andrew Cooper wrote:
>>> On 04/05/2023 8:08 am, Jan Beulich wrote:
>>>> On 03.05.2023 20:58, Andrew Cooper wrote:
>>>>> Loading microcode can cause new features to appear.
>>>> Or disappear (LWP)? While I don't think we want to panic() in this
>>>> case (we do on the S3 resume path when recheck_cpu_features() fails
>>>> on the BSP), it would seem to me that we want to go a step further
>>>> than you do and at least warn when a feature went amiss. Or is that
>>>> too much of a scope-creeping request right here?
>>> You're correct that I ought to discuss the disappear case.  But like
>>> livepatching, it's firmly in the realm of "the end user takes
>>> responsibility for trying this in their test system before running it in
>>> production".
>>>
>>> For LWP specifically, we ought to explicitly permit its disappearance in
>>> recheck_cpu_features(), because this specific example is known to exist,
>>> and known safe as Xen never used or virtualised LWP functionality. 
>>> Crashing on S3
>> Printing disappearing features might be a nice bonus, but could be
>> done from the tool that loads the microcode itself, no need to do such
>> work in the hypervisor IMO.

Xen is really the only entity in a position to judge when stuff has gone
away, so this can't really be deferred to another tool.

We have the X86_FEATURE_* names during boot for parsing the
{dom0-}cpuid= command line options, but we don't keep this beyond init

> Except that the system may not last long enough for the (or any) tool
> to actually make it to producing such output, let alone any human
> actually observing it (when that output isn't necessarily going to
> some remote system).

Yeah, `xl dmesg`/serial/whatever is the one place liable for anything
like this to get noticed.

~Andrew

