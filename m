Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8458150BC0F
	for <lists+xen-devel@lfdr.de>; Fri, 22 Apr 2022 17:48:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.311073.528081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhvWW-0002xG-4B; Fri, 22 Apr 2022 15:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 311073.528081; Fri, 22 Apr 2022 15:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhvWV-0002v9-Vl; Fri, 22 Apr 2022 15:48:43 +0000
Received: by outflank-mailman (input) for mailman id 311073;
 Fri, 22 Apr 2022 15:48:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QJ8Z=VA=citrix.com=prvs=1040bc4e0=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nhvWT-0002v1-V5
 for xen-devel@lists.xenproject.org; Fri, 22 Apr 2022 15:48:42 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac80203a-c253-11ec-8fc2-03012f2f19d4;
 Fri, 22 Apr 2022 17:48:39 +0200 (CEST)
Received: from mail-mw2nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Apr 2022 11:48:35 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6512.namprd03.prod.outlook.com (2603:10b6:510:be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 15:48:32 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 15:48:32 +0000
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
X-Inumbo-ID: ac80203a-c253-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1650642519;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=fMwHEW/+JGqk/dqMyB+HGMMvFjIOrVKhp13aUjBXZyw=;
  b=JQDG/M3NJ0Hgilq2Uerllm1ultDbTt7FEnpHan/riviRnoTL+CiG5jpv
   wkwV8CCj4+COjfQMT2vurZJ8YEBdjd9LmZ7xWKfAl+sxmEGGk9bXW66Pq
   amcn8UTgp4aQTaYEnMi+VCSI5+FiFVdN4vnvrlyL3drjVT/4jSvL8wsr5
   c=;
X-IronPort-RemoteIP: 104.47.55.103
X-IronPort-MID: 69592658
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KOleaarmHQG6Hj26JYRqFdBrf2ZeBmIfZBIvgKrLsJaIsI4StFCzt
 garIBmAPvzfZmLxL95yaIWw9UlS6sKEyddnTlZp/y5kE39A85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvR4
 4mq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBYofxmv0jAzdhCQ5UZPUcpueaPmmnmJnGp6HGWyOEL/RGKmgTZNVd39ktRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFgXFp3psm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrL9PdmuTaOnGSd1pDqPcTXfICWH/lS3U+Uj
 DvKzmHFIzMVYYn3JT2ttyjEavX0tSHxVZ8WFba43uV3m1DVzWsWYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiGGAlg4RXZxXCeJSwAOC0K3P+C6CG3MJCDVGbbQbWNQeQDUr0
 hqMgInvDDk26LmNEyvFrfGTsC+4PjUTISkafygYQAAZ4t7l5oYukhbISdUlG6mw5jHoJQzNL
 /mxhHBWr90uYQQjjc1XIXivb+qQm6X0
IronPort-HdrOrdr: A9a23:FcVUD66o5KFaBo5x9wPXwVqBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HkBEClewKlyXcT2/hrAV7CZniehILMFu1fBOTZowEIdxeOldK1kJ
 0QCZSWa+eAcmSS7/yKhzVQeuxIqLfnzEnrv5a5854Ed3AXV0gK1XYcNu/0KDwVeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VJN1xNvdfWVa9Ny4lDgqpUCfaPZBCHU7xgLjKx5hwzN2WWfUzvekPcd
 L6IRlliVI=
X-IronPort-AV: E=Sophos;i="5.90,282,1643691600"; 
   d="scan'208";a="69592658"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xnjq0KEDHHPmMmvI3AwUY9vLB/9qWqKfz6b1avEweEeeXbBbFTqc8JQnY8lMyr3eqlsYq9d8lIpoc3IFWc8oyp47HPSV+jR4Oky77TSB7DKNigmk2gavPyZfQOYWT+Yb7ONyqVeHqVL2WMoF2b4LxDnYHyNfQW6Ggrl1nLMPeO/rTXVrIC8//cbyXvSPC0UuF0UFxAem9i3PbXoG0SIGkBhRITG37ZPOb2x8tguh22ZXK3/0dTNDGtVkl4uhnmKyxbb5mUqV0Tbf10Ydj3wG6IC7LgzE3mkfE5CrjoNgfzvZmQchIi8u8T/T4TjpnOptUzEHrPLfPwrux/TqadFT6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sd/I353whyT6eDqonLgykwRUjWz+3qq0b6Tk9+xDv7g=;
 b=HzLUTbuzaVivMW/3rDlHo4aRhdNyQ3b605VpxsHpHRI3WbkZJi0k/rfPnCKWw/bYsHiiPgz6M0t5xMqWB/H4CfNecGoiIeoHnqHRWhaDAJsyhtC3i0QnbPgKGEUlgNeaWJwJJfM88jlsBQI/bxElHvdiuZ8WtKa3bzv8IXQ6pJKIieSFueEFsw5aNJPeAJ1zpchd2/V5qcU8Y7w91mToneaf5I36+0YIEnheT+beZFTJ5BuoUZ9NAevncK9xqKejtUwVUdDwJ6QaYGdcsyDQMtej2W397Wqodpl3EO72Kz+qqMnvkrUxBhntLjLbdp6BoPHoh4IUivlgS7jjjGaxiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sd/I353whyT6eDqonLgykwRUjWz+3qq0b6Tk9+xDv7g=;
 b=J3BOKNJWU42uuz5+97zZ5HZuXCoPA9nQdF4T5ulwjPXkfaS+ko2qvtBThW9sHgP5FRmmIvCIh5fSud83UPfyBoNOY5D5EiBR9PDoPfdT3nyDQhDqEawLtneXHoG9otgulW47BYMa21eLXy8m95c75lglyHCwwNMnx2viZm9BpLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 22 Apr 2022 17:48:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH RFC] x86+libxl: correct p2m (shadow) memory pool size
 calculation
Message-ID: <YmLOS+fKRxQ9BXc2@Air-de-Roger>
References: <c5844665-8ed7-d91f-a41c-9e4eb3e2bcc2@suse.com>
 <YmKOMC1TcQQUB6Lx@Air-de-Roger>
 <65e4428d-f89b-88c6-885c-7c0347e52861@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65e4428d-f89b-88c6-885c-7c0347e52861@suse.com>
X-ClientProxiedBy: MR1P264CA0091.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::28) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74626e11-5e4e-4ac5-170a-08da24778db5
X-MS-TrafficTypeDiagnostic: PH0PR03MB6512:EE_
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB651234268095CC34A0C4E3CD8FF79@PH0PR03MB6512.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xqA31e1Vk3kOFZL7KLB0c/iXxmyem1+H/eFy7lnCbyVmgz0Al6xKTs4MMqHJ6UmjUSm7cAGlv4B0TPFpL5+BhRLPr9TsnAyGMS+DxkJZHXRce49p9o/JjB+0f/P3z+hQnnDXtj4D6KgEh2wbIUMyzOYISQdHVtY07hIFPAc2+U9KQ/aMwkxJ9vsiMIIpPfGhSvj9AvxeTVZzedJ8NDcbqg1MFE0E3KumBnj7bBGON+qCD6lvy15Z1y5y8vYM7YVR9gc8JFCwwhFW8IdWkSew63SSaOx79w05j+vJ385nZqnrvTgEBaOB06+1DGDig57lpi4qiZIqRHfB+xjzl5334dRnV4hj1NhuQ65dmMKlk063YMbjOulonHDiC641CXhIYU92jOG1II8cqX9gON5ZTjtpLvndcrxB+JyChyAVKtUeOF3Y+Xlr4ZrM23reCjpVlK0M67LaQ9vEVAo7dxne1rmD7lTgo4hJDeGDIgrX+8VZvo8Di8wI1b8ZCMi98fz6o5oG5EWWBt3PoACXlDi5uoSn0/vcVIPrk+HUmZkyQIT/ZJbLpwdWzmIDpR7JF75XPo4c8qMdM8+jOll0ykFwkgT+6PEw1s4/neWoAPS6/LyKccJes2rI0RrBwy1bF1Di/AjILQOdaxB7/kCjE/hzzwoqRcgpX1HCfqjbdJhHPzNJe7ARmbU5C+siqGnrhxlpcThxpoBq9e0PICOiHHvhJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(316002)(2906002)(186003)(53546011)(54906003)(85182001)(83380400001)(6486002)(508600001)(6916009)(38100700002)(6666004)(6506007)(4326008)(8676002)(33716001)(9686003)(6512007)(26005)(8936002)(86362001)(5660300002)(66556008)(66476007)(82960400001)(66946007)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nnk2SXpmT2FFT0VjQ3BvbHVWTzVxVHhycjR5eWZkdGVJUGVYZjZCV1A5aUJQ?=
 =?utf-8?B?QVlMeVR6T0gybG8xZnoxcHo4Y052Ly9JWmdyNlhFMGxsdmliQW12TDVqSGky?=
 =?utf-8?B?RVhERWhiQVBBVzhNZklDM2Fha3JOTWQ5eVRNSXlOQ1MwQVJlZ1hycmU4eExm?=
 =?utf-8?B?anNlQnpqMzJwVjFMZkQ3M2RTSEFxM09OVVFUT1Z1Mkk2RVR5b2JkR1NlNk1p?=
 =?utf-8?B?QU1LMnI4U2dvUzA1azVBa1ZERW5IUklBVm5MK3NJUVFhOWxOY0t6VnpwSlNo?=
 =?utf-8?B?a01VRFEySk51MG5SaUxZYXJXY08xUjZIN3lwcjdVeUFuVnhrMXVZZDh2VEZ1?=
 =?utf-8?B?Tkp5cTRJdm04UHZVdkMrUlR1SDdXZWM0dHdFaHZEWnEzRkxQVS9HMnpSVVFF?=
 =?utf-8?B?R3FUVStRVDdBSUY0M1N5UXROVWZsNC95U2FsQmpEeFB4bHBiVERIcUs3MnJW?=
 =?utf-8?B?Zmd5d25SQWNST01STDBSSXpZTFViMjNQQmNveTh2ZUlnUEcxWVBVaTRuYksz?=
 =?utf-8?B?T21razRmYWJ0Tk1tYUp6V1lVYnpHaHpuemwwMnA2Vmo2Vk1PUFdXM1lHM0tH?=
 =?utf-8?B?WW1KTmZxd1hDUlBQZlkwVm1kd21xY29URnd4eVVhVFNnVmtxVElZalcrU1da?=
 =?utf-8?B?cGJSLy9oV1J2MEhtVW40Ni9UcmUzMWp4Q1E4VEwrQXV1Y0tTTzRXT0VwSzUr?=
 =?utf-8?B?REQ5cEFML1pObk5qdlhHVG5mTkZJaTRvcXpFdFAxTnNWMmtQN1ZWN3M0bWRh?=
 =?utf-8?B?NkVHeDRzTlJhRjFJRlRFL1o2WE1remh5OFB5UG0wWHdWQVZkUGNjZEt6cy9m?=
 =?utf-8?B?NmhVNUR3UnBLaFFLOUt0UlZzb2QydXhtRkR3NTEybDFVQ2RJNnpYRGovcnRK?=
 =?utf-8?B?dVI4RUZMOURwcGJCVUpYSGFOOEQzNGt3NllKcG5yQk9vSE5NNjVqRUYxNWtn?=
 =?utf-8?B?N0gyNExqUml4Q0h0c0YySUEvOFppdTQ3QjBBUWdtNjZkQXVZdEh6WmlJejhP?=
 =?utf-8?B?WEQzSk9pbTdmZlZvaWwycUhudDlCZWV0ZDkvQWFjSVhmT3RHRmUyTGFEUUlK?=
 =?utf-8?B?WUNhM1JTZkR6YnQ0MG51aWRSZFhYMnJwVDZ6MklUdUhJTjd1UWcwajJHL09Z?=
 =?utf-8?B?VlFRa0xFYmJMZDJYL0I2NURKTEZSUnZvYmJWNmFxdCt5bFkwOEowSTVzTkZi?=
 =?utf-8?B?V2lUelFrckRtQ0FPUGFrVzMveElnQ09tbTFGQ1A2QWhvWmc1VFhoZGs5V3Nq?=
 =?utf-8?B?YVh6LzBrTHNJcWJhS3QyMVFkTWx4Lys3K3lKcXREa2htTXgyYVpXU1c5VjAv?=
 =?utf-8?B?aXhWcFhSZHg0bjVKbW1mYW53OEUzZGQybHhqbG83eHR3ZDc4YUVyRVA3bW5r?=
 =?utf-8?B?Vm5PcDduTGRDclplc3Rodi94d0ZycHp0ditBbG9uTi9hTVl6TGc2N29vRGJP?=
 =?utf-8?B?WFRQZ1pHUnhuU2k0VU51UldGbEp2NElEOG9POXZWc2kwQ2I4RnkzNnZuT1VZ?=
 =?utf-8?B?RlRLcUpZQ3BQajI5UDlzN3ZzbnNva3pQK2k4Mm1Gemd2dHJ3aG43SFRMSlho?=
 =?utf-8?B?OEYyT0lVU1Qzd3NaalU3cEZ6bW5ZZU0xWnJseURSbi9qdTVhbWhQZ0dVYUlG?=
 =?utf-8?B?ZExRZE9zVHZqK2xuNXhZT1lJRlIwZHYzdEhqcXd3UWJzSXdGNWlKQTZSdXA3?=
 =?utf-8?B?NytyVU55WElsQnVYNDRHNTdwSk9VczF4elFJanp5Z3dOUXNjRmYrdFd6Mitq?=
 =?utf-8?B?UjlqMjlnT21UTExnT05ramFrcVB4VzltNnNPT0FpZ0RWV0JCbjdkUXByQm0z?=
 =?utf-8?B?TnFzWm1meUFpNEFlZjRKVTNTa3BrMWtTSnVkb0RLMHAzL2RnMHBMR1NheXhn?=
 =?utf-8?B?c28xZjlqU3Z2NU82bW9CTVhqZXBWcFNKNTZGbklhQ1h1dVhjRzh2NmhZb2dw?=
 =?utf-8?B?NHJaclJFMmRBc1ZmdHBGc1F6Z1JIMWRveC9zWDZ2Rm9vSlNBQ3ExY1BGM242?=
 =?utf-8?B?anBrNmM0YXF4S3N4dUIxWjJvWVdLU25UbnVISEVFT3FEcS9pTWwyUXRsbU5Y?=
 =?utf-8?B?UzVQN0puWEI5SkRCMGtrSVZoY045aXZDRmRKWSsxYlRBVk16VFFadjhaQmZF?=
 =?utf-8?B?U0VubUJmN1RvWlF1UEM4WWR2b2dZUFU4OWw4emE3b2NrWWtKT2RORmx3bnZO?=
 =?utf-8?B?RVhRUmgvRlBTNG1ZSkd0ZG4yREM0ejRkVDMyaXJnY0tON3FzRXRtKy9XaFRW?=
 =?utf-8?B?Q0RIbkFHOVpjT2pLSWZQbW5mVFE3N2NHSlZhZDFuY0d3OWlXMXpUTGUrNEJv?=
 =?utf-8?B?SmhlTm1vQUpTZHoxSjJObzdWYzYxeTZpYnd4K2gwNzJoRjhhd2Fadz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74626e11-5e4e-4ac5-170a-08da24778db5
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 15:48:32.6478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtljbZ9xLc383py6aBSBL+qMH44/CN/DcHrxaBJJLY8++zKItgLojnJBivMDYMsWiRvkKThoHp/v/3ZTzLM6UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6512

On Fri, Apr 22, 2022 at 01:56:17PM +0200, Jan Beulich wrote:
> On 22.04.2022 13:14, Roger Pau Monné wrote:
> > On Fri, Apr 22, 2022 at 12:57:03PM +0200, Jan Beulich wrote:
> >> The reference "to shadow the resident processes" is applicable to
> >> domains (potentially) running in shadow mode only. Adjust the
> >> calculations accordingly.
> >>
> >> In dom0_paging_pages() also take the opportunity and stop open-coding
> >> DIV_ROUND_UP().
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> RFC: I'm pretty sure I can't change a public libxl function (deprecated
> >>      or not) like this, but I also don't know how I should go about
> >>      doing so (short of introducing a brand new function and leaving the
> >>      existing one broken).
> > 
> > You have to play with LIBXL_API_VERSION, see for example:
> > 
> > 1e3304005e libxl: Make libxl_retrieve_domain_configuration async
> > 
> >>
> >> --- a/tools/include/libxl_utils.h
> >> +++ b/tools/include/libxl_utils.h
> >> @@ -23,7 +23,10 @@ const
> >>  #endif
> >>  char *libxl_basename(const char *name); /* returns string from strdup */
> >>  
> >> -unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned int smp_cpus);
> >> +unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb,
> >> +                                               unsigned int smp_cpus,
> >> +                                               libxl_domain_type type,
> >> +                                               bool hap);
> > 
> > Iff we are to change this anyway, we might as well rename the
> > function and introduce a proper
> > libxl_get_required_{paging,p2m}_memory?
> > 
> > It seems wrong to have a function explicitly named 'shadow' that takes
> > a 'hap' parameter.
> > 
> > If you introduce a new function there's no need to play with the
> > LIBXL_API_VERSION and you can just add a new LIBXL_HAVE_FOO define.
> 
> With the original function deprecated, I don't see why I'd need to
> make a new public function - my fallback plan was (as also suggested
> by Jürgen) to make a new internal function.

Yes, that would be fine if there's no need to expose the new function
for external callers.

Thanks, Roger.

